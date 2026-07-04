import sys, os, csv, numpy as np, torch, torch.nn as nn
from collections import OrderedDict
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, roc_auc_score

sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master')
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models')
from models.small_linear_transformer import SmallLinearTransformer

STG4 = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models'
EXP  = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse'

X_test = torch.FloatTensor(np.load(f'{EXP}/outputs/imgds_r32_p8_test.npz')['X'])
y_test = np.load(f'{EXP}/outputs/imgds_r32_p8_test.npz')['y']
print(f'Test: X={X_test.shape} y={y_test.shape}')

def recheck(model_id, ckpt_path, d_model, ff_dim):
    print(f'\nRechecking {model_id} (d={d_model} ff={ff_dim})...')
    ckpt = torch.load(ckpt_path, map_location='cpu', weights_only=False)
    sd = ckpt.get('state_dict', ckpt)
    print(f'  CKPT keys (first 3): {list(sd.keys())[:3]}')
    
    # Build clean tensor-only OrderedDict
    sd_clean = OrderedDict((k, v) for k, v in sd.items() if isinstance(v, torch.Tensor))
    
    # SmallLinearTransformer has self.backbone, so state_dict keys have 'backbone.' prefix
    model = SmallLinearTransformer(d_model=d_model, ff_dim=ff_dim)
    model_keys = set(model.state_dict().keys())
    ckpt_keys = set(sd_clean.keys())
    missing = model_keys - ckpt_keys
    extra = ckpt_keys - model_keys
    print(f'  Model keys: {len(model_keys)}, CKPT keys: {len(ckpt_keys)}')
    print(f'  Missing: {len(missing)}, Extra: {len(extra)}')
    if len(missing) > 0:
        print(f'  Sample missing: {list(missing)[:3]}')
    if len(extra) > 0:
        print(f'  Sample extra: {list(extra)[:3]}')
    
    # Try to load
    model.load_state_dict(sd_clean, strict=True)
    model.eval()
    n_p = sum(p.numel() for p in model.parameters())
    
    all_preds, all_logits = [], []
    with torch.no_grad():
        for i in range(0, len(X_test), 512):
            bx = X_test[i:i+512]
            lo = model(bx)
            all_preds.append(torch.argmax(lo,dim=1).numpy())
            all_logits.append(lo.numpy())
    preds = np.concatenate(all_preds)
    logits = np.concatenate(all_logits)
    probs = torch.softmax(torch.from_numpy(logits),dim=1).numpy()
    
    acc = accuracy_score(y_test, preds)
    prec = precision_score(y_test, preds, zero_division=0)
    rec = recall_score(y_test, preds, zero_division=0)
    f1v = f1_score(y_test, preds, zero_division=0)
    auc = roc_auc_score(y_test, probs[:,1])
    
    print(f'  acc={acc*100:.2f}% prec={prec:.4f} rec={rec:.4f} f1={f1v:.4f} auc={auc:.4f}')
    return {'model_id':model_id,'d_model':d_model,'ff_dim':ff_dim,'parameter_count':n_p,
            'test_accuracy':round(acc,6),'precision':round(prec,6),'recall':round(rec,6),
            'f1':round(f1v,6),'auc':round(auc,6),'checkpoint_path':ckpt_path,
            'recheck_status':'PASS','notes':''}, model, sd_clean

results = []
model_data = {}
configs = [
    ('small_A', f'{STG4}/checkpoints/small_A_best.pt', 12, 24),
    ('small_B', f'{STG4}/checkpoints/small_B_best.pt', 8, 16),
    ('tiny',    f'{STG4}/checkpoints/tiny_best.pt',    6, 12),
]
for mid, path, dm, ff in configs:
    if not os.path.exists(path):
        print(f'ERROR: {path} not found')
        continue
    r, m, sd = recheck(mid, path, dm, ff)
    results.append(r)
    model_data[mid] = (m, sd)

# Save
csv_path = f'{STG4}/tables/structural_small_model_checkpoint_recheck.csv'
with open(csv_path,'w',newline='') as f:
    w = csv.DictWriter(f, fieldnames=results[0].keys(), extrasaction='ignore')
    w.writeheader(); w.writerows(results)

print(f'\nRecheck saved: {csv_path}')
orig = {'small_A':0.9605,'small_B':0.9518,'tiny':0.9553}
all_ok = True
for r in results:
    o = orig.get(r['model_id'],0)
    d = (r['test_accuracy']-o)*100
    ok = abs(d) < 2.0
    if not ok: all_ok = False
    print(f'  {r["model_id"]}: recheck={r["test_accuracy"]*100:.2f}% orig={o*100:.2f}% delta={d:+.2f}pp {"OK" if ok else "WARN"}')

if all_ok:
    print('\nAll rechecks PASSED. Proceeding with small_B HLS preparation.')
else:
    print('\nWARNING: Some rechecks failed. Investigate before HLS.')
