"""Generate Q8 Dense reference logits for full 3444 test set."""
import sys, os, numpy as np
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master')
import torch
from collections import OrderedDict
from src.transformer import LinearUNSWAnomalyDetector

EXP = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse'
OUT = f'{EXP}/q8_dense_pynq_validation'

D_MODEL, SEQ_LEN, INPUT_DIM, FF_DIM, N_CLASSES = 16, 16, 64, 32, 2
MC = {'input_dim':INPUT_DIM,'seq_len':SEQ_LEN,'d_model':D_MODEL,
      'dim_feedforward':FF_DIM,'num_layers':1,'num_classes':N_CLASSES,'dropout':0.0}

ckpt = torch.load(f'{EXP}/checkpoints/best_linear_imgds_dense_r32_p8.pt', map_location='cpu', weights_only=False)
sd = ckpt.get('model_state_dict', ckpt.get('state_dict', ckpt))
if any(k.startswith('backbone.') for k in sd.keys()):
    sd = OrderedDict((k.replace('backbone.',''), v.clone()) for k,v in sd.items())
sd = OrderedDict((k,v) for k,v in sd.items() if isinstance(v, torch.Tensor))

# Q8 weight quantization (ap_fixed<8,4> for 2D weights, float for biases/norms)
def q8_quant(w):
    s = 16; mx = 7.9375; mn = -8.0
    return torch.clamp(torch.round(w * s), mn * s, mx * s) / s

q8_sd = OrderedDict()
for k, v in sd.items():
    iw = 'weight' in k and v.ndim >= 2
    inn = 'norm' in k.lower()
    is_pe = 'position_embedding' in k
    q8_sd[k] = q8_quant(v) if (iw and not inn and not is_pe) else v.clone()

model = LinearUNSWAnomalyDetector(**MC)
model.load_state_dict(q8_sd, strict=True)
model.eval()

# Full test 3444
te = np.load(f'{EXP}/outputs/imgds_r32_p8_test.npz')
X_te, y_te = te['X'], te['y']
with torch.no_grad(): ref_te = model(torch.from_numpy(X_te).float()).numpy()
ra_te = (np.argmax(ref_te, axis=1) == y_te).mean()
print(f'Q8 full-test ref accuracy: {ra_te:.6f} (expected ~0.9100)')
np.savez(f'{OUT}/q8_dense_test_3444.npz', X=X_te, y=y_te, ref_logits=ref_te)

# eval200
ev = np.load(f'{EXP}/outputs/imgds_r32_p8_fpga_eval_200.npz')
X_ev, y_ev = ev['X'], ev['y']
with torch.no_grad(): ref_ev = model(torch.from_numpy(X_ev).float()).numpy()
ra_ev = (np.argmax(ref_ev, axis=1) == y_ev).mean()
print(f'Q8 eval200 ref accuracy: {ra_ev:.6f}')
np.savez(f'{OUT}/q8_dense_eval200.npz', X=X_ev, y=y_ev, ref_logits=ref_ev)

# Sanity
np.savez(f'{OUT}/q8_dense_sanity.npz', X=X_te[:1], y=y_te[:1], ref_logits=ref_te[:1])
print(f'Saved all npz files to {OUT}/')
