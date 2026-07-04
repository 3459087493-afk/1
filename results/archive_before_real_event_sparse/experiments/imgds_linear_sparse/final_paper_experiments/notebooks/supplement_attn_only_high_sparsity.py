"""Supplement: run attention-only Q/K sparse for teacher-required sparsity levels.
Copy-paste into a Jupyter code cell in the Docker kernel and execute.
Only runs SOFTWARE simulation. NO HLS. NO PYNQ."""
import sys, os, csv, numpy as np, time as time_module
from collections import OrderedDict
import torch, torch.nn.functional as F
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, roc_auc_score

PROJ = '/home/cym/prj2/finn/notebooks/icl_thesis-master'
EXP  = f'{PROJ}/experiments/imgds_linear_sparse'
FP   = f'{EXP}/final_paper_experiments'
TABLES = f'{FP}/tables'
os.makedirs(TABLES, exist_ok=True)

sys.path.insert(0, f'{PROJ}/src')
from transformer import LinearUNSWAnomalyDetector, _UNSWLinearAttention

# -- constants --
D_MODEL, SEQ_LEN, INPUT_DIM, FF_DIM, N_CLASSES = 16, 16, 64, 32, 2
MODEL_CONFIG = {'input_dim': INPUT_DIM, 'seq_len': SEQ_LEN, 'd_model': D_MODEL,
                'dim_feedforward': FF_DIM, 'num_layers': 1, 'num_classes': N_CLASSES, 'dropout': 0.0}

# -- load checkpoint --
ckpt = torch.load(f'{EXP}/checkpoints/best_linear_imgds_dense_r32_p8.pt', map_location='cpu', weights_only=False)
state_dict = ckpt['state_dict'] if 'state_dict' in ckpt else (ckpt.get('model_state_dict', ckpt))
X_test = np.load(f'{EXP}/outputs/imgds_r32_p8_test.npz')['X']
y_test = np.load(f'{EXP}/outputs/imgds_r32_p8_test.npz')['y']

# -- Q/K channel importance --
def qk_importance(sd):
    imp = np.zeros(D_MODEL)
    for p in ['backbone.layers.0.attention.query.weight','backbone.layers.0.attention.key.weight']:
        imp += np.abs(sd[p].numpy()).sum(axis=1)
    return imp
imp = qk_importance(state_dict)

def active_channels_for(sp_pct):
    mapping = {0:16,10:14,30:11,50:8,70:5,90:2,100:0}
    ad = mapping.get(sp_pct, max(round(D_MODEL*(1-sp_pct/100)),0))
    if ad >= D_MODEL: return list(range(D_MODEL))
    if ad <= 0: return []
    return sorted(np.argsort(imp)[::-1][:ad].tolist())

# -- fake quant --
def fake_quant(w, bits, intb):
    if bits == 32: return w.clone()
    s = 2**(bits-intb); mx = 2**(intb-1)-2**(-(bits-intb)); mn = -2**(intb-1)
    return torch.clamp(torch.round(w*s), mn*s, mx*s)/s

def quant_sd(sd, bits):
    if bits == 32: return OrderedDict((k,v.clone()) for k,v in sd.items())
    q = OrderedDict()
    intb_map = {16:6, 8:4, 4:2}
    for k,v in sd.items():
        is_w = 'weight' in k and v.ndim>=2; is_n = 'norm' in k.lower()
        q[k] = fake_quant(v, bits, intb_map[bits]) if (is_w and not is_n) else v.clone()
    return q

q16_sd = quant_sd(state_dict, 16); q8_sd = quant_sd(state_dict, 8)

# -- monkey-patch (same as progressive notebook) --
def make_sparse_forward(orig_fwd, active_ch, dm=16):
    mask = torch.zeros(dm)
    for c in active_ch: mask[c] = 1.0
    def sf(self, x):
        q = self._feature_map(self.query(x)); k = self._feature_map(self.key(x)); v = self.value(x)
        m = mask.to(x.device)
        qs, ks = q*m[None,None,:], k*m[None,None,:]
        kv = torch.matmul(ks.transpose(-2,-1), v)
        ks2 = ks.sum(dim=1,keepdim=False).unsqueeze(-1)
        nz = torch.matmul(qs, ks2).clamp_min(self.eps)
        return self.output(torch.matmul(qs, kv)/nz)
    return sf

def run_inf(model, X, active_ch, bs=512):
    attn = model.layers[0].attention; orig = attn.forward
    attn.forward = make_sparse_forward(orig, active_ch).__get__(attn, type(attn))
    try:
        logs, prs = [], []
        with torch.no_grad():
            for i in range(0, len(X), bs):
                b = torch.from_numpy(X[i:i+bs]).float()
                lo = model(b); logs.append(lo.numpy()); prs.append(torch.argmax(lo,dim=1).numpy())
        return np.concatenate(logs,0), np.concatenate(prs,0)
    finally:
        attn.forward = orig

# -- baseline Q32 --
m32 = LinearUNSWAnomalyDetector(**MODEL_CONFIG)
m32.load_state_dict(state_dict, strict=True); m32.eval()
logits_q32, _ = run_inf(m32, X_test, list(range(D_MODEL)))

# -- run supplement --
TARGET_SP = [50, 70, 90, 100]  # Q16: 50/70/90/100, Q8: 30/50/70/90/100
# Note: Q16 already has up to S30; Q8 already has up to S20
# Q16 needs: 50, 70, 90, 100
# Q8 needs: 30, 50, 70, 90, 100

to_run = [(16,50),(16,70),(16,90),(16,100),(8,30),(8,50),(8,70),(8,90),(8,100)]
results = []

for qbits, sp in to_run:
    ad = active_channels_for(sp)
    ac = active_channels_for(sp)  # re-calc with correct active_dim
    # Actually use the mapping properly
    mapping = {0:16,10:14,30:11,50:8,70:5,90:2,100:0}
    ad2 = mapping.get(sp, max(round(D_MODEL*(1-sp/100)),0))
    ac2 = sorted(np.argsort(imp)[::-1][:ad2].tolist()) if ad2 > 0 else []

    eid = f'e1_q{qbits}_s{sp}_attn_only'
    sd = q16_sd if qbits == 16 else q8_sd
    m = LinearUNSWAnomalyDetector(**MODEL_CONFIG); m.load_state_dict(sd, strict=True); m.eval()

    t0 = time_module.time()
    logs, prs = run_inf(m, X_test, ac2)
    acc = accuracy_score(y_test, prs)
    prec = precision_score(y_test, prs, zero_division=0)
    rec = recall_score(y_test, prs, zero_division=0)
    f1v = f1_score(y_test, prs, zero_division=0)
    probs = torch.softmax(torch.from_numpy(logs),dim=1).numpy()
    auc = roc_auc_score(y_test, probs[:,1]) if len(np.unique(y_test))>1 else 0.5
    match = (prs == np.argmax(logits_q32,axis=1)).mean()
    lerr = np.abs(logs - logits_q32)
    dt = time_module.time()-t0

    r = {'experiment_id':eid,'quant_bits':qbits,'sparsity_percent':sp,'active_dim':ad2,
         'active_channels':str(ac2),'accuracy':round(acc,6),'precision':round(prec,6),
         'recall':round(rec,6),'f1':round(f1v,6),'auc':round(auc,6),
         'prediction_match_rate_vs_q32':round(match,6),
         'max_logit_error_vs_q32':round(lerr.max(),6),'mean_logit_error_vs_q32':round(lerr.mean(),6),
         'sparse_type':'attention_only_qk_active_channel','status':'SUCCESS',
         'notes':'high-sparsity ablation' if sp>=50 else ''}
    results.append(r)
    print(f'[{eid}] S={sp}% ad={ad2} acc={acc*100:.2f}% match={match:.4f} ({dt:.1f}s)')

# Save
out_csv = f'{TABLES}/experiment1_attention_only_full_sparsity_software_results.csv'
# Combine existing progressive + new supplement
existing_csv = f'{TABLES}/experiment1_attention_only_progressive_sparse_results.csv'
combined = []
if os.path.exists(existing_csv):
    with open(existing_csv) as f:
        for row in csv.DictReader(f):
            if row.get('status','')=='SUCCESS':
                combined.append(row)
# Add supplement rows (overwrite existing if same key)
existing_keys = {(int(r['quant_bits']),int(r['sparsity_percent'])) for r in combined}
for r in results:
    k = (r['quant_bits'], r['sparsity_percent'])
    if k in existing_keys:
        # Replace
        for i, cr in enumerate(combined):
            if int(cr['quant_bits'])==k[0] and int(cr['sparsity_percent'])==k[1]:
                combined[i] = r
                break
    else:
        combined.append(r)

fnames = ['experiment_id','quant_bits','sparsity_percent','active_dim','active_channels',
          'accuracy','precision','recall','f1','auc','prediction_match_rate_vs_q32',
          'max_logit_error_vs_q32','mean_logit_error_vs_q32','sparse_type','status','notes']
with open(out_csv,'w',newline='') as f:
    w = csv.DictWriter(f, fieldnames=fnames, extrasaction='ignore')
    w.writeheader(); w.writerows(combined)
print(f'\nSaved: {out_csv} ({len(combined)} rows)')
