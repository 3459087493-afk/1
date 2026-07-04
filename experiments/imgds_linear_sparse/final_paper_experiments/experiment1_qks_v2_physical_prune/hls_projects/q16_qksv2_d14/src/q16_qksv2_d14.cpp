// q16_qksv2_d14.cpp — Q16-QKSv2-D14  Q/K physically pruned (ATTN_DIM=14)
//
// v2 ARCHITECTURE (different from v1):
//   Q[SEQ_LEN][ATTN_DIM] — physically 16×14, NOT 16×16
//   K[SEQ_LEN][ATTN_DIM] — physically 16×14
//   KV[ATTN_DIM][D_MODEL] — physically 14×16
//   K_sum[ATTN_DIM]       — physically 14
//   Wq_pruned[ATTN_DIM * D_MODEL] — physically 224
//   Wk_pruned[ATTN_DIM * D_MODEL] — physically 224
//
//   NO ACTIVE_CHANNELS indirect indexing
//   NO mask
//   NO if(active) checks
//   All Q/K loops use: for(r=0; r<ATTN_DIM; r++)
//
//   V, Wo, FFN, LayerNorm, Pooling all remain FULL D_MODEL=16

#include "q16_qksv2_d14.h"
#include "qks_v2_params_q16_qksv2_d14.h"
#include <cmath>

static const data_t EPS = data_t(1e-6);

static inline data_t feature_map(data_t x) {
#pragma HLS INLINE
    if (x >= data_t(0)) return x + data_t(1);
    return data_t(expf(x.to_float()));
}

static void layer_norm(data_t x[D_MODEL],
                        const data_t gamma[D_MODEL],
                        const data_t beta[D_MODEL]) {
    acc_t sum = 0;
    for (int i = 0; i < D_MODEL; ++i) sum += x[i];
    data_t mean = sum / data_t(D_MODEL);

    acc_t var_sum = 0;
    for (int i = 0; i < D_MODEL; ++i) {
        data_t diff = x[i] - mean;
        var_sum += diff * diff;
    }
    data_t var = var_sum / data_t(D_MODEL);
    data_t inv_std = data_t(1.0f / sqrtf(var.to_float() + 1e-6f));

    for (int i = 0; i < D_MODEL; ++i) {
        data_t normalized = (x[i] - mean) * inv_std;
        x[i] = normalized * gamma[i] + beta[i];
    }
}

// ═══════════════════════════════════════════════════════════════════
//  v2 PHYSICALLY PRUNED LinearAttention
//  Q/K have 14 output channels; V/Wo/FFN stay 16
// ═══════════════════════════════════════════════════════════════════
static void attention_v2_pruned(
    data_t x[SEQ_LEN][D_MODEL],
    const data_t Wq_pruned[ATTN_DIM * D_MODEL],
    const data_t Wk_pruned[ATTN_DIM * D_MODEL],
    const data_t Wv_full[D_MODEL * D_MODEL],
    const data_t Wo_full[D_MODEL * D_MODEL],
    const data_t bo_full[D_MODEL]
) {
#pragma HLS ALLOCATION instances=mul limit=64 operation

    // --- v2: physically smaller Q/K buffers ---
    data_t Q[SEQ_LEN][ATTN_DIM];   // 16×14
    data_t K[SEQ_LEN][ATTN_DIM];
    data_t V[SEQ_LEN][D_MODEL];    // FULL 16

    // --- Step A: Q/K/V projection ---
    for (int s = 0; s < SEQ_LEN; ++s) {
        // V projection — FULL D_MODEL
        for (int d = 0; d < D_MODEL; ++d) {
            acc_t sv = 0;
            for (int i = 0; i < D_MODEL; ++i) {
#pragma HLS PIPELINE II=1
                sv += x[s][i] * Wv_full[d * D_MODEL + i];
            }
            V[s][d] = data_t(sv);
        }

        // Q projection — ATTN_DIM output channels
        for (int r = 0; r < ATTN_DIM; ++r) {
            acc_t sq = 0;
            for (int i = 0; i < D_MODEL; ++i) {
#pragma HLS PIPELINE II=1
                sq += x[s][i] * Wq_pruned[r * D_MODEL + i];
            }
            Q[s][r] = feature_map(data_t(sq));
        }

        // K projection — ATTN_DIM output channels
        for (int r = 0; r < ATTN_DIM; ++r) {
            acc_t sk = 0;
            for (int i = 0; i < D_MODEL; ++i) {
#pragma HLS PIPELINE II=1
                sk += x[s][i] * Wk_pruned[r * D_MODEL + i];
            }
            K[s][r] = feature_map(data_t(sk));
        }
    }

    // --- Step B: KV = K^T @ V  →  [ATTN_DIM][D_MODEL] ---
    data_t KV[ATTN_DIM][D_MODEL];
    for (int r = 0; r < ATTN_DIM; ++r) {
        for (int d2 = 0; d2 < D_MODEL; ++d2) {
            acc_t sum = 0;
            for (int t = 0; t < SEQ_LEN; ++t) {
#pragma HLS PIPELINE II=1
                sum += K[t][r] * V[t][d2];
            }
            KV[r][d2] = data_t(sum);
        }
    }

    // --- Step C: K_sum[ATTN_DIM] ---
    data_t K_sum[ATTN_DIM];
    for (int r = 0; r < ATTN_DIM; ++r) {
        acc_t sum = 0;
        for (int t = 0; t < SEQ_LEN; ++t) {
#pragma HLS PIPELINE II=1
            sum += K[t][r];
        }
        K_sum[r] = data_t(sum);
    }

    // --- Step D: Per-position attention output ---
    for (int t = 0; t < SEQ_LEN; ++t) {
        // normalizer = sum_r Q[t][r] * K_sum[r]
        acc_t normalizer = EPS;
        for (int r = 0; r < ATTN_DIM; ++r) {
#pragma HLS PIPELINE II=1
            normalizer += Q[t][r] * K_sum[r];
        }
        data_t inv_norm = data_t(1.0f / normalizer.to_float());

        // attended[d2] = sum_r Q[t][r] * KV[r][d2]
        data_t attended[D_MODEL];
        for (int d2 = 0; d2 < D_MODEL; ++d2) {
            acc_t num = 0;
            for (int r = 0; r < ATTN_DIM; ++r) {
#pragma HLS PIPELINE II=1
                num += Q[t][r] * KV[r][d2];
            }
            attended[d2] = data_t(num * inv_norm);
        }

        // Output projection + residual — FULL D_MODEL
        for (int d = 0; d < D_MODEL; ++d) {
            acc_t sum = bo_full[d];
            for (int i = 0; i < D_MODEL; ++i) {
#pragma HLS PIPELINE II=1
                sum += attended[i] * Wo_full[d * D_MODEL + i];
            }
            x[t][d] = x[t][d] + data_t(sum);
        }
    }
}

// ═══════════════════════════════════════════════════════════════════
//  FeedForward — UNCHANGED (FULL D_MODEL)
// ═══════════════════════════════════════════════════════════════════
static void feedforward(
    data_t x[SEQ_LEN][D_MODEL],
    const data_t W0_flat[FF_DIM * D_MODEL],
    const data_t b0[FF_DIM],
    const data_t W3_flat[D_MODEL * FF_DIM],
    const data_t b3[D_MODEL]
) {
#pragma HLS ALLOCATION instances=mul limit=32 operation

    for (int t = 0; t < SEQ_LEN; ++t) {
        data_t hidden[FF_DIM];
        for (int d = 0; d < FF_DIM; ++d) {
            acc_t sum = b0[d];
            for (int i = 0; i < D_MODEL; ++i) {
#pragma HLS PIPELINE II=1
                sum += x[t][i] * W0_flat[d * D_MODEL + i];
            }
            hidden[d] = data_t(sum);
            if (hidden[d] < data_t(0)) hidden[d] = data_t(0);
        }

        data_t ff_out[D_MODEL];
        for (int d = 0; d < D_MODEL; ++d) {
            acc_t sum = b3[d];
            for (int i = 0; i < FF_DIM; ++i) {
#pragma HLS PIPELINE II=1
                sum += hidden[i] * W3_flat[d * FF_DIM + i];
            }
            ff_out[d] = data_t(sum);
        }

        for (int d = 0; d < D_MODEL; ++d)
            x[t][d] = x[t][d] + ff_out[d];
    }
}

// ═══════════════════════════════════════════════════════════════════
//  Top-level function
// ═══════════════════════════════════════════════════════════════════
void q16_qksv2_d14(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
) {
#pragma HLS INTERFACE m_axi port=input offset=slave bundle=gmem0 depth=1024
#pragma HLS INTERFACE m_axi port=logits offset=slave bundle=gmem1 depth=2
#pragma HLS INTERFACE s_axilite port=input bundle=control
#pragma HLS INTERFACE s_axilite port=logits bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    // --- Input projection + position embedding ---
    data_t x[SEQ_LEN][D_MODEL];
    for (int t = 0; t < SEQ_LEN; ++t) {
        for (int d = 0; d < D_MODEL; ++d) {
            acc_t sum = input_projection_bias[d];
            for (int i = 0; i < INPUT_DIM; ++i) {
#pragma HLS PIPELINE II=1
                sum += input[t][i] *
                       input_projection_weight[d * INPUT_DIM + i];
            }
            x[t][d] = data_t(sum) +
                      position_embedding[t * D_MODEL + d];
        }
    }

    // --- v2 Pruned Attention ---
    attention_v2_pruned(
        x,
        layers_0_attention_query_weight,
        layers_0_attention_key_weight,
        layers_0_attention_value_weight,
        layers_0_attention_output_weight,
        layers_0_attention_output_bias
    );

    // --- LayerNorm 1 (per-token) ---
    for (int t = 0; t < SEQ_LEN; ++t)
        layer_norm(x[t], layers_0_norm1_weight, layers_0_norm1_bias);

    // --- FeedForward ---
    feedforward(
        x,
        layers_0_feedforward_0_weight,
        layers_0_feedforward_0_bias,
        layers_0_feedforward_3_weight,
        layers_0_feedforward_3_bias
    );

    // --- LayerNorm 2 (per-token) ---
    for (int t = 0; t < SEQ_LEN; ++t)
        layer_norm(x[t], layers_0_norm2_weight, layers_0_norm2_bias);

    // --- Mean pool ---
    data_t pooled[D_MODEL];
    for (int d = 0; d < D_MODEL; ++d) {
        acc_t sum = 0;
        for (int t = 0; t < SEQ_LEN; ++t) {
#pragma HLS PIPELINE II=1
            sum += x[t][d];
        }
        pooled[d] = data_t(sum / data_t(SEQ_LEN));
    }
    layer_norm(pooled, output_norm_weight, output_norm_bias);

    // --- Classifier ---
    for (int c = 0; c < N_CLASSES; ++c) {
#pragma HLS UNROLL
        acc_t sum = classifier_bias[c];
        for (int d = 0; d < D_MODEL; ++d) {
#pragma HLS UNROLL
            sum += pooled[d] * classifier_weight[c * D_MODEL + d];
        }
        logits[c] = data_t(sum);
    }
}
