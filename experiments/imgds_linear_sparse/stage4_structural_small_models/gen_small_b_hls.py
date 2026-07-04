"""Generate small_B (d=8, ff=16) HLS headers and C++ source."""
import sys, os, numpy as np
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master')
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models')

import torch, torch.nn as nn
from collections import OrderedDict
from models.small_linear_transformer import SmallLinearTransformer

STG4 = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models'
EXP  = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse'
HLS  = f'{STG4}/hls/small_B_q16_d8_ff16'

D_MODEL, SEQ_LEN, INPUT_DIM, FF_DIM, N_CLASSES = 8, 16, 64, 16, 2

# Load small_B checkpoint
ckpt = torch.load(f'{STG4}/checkpoints/small_B_best.pt', map_location='cpu', weights_only=False)
sd = ckpt['state_dict']  # backbone.xxx keys

# Strip backbone. prefix for raw param access
sd_raw = OrderedDict((k.replace('backbone.',''), v.clone()) for k,v in sd.items() if isinstance(v, torch.Tensor))

# Q16 quantize
def q16_quant(w):
    s = 2**10; mx = 2**5 - 2**(-10); mn = -2**5
    return torch.clamp(torch.round(w * s), mn * s, mx * s) / s

q16_sd = OrderedDict()
for k, v in sd_raw.items():
    iw = 'weight' in k and v.ndim >= 2
    inn = 'norm' in k.lower()
    is_pe = 'position_embedding' in k
    q16_sd[k] = q16_quant(v) if (iw and not inn and not is_pe) else v.clone()

print(f'Params: {sum(v.numel() for v in q16_sd.values())}')
for k, v in q16_sd.items():
    print(f'  {k}: {list(v.shape)}')

def fmt_arr(arr):
    lines = []
    for i in range(0, len(arr), 8):
        v = ', '.join(f'{x: .7f}f' for x in arr[i:i+8])
        lines.append(f'    {v}{"," if i+8 < len(arr) else ""}')
    return '\n'.join(lines)

# ---- hls_params_small_b.h ----
param_map = [
    ('classifier.bias','classifier_bias'),
    ('classifier.weight','classifier_weight'),
    ('input_projection.bias','input_projection_bias'),
    ('input_projection.weight','input_projection_weight'),
    ('position_embedding','position_embedding'),
    ('layers.0.attention.query.weight','layers_0_attention_query_weight'),
    ('layers.0.attention.key.weight','layers_0_attention_key_weight'),
    ('layers.0.attention.value.weight','layers_0_attention_value_weight'),
    ('layers.0.attention.output.weight','layers_0_attention_output_weight'),
    ('layers.0.attention.output.bias','layers_0_attention_output_bias'),
    ('layers.0.norm1.weight','layers_0_norm1_weight'),
    ('layers.0.norm1.bias','layers_0_norm1_bias'),
    ('layers.0.feedforward.0.weight','layers_0_feedforward_0_weight'),
    ('layers.0.feedforward.0.bias','layers_0_feedforward_0_bias'),
    ('layers.0.feedforward.3.weight','layers_0_feedforward_3_weight'),
    ('layers.0.feedforward.3.bias','layers_0_feedforward_3_bias'),
    ('layers.0.norm2.weight','layers_0_norm2_weight'),
    ('layers.0.norm2.bias','layers_0_norm2_bias'),
    ('output_norm.weight','output_norm_weight'),
    ('output_norm.bias','output_norm_bias'),
]

hdr = [f'// small_B HLS params (d_model={D_MODEL}, ff_dim={FF_DIM})',
       '#ifndef HLS_PARAMS_SMALL_B_H','#define HLS_PARAMS_SMALL_B_H','',
       '#include <ap_fixed.h>','',
       f'#define SEQ_LEN {SEQ_LEN}',f'#define INPUT_DIM {INPUT_DIM}',
       f'#define D_MODEL {D_MODEL}',f'#define FF_DIM {FF_DIM}',
       f'#define N_CLASSES {N_CLASSES}','#define N_EVAL 200','']

for sfx, cn in param_map:
    found = None
    for k,v in q16_sd.items():
        if k.endswith(sfx.split('.')[-1]):
            # Match by last component
            if cn.endswith('weight') and 'weight' in k and v.ndim >= 2: found=v; break
            if cn.endswith('bias') and 'bias' in k: found=v; break
            if 'position_embedding' in k and 'position_embedding' == sfx.split('.')[-1]: found=v; break
    # Fallback: simpler matching
    if found is None:
        search = sfx.replace('layers.0.','').replace('layers.','')
        for k,v in q16_sd.items():
            if k.endswith(search): found=v; break
    if found is None: print(f'WARN: {sfx}'); continue
    flat = found.numpy().flatten()
    hdr.append(f'// {sfx} shape={list(found.shape)}')
    hdr.append(f'static const ap_fixed<16,6> {cn}[{len(flat)}] = {{')
    hdr.append(fmt_arr(flat)); hdr.append('};'); hdr.append('')
hdr.append('#endif\n')

os.makedirs(f'{HLS}/hls/src', exist_ok=True)
os.makedirs(f'{HLS}/reports', exist_ok=True)
os.makedirs(f'{HLS}/logs', exist_ok=True)
with open(f'{HLS}/hls/src/hls_params_small_b.h','w') as f: f.write('\n'.join(hdr))
print(f'\nWritten: hls_params_small_b.h ({len(hdr)} lines)')

# ---- eval_samples_small_b.h ----
class W(nn.Module):
    def __init__(self): super().__init__(); self.backbone=SmallLinearTransformer(d_model=D_MODEL,ff_dim=FF_DIM)
    def forward(self,x): return self.backbone(x)

model_q16 = W(); model_q16.load_state_dict(sd, strict=True); model_q16.eval()
ev = np.load(f'{EXP}/outputs/imgds_r32_p8_fpga_eval_200.npz')
Xe, ye = ev['X'], ev['y']
with torch.no_grad(): rl = model_q16(torch.from_numpy(Xe).float()).numpy()
swa = (np.argmax(rl,axis=1)==ye).mean()
print(f'small_B Q16 SW acc (eval200): {swa*100:.2f}%')

esh = [f'// small_B eval samples (d={D_MODEL} ff={FF_DIM})',
       '#ifndef EVAL_SAMPLES_SMALL_B_H','#define EVAL_SAMPLES_SMALL_B_H','',
       '#include <ap_fixed.h>','',
       '#define N_EVAL_SAMPLES 200',f'#define SEQ_LEN {SEQ_LEN}',
       f'#define INPUT_DIM {INPUT_DIM}',f'#define N_CLASSES {N_CLASSES}','']
fi = Xe.flatten()
esh.append(f'static const float eval_inputs_flat[{len(fi)}] = {{')
esh.append(fmt_arr(fi)); esh.append('};'); esh.append('')
esh.append('// small_B Q16 reference logits')
esh.append('static const float ref_logits[200][2] = {')
for n in range(200):
    esh.append(f'    {{{rl[n,0]: .7f}f, {rl[n,1]: .7f}f}}{"," if n<199 else ""}')
esh.append('};'); esh.append('')
esh.append(f'static const int eval_labels[200] = {{{", ".join(str(int(y)) for y in ye)}}};')
esh.append(''); esh.append('#endif')
with open(f'{HLS}/hls/src/eval_samples_small_b.h','w') as f: f.write('\n'.join(esh))
print(f'Written: eval_samples_small_b.h ({len(esh)} lines)')
print('Headers done.')
