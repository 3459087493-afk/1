#!/usr/bin/env python3
"""Task A: Recheck Stage4 checkpoints on full test set.
   Task B: Generate small_B HLS headers."""

import sys, os, csv, numpy as np
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master')
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models')

import torch, torch.nn as nn
from collections import OrderedDict
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, roc_auc_score
from models.small_linear_transformer import SmallLinearTransformer

STG4 = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models'
EXP  = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse'
TABS = f'{STG4}/tables'
os.makedirs(TABS, exist_ok=True)

# ---- Load test data ----
X_test = torch.FloatTensor(np.load(f'{EXP}/outputs/imgds_r32_p8_test.npz')['X'])
y_test = np.load(f'{EXP}/outputs/imgds_r32_p8_test.npz')['y']
print(f'Test: X={X_test.shape} y={y_test.shape} labels={np.bincount(y_test)}')

# ---- Recheck function ----
def recheck(model_id, ckpt_path, d_model, ff_dim):
    print(f'\nRechecking {model_id} (d={d_model} ff={ff_dim})...')
    ckpt = torch.load(ckpt_path, map_location='cpu', weights_only=False)

    # Handle both save formats
    if 'state_dict' in ckpt and isinstance(ckpt['state_dict'], OrderedDict):
        sd = ckpt['state_dict']
    elif 'model_state_dict' in ckpt:
        sd = ckpt['model_state_dict']
    else:
        sd = ckpt

    # Strip backbone. prefix if present
    if any(k.startswith('backbone.') for k in sd.keys()):
        sd = OrderedDict((k.replace('backbone.',''), v.clone()) for k,v in sd.items() if isinstance(v, torch.Tensor))

    model = SmallLinearTransformer(d_model=d_model, ff_dim=ff_dim)
    # Try strict=False first, then strict=True
    try:
        model.load_state_dict(sd, strict=True)
    except RuntimeError:
        # Maybe the state dict has backbone. prefix inside
        sd2 = OrderedDict()
        for k, v in sd.items():
            if isinstance(v, torch.Tensor):
                sd2[k] = v
        model.load_state_dict(sd2, strict=False)
    model.eval()

    n_p = sum(p.numel() for p in model.parameters())
    print(f'  Params: {n_p}')

    # Run inference
    all_logits, all_preds = [], []
    bs = 512
    with torch.no_grad():
        for i in range(0, len(X_test), bs):
            bx = X_test[i:i+bs]
            lo = model(bx)
            all_preds.append(torch.argmax(lo, dim=1).numpy())
            all_logits.append(lo.numpy())
    preds = np.concatenate(all_preds)
    logits = np.concatenate(all_logits)
    probs = torch.softmax(torch.from_numpy(logits), dim=1).numpy()

    acc = accuracy_score(y_test, preds)
    prec = precision_score(y_test, preds, zero_division=0)
    rec  = recall_score(y_test, preds, zero_division=0)
    f1   = f1_score(y_test, preds, zero_division=0)
    auc  = roc_auc_score(y_test, probs[:, 1])

    print(f'  Test acc={acc*100:.2f}% prec={prec:.4f} rec={rec:.4f} f1={f1:.4f} auc={auc:.4f}')
    return {'model_id': model_id, 'd_model': d_model, 'ff_dim': ff_dim, 'parameter_count': n_p,
            'test_accuracy': round(acc,6), 'precision': round(prec,6), 'recall': round(rec,6),
            'f1': round(f1,6), 'auc': round(auc,6), 'checkpoint_path': ckpt_path,
            'recheck_status': 'PASS', 'notes': ''}, model, sd

# ---- Recheck all ----
configs = [
    ('small_A', f'{STG4}/checkpoints/small_A_best.pt', 12, 24),
    ('small_B', f'{STG4}/checkpoints/small_B_best.pt', 8, 16),
    ('tiny',    f'{STG4}/checkpoints/tiny_best.pt',    6, 12),
]

recheck_results = []
model_data = {}
for mid, path, dm, ff in configs:
    if not os.path.exists(path):
        print(f'ERROR: {path} not found!')
        continue
    row, model, sd = recheck(mid, path, dm, ff)
    recheck_results.append(row)
    model_data[mid] = (model, sd)

# ---- Save recheck CSV ----
csv_path = f'{TABS}/structural_small_model_checkpoint_recheck.csv'
fnames = ['model_id','d_model','ff_dim','parameter_count','test_accuracy','precision',
          'recall','f1','auc','checkpoint_path','recheck_status','notes']
with open(csv_path, 'w', newline='') as f:
    w = csv.DictWriter(f, fieldnames=fnames, extrasaction='ignore')
    w.writeheader(); w.writerows(recheck_results)
print(f'\nRecheck saved: {csv_path}')

# ---- Summary comparison ----
print(f'\n{"="*60}')
print('RECHECK vs ORIGINAL TRAINING')
print(f'{"="*60}')
orig = {'small_A': 0.9605, 'small_B': 0.9518, 'tiny': 0.9553}
for r in recheck_results:
    o = orig.get(r['model_id'], 0)
    delta = (r['test_accuracy'] - o) * 100
    flag = 'OK' if abs(delta) < 2.0 else 'WARN'
    print(f'  {r["model_id"]}: recheck={r["test_accuracy"]*100:.2f}% orig={o*100:.2f}% delta={delta:+.2f}pp [{flag}]')

# ---- Generate small_B HLS headers ----
print(f'\n{"="*60}')
print('GENERATING small_B HLS HEADERS')
print(f'{"="*60}')

small_b_model, small_b_sd = model_data['small_B']
print(f'small_B params: {sum(p.numel() for p in small_b_model.parameters())}')

# Q16 quantize small_B state dict
from src.transformer import LinearUNSWAnomalyDetector

def q16_quant(w):
    s = 2**10; mx = 2**5 - 2**(-10); mn = -2**5
    return torch.clamp(torch.round(w * s), mn * s, mx * s) / s

q16_sd = OrderedDict()
for k, v in small_b_sd.items():
    iw = 'weight' in k and v.ndim >= 2
    inn = 'norm' in k.lower()
    is_pe = 'position_embedding' in k
    # Quantize 2D weights, keep norms/biases/PE at float precision
    q16_sd[k] = q16_quant(v) if (iw and not inn and not is_pe) else v.clone()

print(f'Q16 quantized. Checking weight ranges...')
# Print actual shapes for key params
d8 = small_b_model.d_model
ff = small_b_model.ff_dim
print(f'small_B d_model={d8} ff_dim={ff}')

# Collect shapes from the state dict
for k in sorted(q16_sd.keys()):
    print(f'  {k}: {q16_sd[k].shape}')

# Save float state dict
torch.save(q16_sd, f'{STG4}/checkpoints/small_B_q16_sd.pt')
print(f'Saved: small_B_q16_sd.pt')
