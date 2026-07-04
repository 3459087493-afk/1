"""Complete small_B HLS generation: eval samples + C++ source + TCL."""
import sys, os, numpy as np
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master')
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models')

import torch
from collections import OrderedDict
from models.small_linear_transformer import SmallLinearTransformer

STG4 = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models'
EXP  = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse'
HLS  = f'{STG4}/hls/small_B_q16_d8_ff16'
D, S, I, F, C = 8, 16, 64, 16, 2  # d_model, seq_len, input_dim, ff_dim, n_classes

# Load checkpoint
ckpt = torch.load(f'{STG4}/checkpoints/small_B_best.pt', map_location='cpu', weights_only=False)
sd = ckpt['state_dict']  # backbone.xxx keys

# Q16 quantize raw (strip backbone. prefix for raw params)
sd_raw = OrderedDict((k.replace('backbone.',''), v.clone()) for k,v in sd.items() if isinstance(v, torch.Tensor))
def q16(w): s=2**10; mx=2**5-2**(-10); mn=-2**5; return torch.clamp(torch.round(w*s),mn*s,mx*s)/s
q16_sd = OrderedDict()
for k,v in sd_raw.items():
    iw='weight' in k and v.ndim>=2; inn='norm' in k.lower(); is_pe='position_embedding' in k
    q16_sd[k] = q16(v) if (iw and not inn and not is_pe) else v.clone()

def fmt_arr(arr):
    lines=[]
    for i in range(0,len(arr),8):
        v=', '.join(f'{x: .7f}f' for x in arr[i:i+8])
        lines.append(f'    {v}{"," if i+8<len(arr) else ""}')
    return '\n'.join(lines)

# ---- eval_samples_small_b.h ----
model = SmallLinearTransformer(d_model=D, ff_dim=F)
model.load_state_dict(sd, strict=True); model.eval()
ev = np.load(f'{EXP}/outputs/imgds_r32_p8_fpga_eval_200.npz')
Xe, ye = ev['X'], ev['y']
with torch.no_grad(): rl = model(torch.from_numpy(Xe).float()).numpy()
print(f'small_B eval200 SW acc: {(np.argmax(rl,axis=1)==ye).mean()*100:.2f}%')

esh = ['// small_B eval samples','#ifndef EVAL_SAMPLES_SMALL_B_H','#define EVAL_SAMPLES_SMALL_B_H','',
       '#include <ap_fixed.h>','','#define N_EVAL_SAMPLES 200',
       f'#define SEQ_LEN {S}',f'#define INPUT_DIM {I}',f'#define N_CLASSES {C}','']
fi=Xe.flatten()
esh.append(f'static const float eval_inputs_flat[{len(fi)}] = {{')
esh.append(fmt_arr(fi)); esh.append('};'); esh.append('')
esh.append('static const float ref_logits[200][2] = {')
for n in range(200): esh.append(f'    {{{rl[n,0]: .7f}f, {rl[n,1]: .7f}f}}{"," if n<199 else ""}')
esh.append('};'); esh.append('')
esh.append(f'static const int eval_labels[200] = {{{", ".join(str(int(y)) for y in ye)}}};')
esh.append(''); esh.append('#endif')
os.makedirs(f'{HLS}/hls/src', exist_ok=True)
with open(f'{HLS}/hls/src/eval_samples_small_b.h','w') as f: f.write('\n'.join(esh))
print(f'eval_samples: {len(esh)} lines')

# ---- imgds_linear_small_b.h ----
hdr = f'''/// imgds_linear_small_b.h — small_B (d_model=8, ff_dim=16)
#ifndef IMGDS_LINEAR_SMALL_B_H
#define IMGDS_LINEAR_SMALL_B_H
#include <ap_fixed.h>
#define SEQ_LEN   {S}
#define INPUT_DIM {I}
#define D_MODEL   {D}
#define FF_DIM    {F}
#define N_CLASSES {C}
typedef ap_fixed<16,6>  data_t;
typedef ap_fixed<24,10> acc_t;
void imgds_linear_small_b(data_t input[SEQ_LEN][INPUT_DIM], data_t logits[N_CLASSES]);
#endif
'''
with open(f'{HLS}/hls/src/imgds_linear_small_b.h','w') as f: f.write(hdr)
print('Header written')

# ---- imgds_linear_small_b.cpp (PARETO2-style, adapted for D=8, F=16) ----
cpp = f'''/// imgds_linear_small_b.cpp — small_B (d_model=8, ff_dim=16)
/// Structural small Linear Transformer, PARETO2 DSP-shared architecture.
#include "imgds_linear_small_b.h"
#include "hls_params_small_b.h"
#include <cmath>

static const data_t EPS = data_t(1e-6);

static inline data_t feature_map(data_t x) {{
#pragma HLS INLINE
    if (x >= data_t(0)) return x + data_t(1);
    float fx = x.to_float();
    return data_t(expf(fx));
}}

static void layer_norm_small_b(data_t x[D_MODEL],
    const data_t gamma[D_MODEL], const data_t beta[D_MODEL]) {{
    acc_t sum = 0;
    for (int i = 0; i < D_MODEL; i++) sum += x[i];
    data_t mean = sum / acc_t(D_MODEL);
    acc_t var_sum = 0;
    for (int i = 0; i < D_MODEL; i++) {{ data_t diff = x[i] - mean; var_sum += diff * diff; }}
    data_t var_val = var_sum / acc_t(D_MODEL);
    float fvar = var_val.to_float();
    float finv = 1.0f / sqrtf(fvar + 1e-6f);
    data_t inv_std = data_t(finv);
    for (int i = 0; i < D_MODEL; i++) {{
        data_t normed = (x[i] - mean) * inv_std;
        x[i] = normed * gamma[i] + beta[i];
    }}
}}

static void linear_attention_small_b(
    data_t x[SEQ_LEN][D_MODEL],
    const ap_fixed<16,6> Wq_flat[D_MODEL * D_MODEL],
    const ap_fixed<16,6> Wk_flat[D_MODEL * D_MODEL],
    const ap_fixed<16,6> Wv_flat[D_MODEL * D_MODEL],
    const ap_fixed<16,6> Wo_flat[D_MODEL * D_MODEL],
    const data_t bo[D_MODEL]) {{
#pragma HLS ALLOCATION instances=mul limit=32 operation

    data_t Q[SEQ_LEN][D_MODEL], K[SEQ_LEN][D_MODEL], V[SEQ_LEN][D_MODEL];

    // Step A: Q,K,V projections
    for (int s = 0; s < SEQ_LEN; s++) {{
        for (int d = 0; d < D_MODEL; d++) {{
            acc_t sq = 0, sk = 0, sv = 0;
            for (int i = 0; i < D_MODEL; i++) {{
#pragma HLS PIPELINE II=1
                data_t xi = x[s][i];
                sq += xi * Wq_flat[d * D_MODEL + i];
                sk += xi * Wk_flat[d * D_MODEL + i];
                sv += xi * Wv_flat[d * D_MODEL + i];
            }}
            Q[s][d] = feature_map(data_t(sq));
            K[s][d] = feature_map(data_t(sk));
            V[s][d] = data_t(sv);
        }}
    }}

    // Step B: KV = K^T @ V
    data_t KV[D_MODEL][D_MODEL];
    for (int d1 = 0; d1 < D_MODEL; d1++) {{
        for (int d2 = 0; d2 < D_MODEL; d2++) {{
            acc_t s = 0;
            for (int pos = 0; pos < SEQ_LEN; pos++) {{
#pragma HLS PIPELINE II=1
                s += K[pos][d1] * V[pos][d2];
            }}
            KV[d1][d2] = data_t(s);
        }}
    }}

    // Step C: K_sum
    data_t K_sum[D_MODEL];
    for (int d = 0; d < D_MODEL; d++) {{
        acc_t s = 0;
        for (int pos = 0; pos < SEQ_LEN; pos++) {{
#pragma HLS PIPELINE II=1
            s += K[pos][d];
        }}
        K_sum[d] = data_t(s);
    }}

    // Step D: Per-position output
    for (int pos = 0; pos < SEQ_LEN; pos++) {{
        acc_t _normalizer = EPS;
        for (int d = 0; d < D_MODEL; d++) {{
#pragma HLS PIPELINE II=1
            _normalizer += Q[pos][d] * K_sum[d];
        }}
        float fnorm = _normalizer.to_float();
        data_t inv_norm = data_t(1.0f / fnorm);

        data_t attended[D_MODEL];
        for (int d2 = 0; d2 < D_MODEL; d2++) {{
            acc_t numerator = 0;
            for (int d1 = 0; d1 < D_MODEL; d1++) {{
#pragma HLS PIPELINE II=1
                numerator += Q[pos][d1] * KV[d1][d2];
            }}
            attended[d2] = data_t(numerator * inv_norm);
        }}

        for (int d = 0; d < D_MODEL; d++) {{
            acc_t s = bo[d];
            for (int i = 0; i < D_MODEL; i++) {{
#pragma HLS PIPELINE II=1
                s += attended[i] * Wo_flat[d * D_MODEL + i];
            }}
            x[pos][d] = x[pos][d] + data_t(s);
        }}
    }}
}}

static void feedforward_small_b(
    data_t x[SEQ_LEN][D_MODEL],
    const ap_fixed<16,6> W0_flat[FF_DIM * D_MODEL],
    const data_t b0[FF_DIM],
    const ap_fixed<16,6> W3_flat[D_MODEL * FF_DIM],
    const data_t b3[D_MODEL]) {{
#pragma HLS ALLOCATION instances=mul limit=16 operation

    for (int pos = 0; pos < SEQ_LEN; pos++) {{
        data_t hidden[FF_DIM];
        for (int d = 0; d < FF_DIM; d++) {{
            acc_t s = b0[d];
            for (int i = 0; i < D_MODEL; i++) {{
#pragma HLS PIPELINE II=1
                s += x[pos][i] * W0_flat[d * D_MODEL + i];
            }}
            hidden[d] = data_t(s);
            if (hidden[d] < data_t(0)) hidden[d] = data_t(0);
        }}

        data_t ff_out[D_MODEL];
        for (int d = 0; d < D_MODEL; d++) {{
            acc_t s = b3[d];
            for (int i = 0; i < FF_DIM; i++) {{
#pragma HLS PIPELINE II=1
                s += hidden[i] * W3_flat[d * FF_DIM + i];
            }}
            ff_out[d] = data_t(s);
        }}

        for (int d = 0; d < D_MODEL; d++) x[pos][d] = x[pos][d] + ff_out[d];
    }}
}}

void imgds_linear_small_b(data_t input[SEQ_LEN][INPUT_DIM], data_t logits[N_CLASSES]) {{
#pragma HLS INTERFACE m_axi     port=input  offset=slave bundle=gmem0 depth=1024
#pragma HLS INTERFACE m_axi     port=logits offset=slave bundle=gmem1 depth=2
#pragma HLS INTERFACE s_axilite port=input  bundle=control
#pragma HLS INTERFACE s_axilite port=logits bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control
#pragma HLS ALLOCATION instances=mul limit=16 operation

    // Step 1: Input projection + positional encoding
    data_t x[SEQ_LEN][D_MODEL];
    for (int s = 0; s < SEQ_LEN; s++) {{
        for (int d = 0; d < D_MODEL; d++) {{
            acc_t sum = input_projection_bias[d];
            for (int i = 0; i < INPUT_DIM; i++) {{
#pragma HLS PIPELINE II=1
                sum += input[s][i] * input_projection_weight[d * INPUT_DIM + i];
            }}
            x[s][d] = data_t(sum) + position_embedding[s * D_MODEL + d];
        }}
    }}

    // Step 2: Encoder block
    linear_attention_small_b(x,
        layers_0_attention_query_weight, layers_0_attention_key_weight,
        layers_0_attention_value_weight, layers_0_attention_output_weight,
        layers_0_attention_output_bias);
    for (int s = 0; s < SEQ_LEN; s++) layer_norm_small_b(x[s], layers_0_norm1_weight, layers_0_norm1_bias);
    feedforward_small_b(x, layers_0_feedforward_0_weight, layers_0_feedforward_0_bias,
                        layers_0_feedforward_3_weight, layers_0_feedforward_3_bias);
    for (int s = 0; s < SEQ_LEN; s++) layer_norm_small_b(x[s], layers_0_norm2_weight, layers_0_norm2_bias);

    // Step 3: Mean pooling + output norm
    data_t pooled[D_MODEL];
    for (int d = 0; d < D_MODEL; d++) {{
        acc_t s = 0;
        for (int pos = 0; pos < SEQ_LEN; pos++) {{
#pragma HLS PIPELINE II=1
            s += x[pos][d];
        }}
        pooled[d] = s / acc_t(SEQ_LEN);
    }}
    layer_norm_small_b(pooled, output_norm_weight, output_norm_bias);

    // Step 4: Classifier
    for (int c = 0; c < N_CLASSES; c++) {{
#pragma HLS UNROLL
        acc_t s = classifier_bias[c];
        for (int d = 0; d < D_MODEL; d++) {{
#pragma HLS UNROLL
            s += pooled[d] * classifier_weight[c * D_MODEL + d];
        }}
        logits[c] = data_t(s);
    }}
}}
'''
with open(f'{HLS}/hls/src/imgds_linear_small_b.cpp','w') as f: f.write(cpp)
print(f'C++ source: {len(cpp.splitlines())} lines')

# ---- testbench.cpp ----
tb = f'''#include "imgds_linear_small_b.h"
#include "eval_samples_small_b.h"
#include <cstdio>
#include <cmath>
#define MAX_MM 10
int main() {{
    int mc=0,hc=0,rc=0,ms=0;
    float me=0.0f,se=0.0f;
    int mids[MAX_MM]; float mh0[MAX_MM],mh1[MAX_MM],mr0[MAX_MM],mr1[MAX_MM];
    int mhp[MAX_MM],mrp[MAX_MM],ml[MAX_MM];
    printf("small_B CSIM Testbench\\n==================================================\\n");
    for (int n=0; n<N_EVAL_SAMPLES; n++) {{
        data_t input[SEQ_LEN][INPUT_DIM];
        for (int s=0; s<SEQ_LEN; s++)
            for (int d=0; d<INPUT_DIM; d++)
                input[s][d]=data_t(eval_inputs_flat[n*SEQ_LEN*INPUT_DIM+s*INPUT_DIM+d]);
        data_t logits[2]; imgds_linear_small_b(input,logits);
        int hp=(logits[0]>logits[1])?0:1;
        int rp=(ref_logits[n][0]>ref_logits[n][1])?0:1;
        int lb=eval_labels[n];
        if (hp==rp) mc++; else {{
            if (ms<MAX_MM) {{ mids[ms]=n; mh0[ms]=logits[0].to_float(); mh1[ms]=logits[1].to_float();
                mr0[ms]=ref_logits[n][0]; mr1[ms]=ref_logits[n][1]; mhp[ms]=hp; mrp[ms]=rp; ml[ms]=lb; }}
            ms++;
        }}
        if (hp==lb) hc++; if (rp==lb) rc++;
        float e0=fabsf(logits[0].to_float()-ref_logits[n][0]);
        float e1=fabsf(logits[1].to_float()-ref_logits[n][1]);
        if (e0>me) me=e0; if (e1>me) me=e1; se+=e0+e1;
    }}
    float mr=(float)mc/N_EVAL_SAMPLES,ma=se/(N_EVAL_SAMPLES*2);
    float ha=(float)hc/N_EVAL_SAMPLES,ra=(float)rc/N_EVAL_SAMPLES;
    printf("\\n==================================================\\n");
    printf("small_B CSIM Results (N=%d)\\n",N_EVAL_SAMPLES);
    printf("==================================================\\n");
    printf("  Pred match vs PyTorch ref: %.4f (%d/%d)\\n",mr,mc,N_EVAL_SAMPLES);
    printf("  HW label accuracy:         %.4f (%d/%d)\\n",ha,hc,N_EVAL_SAMPLES);
    printf("  Ref label accuracy:        %.4f (%d/%d)\\n",ra,rc,N_EVAL_SAMPLES);
    printf("  Mismatches: %d\\n",ms);
    printf("  Max abs error: %.8f\\n",me);
    printf("  Mean abs error: %.8f\\n",ma);
    int pn=(ms<MAX_MM)?ms:MAX_MM;
    if (pn>0) {{ printf("\\n  First %d mismatches:\\n",pn);
        for (int i=0;i<pn;i++) printf("  %-6d [%7.4f,%7.4f] [%7.4f,%7.4f] hw=%d ref=%d lbl=%d\\n",
            mids[i],mh0[i],mh1[i],mr0[i],mr1[i],mhp[i],mrp[i],ml[i]); }}
    bool ok=mr>=0.95f;
    printf("\\n==================================================\\n");
    printf("  Match >= 0.95: %s\\n",ok?"PASS":"FAIL");
    printf("==================================================\\n");
    if (ok) printf("\\nCSIM PASSED. HW acc=%.4f.\\n",ha);
    else printf("\\nCSIM FAILED (match=%.4f).\\n",mr);
    return ok?0:1;
}}
'''
with open(f'{HLS}/hls/src/testbench.cpp','w') as f: f.write(tb)
print(f'Testbench: {len(tb.splitlines())} lines')

# ---- run_hls.tcl ----
tcl = '''# run_hls.tcl — small_B HLS CSIM+CSYNTH
open_project imgds_linear_small_b
set_top imgds_linear_small_b
add_files src/imgds_linear_small_b.cpp
add_files src/imgds_linear_small_b.h
add_files src/hls_params_small_b.h
add_files src/eval_samples_small_b.h
add_files src/testbench.cpp -tb
open_solution solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
csim_design
csynth_design
exit
'''
with open(f'{HLS}/hls/run_hls.tcl','w') as f: f.write(tcl)
print(f'TCL written')
print(f'\nAll small_B HLS files generated in: {HLS}/hls/')
