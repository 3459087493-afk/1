/// imgds_linear_dense_q16.cpp
/// Q16-S0-PARETO1 — ap_fixed<16,6> Linear Transformer, ViT4Mal-style HLS.
///
/// Key differences from q16_s0 naive:
///   - NO complete unroll — bounded factor=4 or factor=8
///   - NO complete array partition — cyclic factor=4
///   - NO weight copying to local 2D arrays — direct flat-array access
///   - PIPELINE II=1 on outer loops, UNROLL factor=4 on inner loops
///
/// Architecture (unchanged):
///   input [16][64]  (ap_fixed<16,6>)
///   -> input_projection [16][16] + position_embedding
///   -> LinearEncoderBlock:
///       -> LinearAttention (feature_map=elu+1, K^T.V kernel trick)
///       -> Add + LayerNorm
///       -> FeedForward (16->32->16, ReLU)
///       -> Add + LayerNorm
///   -> mean pooling -> output_norm -> classifier -> logits [2]

#include "imgds_linear_dense_q16.h"
#include "hls_params_q16.h"
#include <cmath>

static const data_t EPS = data_t(1e-6);

// ==========================================================================
//  feature_map  —  elu(x) + 1
// ==========================================================================
static inline data_t feature_map(data_t x) {
#pragma HLS INLINE
    if (x >= data_t(0)) return x + data_t(1);
    float fx = x.to_float();
    return data_t(expf(fx));
}

// ==========================================================================
//  layer_norm  —  cyclic partitioning, pipelined
// ==========================================================================
static void layer_norm_q16(
    data_t x[D_MODEL],
    const data_t gamma[D_MODEL],
    const data_t beta[D_MODEL]
) {
    // Compute mean
    acc_t sum = 0;
    for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL factor=4
        sum += x[i];
    }
    data_t mean = sum / (data_t)D_MODEL;

    // Compute variance
    acc_t var_sum = 0;
    for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL factor=4
        data_t diff = x[i] - mean;
        var_sum += diff * diff;
    }
    data_t var_val = var_sum / (data_t)D_MODEL;

    // inv_std
    float fvar  = var_val.to_float();
    float finv  = 1.0f / sqrtf(fvar + 1e-6f);
    data_t inv_std = data_t(finv);

    // Normalize, scale, shift
    for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL factor=4
        data_t normed = (x[i] - mean) * inv_std;
        x[i] = normed * gamma[i] + beta[i];
    }
}

// ==========================================================================
//  LinearAttention  (kernelized: Q.(K^T.V) / (Q.K_sum + eps))
//
//  Weights accessed directly from flat arrays:
//    Wq[d][i] = layers_0_attention_query_weight[d*D_MODEL + i]
//    Wk[d][i] = layers_0_attention_key_weight  [d*D_MODEL + i]
//    Wv[d][i] = layers_0_attention_value_weight [d*D_MODEL + i]
//    Wo[d][i] = layers_0_attention_output_weight[d*D_MODEL + i]
// ==========================================================================
static void linear_attention_q16(
    data_t x[SEQ_LEN][D_MODEL],
    const data_t Wq_flat[D_MODEL * D_MODEL],
    const data_t Wk_flat[D_MODEL * D_MODEL],
    const data_t Wv_flat[D_MODEL * D_MODEL],
    const data_t Wo_flat[D_MODEL * D_MODEL],
    const data_t bo[D_MODEL]
) {
    // --- Local Q, K, V buffers (cyclic-partitioned) ---
    data_t Q[SEQ_LEN][D_MODEL];
    data_t K[SEQ_LEN][D_MODEL];
    data_t V[SEQ_LEN][D_MODEL];
#pragma HLS ARRAY_PARTITION variable=Q cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=K cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=V cyclic factor=4 dim=2

    // Compute Q, K, V projections + feature_map on Q, K
    for (int s = 0; s < SEQ_LEN; s++) {
#pragma HLS PIPELINE II=1
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL factor=4
            acc_t sq = 0, sk = 0, sv = 0;
            for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL factor=4
                data_t xi = x[s][i];
                sq += xi * Wq_flat[d * D_MODEL + i];
                sk += xi * Wk_flat[d * D_MODEL + i];
                sv += xi * Wv_flat[d * D_MODEL + i];
            }
            Q[s][d] = feature_map(data_t(sq));
            K[s][d] = feature_map(data_t(sk));
            V[s][d] = data_t(sv);
        }
    }

    // KV = K^T @ V   -> [D_MODEL][D_MODEL]   (cyclic-partitioned)
    data_t KV[D_MODEL][D_MODEL];
#pragma HLS ARRAY_PARTITION variable=KV cyclic factor=4 dim=2
    for (int d1 = 0; d1 < D_MODEL; d1++) {
        for (int d2 = 0; d2 < D_MODEL; d2++) {
#pragma HLS PIPELINE II=1
            acc_t s = 0;
            for (int pos = 0; pos < SEQ_LEN; pos++) {
#pragma HLS UNROLL factor=4
                s += K[pos][d1] * V[pos][d2];
            }
            KV[d1][d2] = data_t(s);
        }
    }

    // K_sum = column-wise sum of K -> [D_MODEL]
    data_t K_sum[D_MODEL];
#pragma HLS ARRAY_PARTITION variable=K_sum cyclic factor=4 dim=1
    for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL factor=4
        acc_t s = 0;
        for (int pos = 0; pos < SEQ_LEN; pos++) {
#pragma HLS UNROLL factor=4
            s += K[pos][d];
        }
        K_sum[d] = data_t(s);
    }

    // Per-position output
    for (int pos = 0; pos < SEQ_LEN; pos++) {
#pragma HLS PIPELINE II=2
        // normalizer = Q[pos] . K_sum + eps
        acc_t normalizer = EPS;
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL factor=4
            normalizer += Q[pos][d] * K_sum[d];
        }
        float fnorm = normalizer.to_float();
        data_t inv_norm = data_t(1.0f / fnorm);

        // attended = Q[pos] @ KV / normalizer
        data_t attended[D_MODEL];
#pragma HLS ARRAY_PARTITION variable=attended cyclic factor=4 dim=1
        for (int d2 = 0; d2 < D_MODEL; d2++) {
#pragma HLS UNROLL factor=4
            acc_t numerator = 0;
            for (int d1 = 0; d1 < D_MODEL; d1++) {
#pragma HLS UNROLL factor=4
                numerator += Q[pos][d1] * KV[d1][d2];
            }
            attended[d2] = data_t(numerator * inv_norm);
        }

        // Output projection  + residual
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL factor=4
            acc_t s = bo[d];
            for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL factor=4
                s += attended[i] * Wo_flat[d * D_MODEL + i];
            }
            x[pos][d] = x[pos][d] + data_t(s);
        }
    }
}

// ==========================================================================
//  FeedForward  16->32->16  with ReLU
//
//  Weights accessed directly from flat arrays:
//    W0_flat[d][i]   = layers_0_feedforward_0_weight[d*D_MODEL + i]  [32][16]
//    W3_flat[d][i]   = layers_0_feedforward_3_weight[d*FF_DIM  + i]  [16][32]
// ==========================================================================
static void feedforward_q16(
    data_t x[SEQ_LEN][D_MODEL],
    const data_t W0_flat[FF_DIM * D_MODEL],
    const data_t b0[FF_DIM],
    const data_t W3_flat[D_MODEL * FF_DIM],
    const data_t b3[D_MODEL]
) {
    for (int pos = 0; pos < SEQ_LEN; pos++) {
#pragma HLS PIPELINE II=1
        // Layer 0: D_MODEL -> FF_DIM
        data_t hidden[FF_DIM];
#pragma HLS ARRAY_PARTITION variable=hidden cyclic factor=4 dim=1
        for (int d = 0; d < FF_DIM; d++) {
#pragma HLS UNROLL factor=4
            acc_t s = b0[d];
            for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL factor=4
                s += x[pos][i] * W0_flat[d * D_MODEL + i];
            }
            hidden[d] = data_t(s);
            // ReLU
            if (hidden[d] < data_t(0)) hidden[d] = data_t(0);
        }

        // Layer 3: FF_DIM -> D_MODEL
        data_t ff_out[D_MODEL];
#pragma HLS ARRAY_PARTITION variable=ff_out cyclic factor=4 dim=1
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL factor=4
            acc_t s = b3[d];
            for (int i = 0; i < FF_DIM; i++) {
#pragma HLS UNROLL factor=4
                s += hidden[i] * W3_flat[d * FF_DIM + i];
            }
            ff_out[d] = data_t(s);
        }

        // Residual
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL factor=4
            x[pos][d] = x[pos][d] + ff_out[d];
        }
    }
}

// ==========================================================================
//  Top-level function
// ==========================================================================
void imgds_linear_dense_q16(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
) {
#pragma HLS INTERFACE ap_memory port=input
#pragma HLS INTERFACE ap_memory port=logits
#pragma HLS ARRAY_PARTITION variable=input  cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=logits complete    dim=1

    // ---- Step 1: Input projection + positional encoding ----
    data_t x[SEQ_LEN][D_MODEL];
#pragma HLS ARRAY_PARTITION variable=x cyclic factor=4 dim=2

    for (int s = 0; s < SEQ_LEN; s++) {
#pragma HLS PIPELINE II=1
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL factor=4
            acc_t sum = input_projection_bias[d];
            for (int i = 0; i < INPUT_DIM; i++) {
#pragma HLS UNROLL factor=4
                sum += input[s][i] * input_projection_weight[d * INPUT_DIM + i];
            }
            x[s][d] = data_t(sum) + position_embedding[s * D_MODEL + d];
        }
    }

    // ---- Step 2: Encoder block ----
    // 2a. LinearAttention — pass flat weight arrays directly
    linear_attention_q16(
        x,
        layers_0_attention_query_weight,
        layers_0_attention_key_weight,
        layers_0_attention_value_weight,
        layers_0_attention_output_weight,
        layers_0_attention_output_bias
    );

    // 2b. LayerNorm1
    for (int s = 0; s < SEQ_LEN; s++) {
        layer_norm_q16(x[s], layers_0_norm1_weight, layers_0_norm1_bias);
    }

    // 2c. FeedForward — pass flat weight arrays directly
    feedforward_q16(
        x,
        layers_0_feedforward_0_weight,
        layers_0_feedforward_0_bias,
        layers_0_feedforward_3_weight,
        layers_0_feedforward_3_bias
    );

    // 2d. LayerNorm2
    for (int s = 0; s < SEQ_LEN; s++) {
        layer_norm_q16(x[s], layers_0_norm2_weight, layers_0_norm2_bias);
    }

    // ---- Step 3: Mean pooling + output norm ----
    data_t pooled[D_MODEL];
#pragma HLS ARRAY_PARTITION variable=pooled cyclic factor=4 dim=1
    for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL factor=4
        acc_t s = 0;
        for (int pos = 0; pos < SEQ_LEN; pos++) {
#pragma HLS UNROLL factor=4
            s += x[pos][d];
        }
        pooled[d] = s / (data_t)SEQ_LEN;
    }
    layer_norm_q16(pooled, output_norm_weight, output_norm_bias);

    // ---- Step 4: Classifier (small — 2x16, keep simple) ----
    for (int c = 0; c < N_CLASSES; c++) {
#pragma HLS UNROLL
        acc_t s = classifier_bias[c];
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            s += pooled[d] * classifier_weight[c * D_MODEL + d];
        }
        logits[c] = data_t(s);
    }
}
