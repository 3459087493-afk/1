import sys, os, numpy as np
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master')
import torch, torch.nn as nn
from collections import OrderedDict
from src.transformer import LinearUNSWAnomalyDetector

EXP = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse'
STG3 = f'{EXP}/stage3_quant_sparsity_hls/q4_s10_pareto_axi'
D_MODEL, SEQ_LEN, INPUT_DIM, FF_DIM, N_CLASSES = 16, 16, 64, 32, 2
MC = {'input_dim':INPUT_DIM,'seq_len':SEQ_LEN,'d_model':D_MODEL,'dim_feedforward':FF_DIM,'num_layers':1,'num_classes':N_CLASSES,'dropout':0.0}

class W(nn.Module):
    def __init__(self): super().__init__(); self.backbone = LinearUNSWAnomalyDetector(**MC)
    def forward(self,x): return self.backbone(x)

ckpt = torch.load(f'{EXP}/checkpoints/best_linear_imgds_dense_r32_p8.pt', map_location='cpu', weights_only=False)
sd = ckpt.get('model_state_dict', ckpt.get('state_dict', ckpt))
if any(k.startswith('backbone.') for k in sd.keys()):
    sd = OrderedDict((k.replace('backbone.',''), v.clone()) for k,v in sd.items())
sd = OrderedDict((k,v) for k,v in sd.items() if isinstance(v, torch.Tensor))
print(f'Loaded {len(sd)} tensors')

# Q4 quant: ap_fixed<4,2>, range [-2, 1.75], step=0.25
def q4_quant(w):
    s = 4; mx = 1.75; mn = -2.0
    return torch.clamp(torch.round(w * s), mn * s, mx * s) / s

q4_sd = OrderedDict()
for k, v in sd.items():
    iw = 'weight' in k and v.ndim >= 2
    inn = 'norm' in k.lower()
    q4_sd[k] = q4_quant(v) if (iw and not inn) else v.clone()

# Channel importance (2D tensors only)
def global_importance(sd_d):
    imp = np.zeros(D_MODEL)
    for k, v in sd_d.items():
        vn = v.numpy()
        if vn.ndim == 2:
            if vn.shape[0] == D_MODEL: imp += np.abs(vn).sum(axis=1)
            if vn.shape[1] == D_MODEL: imp += np.abs(vn).sum(axis=0)
    return imp

imp = global_importance(q4_sd)
rank = np.argsort(imp)[::-1]
active_ch = sorted(rank[:14].tolist())
inactive_ch = [c for c in range(D_MODEL) if c not in active_ch]
print(f'Q4 importance: {imp}')
print(f'S10 active(14): {active_ch}, pruned(2): {inactive_ch}')

# Apply S10 global pruning
mask = np.ones(D_MODEL, dtype=np.float32)
for c in inactive_ch: mask[c] = 0.0

q4_sparse = OrderedDict()
for k, v in q4_sd.items():
    vn = v.numpy().copy(); sh = vn.shape
    if 'input_projection' in k and 'weight' in k and sh == (D_MODEL, INPUT_DIM): vn *= mask[:,None]
    elif 'input_projection' in k and 'bias' in k and sh == (D_MODEL,): vn *= mask
    elif 'attention' in k and 'weight' in k and sh == (D_MODEL, D_MODEL):
        vn *= (mask[:,None] * mask[None,:])
    elif 'attention' in k and 'bias' in k and sh == (D_MODEL,): vn *= mask
    elif 'feedforward.0' in k and 'weight' in k and sh == (FF_DIM, D_MODEL): vn *= mask[None,:]
    elif 'feedforward.3' in k and 'weight' in k and sh == (D_MODEL, FF_DIM): vn *= mask[:,None]
    elif 'feedforward.3' in k and 'bias' in k and sh == (D_MODEL,): vn *= mask
    elif 'classifier' in k and 'weight' in k and sh == (N_CLASSES, D_MODEL): vn *= mask[None,:]
    elif 'position_embedding' in k and len(sh)==3 and sh[2]==D_MODEL: vn *= mask[None,None,:]
    q4_sparse[k] = torch.from_numpy(vn)

print('S10 pruning applied. Writing headers...')

def fmt_arr(arr):
    lines = []
    for i in range(0, len(arr), 8):
        v = ', '.join(f'{x: .7f}f' for x in arr[i:i+8])
        lines.append(f'    {v}{"," if i+8 < len(arr) else ""}')
    return '\n'.join(lines)

# active_channels.h
cl = ', '.join(str(c) for c in active_ch)
with open(f'{STG3}/hls/src/active_channels.h','w') as f:
    f.write(f'// active_channels.h — Q4-S10 global channel pruning (10% sparse)\n')
    f.write(f'// Sparse type: global_channel_pruning NOT attention-only\n')
    f.write(f'// Active: {active_ch}, Pruned: {inactive_ch}\n')
    f.write(f'#ifndef ACTIVE_CHANNELS_H\n#define ACTIVE_CHANNELS_H\n')
    f.write(f'#define ACTIVE_DIM {len(active_ch)}\n')
    f.write(f'static const int ACTIVE_CHANNELS[ACTIVE_DIM] = {{{cl}}};\n')
    f.write(f'#endif\n')
print('Written: active_channels.h')

# hls_params_q4.h
param_map = [
    ('classifier.bias','classifier_bias'),('classifier.weight','classifier_weight'),
    ('input_projection.bias','input_projection_bias'),('input_projection.weight','input_projection_weight'),
    ('position_embedding','position_embedding'),
    ('attention.query.weight','layers_0_attention_query_weight'),
    ('attention.key.weight','layers_0_attention_key_weight'),
    ('attention.value.weight','layers_0_attention_value_weight'),
    ('attention.output.weight','layers_0_attention_output_weight'),
    ('attention.output.bias','layers_0_attention_output_bias'),
    ('norm1.weight','layers_0_norm1_weight'),('norm1.bias','layers_0_norm1_bias'),
    ('feedforward.0.weight','layers_0_feedforward_0_weight'),
    ('feedforward.0.bias','layers_0_feedforward_0_bias'),
    ('feedforward.3.weight','layers_0_feedforward_3_weight'),
    ('feedforward.3.bias','layers_0_feedforward_3_bias'),
    ('norm2.weight','layers_0_norm2_weight'),('norm2.bias','layers_0_norm2_bias'),
    ('output_norm.weight','output_norm_weight'),('output_norm.bias','output_norm_bias'),
]
hdr = ['// Auto-generated Q4-S10 (ap_fixed<4,2>, sparse 10%) HLS parameters',
       '#ifndef HLS_PARAMS_Q4_H','#define HLS_PARAMS_Q4_H','',
       '#include <ap_fixed.h>','',
       '#define SEQ_LEN 16','#define INPUT_DIM 64','#define D_MODEL 16',
       '#define FF_DIM 32','#define N_CLASSES 2','#define N_EVAL 200','']
for sfx, cn in param_map:
    found = None
    for k,v in q4_sparse.items():
        if k.endswith(sfx): found = v; break
    if found is None: continue
    flat = found.numpy().flatten()
    hdr.append(f'// {sfx} shape={list(found.shape)}')
    hdr.append(f'static const ap_fixed<4,2> {cn}[{len(flat)}] = {{')
    hdr.append(fmt_arr(flat)); hdr.append('};'); hdr.append('')
hdr.append('#endif\n')
with open(f'{STG3}/hls/src/hls_params_q4.h','w') as f: f.write('\n'.join(hdr))
print(f'Written: hls_params_q4.h')

# eval samples
model_q4 = W(); model_q4.backbone.load_state_dict(q4_sparse, strict=True); model_q4.eval()
ev = np.load(f'{EXP}/outputs/imgds_r32_p8_fpga_eval_200.npz')
Xe, ye = ev['X'], ev['y']
with torch.no_grad(): rl = model_q4(torch.from_numpy(Xe).float()).numpy()
swa = (np.argmax(rl,axis=1)==ye).mean()
print(f'Q4 S10 SW acc (eval200): {swa*100:.2f}%')

esh = ['// Auto-generated Q4-S10 eval samples','#ifndef EVAL_SAMPLES_Q4_H','#define EVAL_SAMPLES_Q4_H','',
       '#include <ap_fixed.h>','',
       '#define N_EVAL_SAMPLES 200','#define SEQ_LEN 16','#define INPUT_DIM 64','#define N_CLASSES 2','']
fi = Xe.flatten()
esh.append(f'static const float eval_inputs_flat[{len(fi)}] = {{')
esh.append(fmt_arr(fi)); esh.append('};'); esh.append('')
esh.append('// Q4 S10 reference logits')
esh.append('static const float ref_logits[200][2] = {')
for n in range(200):
    esh.append(f'    {{{rl[n,0]: .7f}f, {rl[n,1]: .7f}f}}{"," if n<199 else ""}')
esh.append('};'); esh.append('')
esh.append(f'static const int eval_labels[200] = {{{", ".join(str(int(y)) for y in ye)}}};')
esh.append(''); esh.append('#endif')
with open(f'{STG3}/hls/src/eval_samples_q4.h','w') as f: f.write('\n'.join(esh))
print(f'Written: eval_samples_q4.h')
print('All headers generated.')
