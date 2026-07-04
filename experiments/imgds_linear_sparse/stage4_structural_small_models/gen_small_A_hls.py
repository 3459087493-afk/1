"""Generate small_A (d=12, ff=24) HLS headers + eval samples."""
import sys, os, numpy as np
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master')
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models')
import torch
from collections import OrderedDict
from models.small_linear_transformer import SmallLinearTransformer

STG4 = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models'
EXP  = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse'
HLS  = f'{STG4}/hls/small_A_q16_d12_ff24'

D, S, I, F, C = 12, 16, 64, 24, 2  # d_model, seq_len, input_dim, ff_dim, n_classes

ckpt = torch.load(f'{STG4}/checkpoints/small_A_best.pt', map_location='cpu', weights_only=False)
sd = ckpt['state_dict']
sd_raw = OrderedDict((k.replace('backbone.',''), v.clone()) for k,v in sd.items() if isinstance(v, torch.Tensor))

def q16(w): s=1024; mx=31.999; mn=-32.0; return torch.clamp(torch.round(w*s), mn*s, mx*s)/s
q16_sd = OrderedDict()
for k,v in sd_raw.items():
    iw='weight' in k and v.ndim>=2; inn='norm' in k.lower(); is_pe='position_embedding' in k
    q16_sd[k] = q16(v) if (iw and not inn and not is_pe) else v.clone()

def fmt_arr(arr):
    lines=[]
    for i in range(0,len(arr),8):
        vals=', '.join('{:.7f}f'.format(float(x)) for x in arr[i:i+8])
        lines.append('    {}{}'.format(vals, ',' if i+8<len(arr) else ''))
    return '\n'.join(lines)

os.makedirs(f'{HLS}/hls/src', exist_ok=True)
os.makedirs(f'{HLS}/reports', exist_ok=True)
os.makedirs(f'{HLS}/logs', exist_ok=True)

# ---- hls_params_small_a.h ----
param_map = [
    ('input_projection.weight','input_projection_weight'),
    ('input_projection.bias','input_projection_bias'),
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
    ('classifier.weight','classifier_weight'),
    ('classifier.bias','classifier_bias'),
]

hdr = ['// small_A HLS params (d={}, ff={})'.format(D,F),
       '#ifndef HLS_PARAMS_SMALL_A_H','#define HLS_PARAMS_SMALL_A_H','',
       '#include <ap_fixed.h>','',
       '#define SEQ_LEN {}'.format(S),'#define INPUT_DIM {}'.format(I),
       '#define D_MODEL {}'.format(D),'#define FF_DIM {}'.format(F),
       '#define N_CLASSES {}'.format(C),'#define N_EVAL 200','']

for kn, cn in param_map:
    v = q16_sd.get(kn)
    if v is None: print('WARN: {}'.format(kn)); continue
    flat = v.numpy().flatten()
    hdr.append('// {} shape={}'.format(kn, list(v.shape)))
    hdr.append('static const ap_fixed<16,6> {}[{}] = {{'.format(cn, len(flat)))
    hdr.append(fmt_arr(flat)); hdr.append('};'); hdr.append('')
hdr.append('#endif\n')
with open(f'{HLS}/hls/src/hls_params_small_a.h','w') as f: f.write('\n'.join(hdr))
print('hls_params_small_a.h: {} lines'.format(len(hdr)))

# ---- eval_samples_small_a.h ----
model = SmallLinearTransformer(d_model=D, ff_dim=F)
model.load_state_dict(sd, strict=True); model.eval()
ev = np.load(f'{EXP}/outputs/imgds_r32_p8_fpga_eval_200.npz')
Xe, ye = ev['X'], ev['y']
with torch.no_grad(): rl = model(torch.from_numpy(Xe).float()).numpy()
swa = (np.argmax(rl,axis=1)==ye).mean()
print('small_A eval200 SW acc: {:.2f}%'.format(swa*100))

esh = ['// small_A eval samples','#ifndef EVAL_SAMPLES_SMALL_A_H','#define EVAL_SAMPLES_SMALL_A_H','',
       '#include <ap_fixed.h>','','#define N_EVAL_SAMPLES 200',
       '#define SEQ_LEN {}'.format(S),'#define INPUT_DIM {}'.format(I),'#define N_CLASSES {}'.format(C),'']
fi = Xe.flatten()
esh.append('static const float eval_inputs_flat[{}] = {{'.format(len(fi)))
esh.append(fmt_arr(fi)); esh.append('};'); esh.append('')
esh.append('static const float ref_logits[200][2] = {')
for n in range(200):
    esh.append('    {{{: .7f}f, {: .7f}f}}{}'.format(rl[n,0],rl[n,1], ',' if n<199 else ''))
esh.append('};'); esh.append('')
esh.append('static const int eval_labels[200] = {{{}}};'.format(', '.join(str(int(y)) for y in ye)))
esh.append(''); esh.append('#endif')
with open(f'{HLS}/hls/src/eval_samples_small_a.h','w') as f: f.write('\n'.join(esh))
print('eval_samples: {} lines'.format(len(esh)))
print('Done.')
