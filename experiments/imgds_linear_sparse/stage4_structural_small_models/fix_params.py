import sys, os, numpy as np, torch
from collections import OrderedDict
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master')
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models')
from models.small_linear_transformer import SmallLinearTransformer

STG4 = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models'
HLS  = f'{STG4}/hls/small_B_q16_d8_ff16'
D, S, I, F, C = 8, 16, 64, 16, 2

ckpt = torch.load(f'{STG4}/checkpoints/small_B_best.pt', map_location='cpu', weights_only=False)
sd = ckpt['state_dict']
sd_raw = OrderedDict((k.replace('backbone.',''), v.clone()) for k,v in sd.items() if isinstance(v, torch.Tensor))

def q16(w): s=1024; mx=31.999; mn=-32.0; return torch.clamp(torch.round(w*s), mn*s, mx*s)/s
q16_sd = OrderedDict()
for k,v in sd_raw.items():
    iw = 'weight' in k and v.ndim >= 2
    inn = 'norm' in k.lower()
    is_pe = 'position_embedding' in k
    q16_sd[k] = q16(v) if (iw and not inn and not is_pe) else v.clone()

def fmt_arr(arr):
    lines = []
    n = len(arr)
    for i in range(0, n, 8):
        vals = ', '.join('{:.7f}f'.format(float(x)) for x in arr[i:i+8])
        ending = ',' if i+8 < n else ''
        lines.append('    {}{}'.format(vals, ending))
    return '\n'.join(lines)

param_map = [
    ('input_projection.weight', 'input_projection_weight'),
    ('input_projection.bias', 'input_projection_bias'),
    ('position_embedding', 'position_embedding'),
    ('layers.0.attention.query.weight', 'layers_0_attention_query_weight'),
    ('layers.0.attention.key.weight', 'layers_0_attention_key_weight'),
    ('layers.0.attention.value.weight', 'layers_0_attention_value_weight'),
    ('layers.0.attention.output.weight', 'layers_0_attention_output_weight'),
    ('layers.0.attention.output.bias', 'layers_0_attention_output_bias'),
    ('layers.0.norm1.weight', 'layers_0_norm1_weight'),
    ('layers.0.norm1.bias', 'layers_0_norm1_bias'),
    ('layers.0.feedforward.0.weight', 'layers_0_feedforward_0_weight'),
    ('layers.0.feedforward.0.bias', 'layers_0_feedforward_0_bias'),
    ('layers.0.feedforward.3.weight', 'layers_0_feedforward_3_weight'),
    ('layers.0.feedforward.3.bias', 'layers_0_feedforward_3_bias'),
    ('layers.0.norm2.weight', 'layers_0_norm2_weight'),
    ('layers.0.norm2.bias', 'layers_0_norm2_bias'),
    ('output_norm.weight', 'output_norm_weight'),
    ('output_norm.bias', 'output_norm_bias'),
    ('classifier.weight', 'classifier_weight'),
    ('classifier.bias', 'classifier_bias'),
]

hdr = [
    '// small_B HLS params (d={}, ff={})'.format(D, F),
    '#ifndef HLS_PARAMS_SMALL_B_H', '#define HLS_PARAMS_SMALL_B_H', '',
    '#include <ap_fixed.h>', '',
    '#define SEQ_LEN {}'.format(S),
    '#define INPUT_DIM {}'.format(I),
    '#define D_MODEL {}'.format(D),
    '#define FF_DIM {}'.format(F),
    '#define N_CLASSES {}'.format(C),
    '#define N_EVAL 200', '',
]

for kname, cname in param_map:
    v = q16_sd.get(kname)
    if v is None:
        print('WARN: {} not found'.format(kname))
        continue
    flat = v.numpy().flatten()
    hdr.append('// {} shape={}'.format(kname, list(v.shape)))
    hdr.append('static const ap_fixed<16,6> {}[{}] = {{'.format(cname, len(flat)))
    hdr.append(fmt_arr(flat))
    hdr.append('};')
    hdr.append('')
hdr.append('#endif')
hdr.append('')

path = '{}/hls/src/hls_params_small_b.h'.format(HLS)
with open(path, 'w') as f:
    f.write('\n'.join(hdr))
print('Written: {} lines'.format(len(hdr)))

# Verify
for kname, cname in param_map:
    v = q16_sd.get(kname)
    if v is not None:
        print('  {}[{}] <- {} {}'.format(cname, v.numpy().size, kname, list(v.shape)))
print('Done.')
