/// imgds_linear_dense_q8.cpp — Q8-S30 Sparse Attention
/// Q8 weight storage + Q16 computation path + compile-time sparse Q/K channels.
///
/// Sparse: ACTIVE_DIM Q/K channels (compiled from active_channels.h).
/// V, output projection, feedforward, classifier are FULL (all 16 channels).
///
/// Architecture:
///   input [16][64] -> input_projection [16][16] + pos_embed
///   -> SparseLinearAttention (elu+1; ACTIVE_DIM Q/K, full V)
///   -> Add + LayerNorm -> FeedForward (16->32->16, ReLU)
///   -> Add + LayerNorm -> mean_pool -> LayerNorm -> classifier -> [2]

#include "imgds_linear_dense_q8.h"
#include "hls_params_q8.h"
#include "active_channels.h"
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
//  layer_norm_q8  —  D_MODEL=16, fully serial, small
// ==========================================================================
static void layer_norm_q8(
    data_t x[D_MODEL],
    const ap_fixed<8,4> gamma[D_MODEL],
    const ap_fixed<8,4> beta[D_MODEL]
) {
    acc_t sum = 0;
    for (int i = 0; i < D_MODEL; i++)
        sum += x[i];
    data_t mean = sum / (data_t)D_MODEL;

    acc_t var_sum = 0;
    for (int i = 0; i < D_MODEL; i++) {
        data_t diff = x[i] - mean;
        var_sum += diff * diff;
    }
    data_t var_val = var_sum / (data_t)D_MODEL;

    float fvar  = var_val.to_float();
    float finv  = 1.0f / sqrtf(fvar + 1e-6f);
    data_t inv_std = data_t(finv);

    for (int i = 0; i < D_MODEL; i++) {
        data_t normed = (x[i] - mean) * inv_std;
        x[i] = normed * gamma[i] + beta[i];
    }
}

// ==========================================================================
//  SparseLinearAttention — Q/K computed ONLY for ACTIVE_DIM channels
//  V and output projection: FULL 16 channels
//  DSP sharing unchanged from PARETO2
// ==========================================================================
static void linear_attention_q8_sparse(
    data_t x[SEQ_LEN][D_MODEL],
    const ap_fixed<8,4> Wq_flat[D_MODEL * D_MODEL],
    const ap_fixed<8,4> Wk_flat[D_MODEL * D_MODEL],
    const ap_fixed<8,4> Wv_flat[D_MODEL * D_MODEL],
    const ap_fixed<8,4> Wo_flat[D_MODEL * D_MODEL],
    const ap_fixed<8,4> bo[D_MODEL]
) {
#pragma HLS ALLOCATION instances=mul limit=64 operation

    data_t Q[SEQ_LEN][D_MODEL];   // Only active channels computed
    data_t K[SEQ_LEN][D_MODEL];   // Only active channels computed
    data_t V[SEQ_LEN][D_MODEL];   // ALL channels computed

    // --- Step A: Separate V (full) from Q/K (active only) ---
    for (int s = 0; s < SEQ_LEN; s++) {
        // Compute V for ALL 16 channels
        for (int d = 0; d < D_MODEL; d++) {
            acc_t sv = 0;
            for (int i = 0; i < D_MODEL; i++) {
#pragma HLS PIPELINE II=1
                sv += x[s][i] * Wv_flat[d * D_MODEL + i];
            }
            V[s][d] = data_t(sv);
        }
        // Compute Q/K ONLY for ACTIVE_CHANNELS (compile-time truncated loop)
        for (int ii = 0; ii < ACTIVE_DIM; ii++) {
            int d = ACTIVE_CHANNELS[ii];
            acc_t sq = 0, sk = 0;
            for (int i = 0; i < D_MODEL; i++) {
#pragma HLS PIPELINE II=1
                data_t xi = x[s][i];
                sq += xi * Wq_flat[d * D_MODEL + i];
                sk += xi * Wk_flat[d * D_MODEL + i];
            }
            Q[s][d] = feature_map(data_t(sq));
            K[s][d] = feature_map(data_t(sk));
        }
    }

    // --- Step B: KV = K^T @ V — only for ACTIVE K channels ---
    data_t KV[D_MODEL][D_MODEL];
    for (int ii = 0; ii < ACTIVE_DIM; ii++) {
        int d1 = ACTIVE_CHANNELS[ii];
        for (int d2 = 0; d2 < D_MODEL; d2++) {
            acc_t s = 0;
            for (int pos = 0; pos < SEQ_LEN; pos++) {
#pragma HLS PIPELINE II=1
                s += K[pos][d1] * V[pos][d2];
            }
            KV[d1][d2] = data_t(s);
        }
    }

    // --- Step C: K_sum — only for ACTIVE channels ---
    data_t K_sum[D_MODEL];
    for (int ii = 0; ii < ACTIVE_DIM; ii++) {
        int d = ACTIVE_CHANNELS[ii];
        acc_t s = 0;
        for (int pos = 0; pos < SEQ_LEN; pos++) {
#pragma HLS PIPELINE II=1
            s += K[pos][d];
        }
        K_sum[d] = data_t(s);
    }

    // --- Step D: Per-position output using only ACTIVE Q/K ---
    for (int pos = 0; pos < SEQ_LEN; pos++) {
        // Normalizer = sum over active d of Q[pos][d] * K_sum[d] + eps
        acc_t _normalizer = EPS;
        for (int ii = 0; ii < ACTIVE_DIM; ii++) {
            int d = ACTIVE_CHANNELS[ii];
#pragma HLS PIPELINE II=1
            _normalizer += Q[pos][d] * K_sum[d];
        }
        float fnorm = _normalizer.to_float();
        data_t inv_norm = data_t(1.0f / fnorm);

        // attended[d2] = sum over active d1 of Q[pos][d1] * KV[d1][d2]
        data_t attended[D_MODEL];
        for (int d2 = 0; d2 < D_MODEL; d2++) {
            acc_t numerator = 0;
            for (int ii = 0; ii < ACTIVE_DIM; ii++) {
                int d1 = ACTIVE_CHANNELS[ii];
#pragma HLS PIPELINE II=1
                numerator += Q[pos][d1] * KV[d1][d2];
            }
            attended[d2] = data_t(numerator * inv_norm);
        }

        // Output projection + residual (unchanged — uses FULL attended)
        for (int d = 0; d < D_MODEL; d++) {
            acc_t s = bo[d];
            for (int i = 0; i < D_MODEL; i++) {
#pragma HLS PIPELINE II=1
                s += attended[i] * Wo_flat[d * D_MODEL + i];
            }
            x[pos][d] = x[pos][d] + data_t(s);
        }
    }
}

// ==========================================================================
//  FeedForward  16→32→16  with ReLU — serial, DSP-shared (unchanged)
// ==========================================================================
static void feedforward_q8(
    data_t x[SEQ_LEN][D_MODEL],
    const ap_fixed<8,4> W0_flat[FF_DIM * D_MODEL],
    const ap_fixed<8,4> b0[FF_DIM],
    const ap_fixed<8,4> W3_flat[D_MODEL * FF_DIM],
    const ap_fixed<8,4> b3[D_MODEL]
) {
#pragma HLS ALLOCATION instances=mul limit=32 operation

    for (int pos = 0; pos < SEQ_LEN; pos++) {
        // Layer 0: D_MODEL → FF_DIM  [16 → 32]
        data_t hidden[FF_DIM];
        for (int d = 0; d < FF_DIM; d++) {
            acc_t s = b0[d];
            for (int i = 0; i < D_MODEL; i++) {
#pragma HLS PIPELINE II=1
                s += x[pos][i] * W0_flat[d * D_MODEL + i];
            }
            hidden[d] = data_t(s);
            if (hidden[d] < data_t(0)) hidden[d] = data_t(0);  // ReLU
        }

        // Layer 3: FF_DIM → D_MODEL  [32 → 16]
        data_t ff_out[D_MODEL];
        for (int d = 0; d < D_MODEL; d++) {
            acc_t s = b3[d];
            for (int i = 0; i < FF_DIM; i++) {
#pragma HLS PIPELINE II=1
                s += hidden[i] * W3_flat[d * FF_DIM + i];
            }
            ff_out[d] = data_t(s);
        }

        // Residual
        for (int d = 0; d < D_MODEL; d++)
            x[pos][d] = x[pos][d] + ff_out[d];
    }
}

// ==========================================================================
//  Top-level function — AXI interfaces for PYNQ-Z2
// ==========================================================================
void imgds_linear_dense_q8(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
) {
#pragma HLS INTERFACE m_axi     port=input  offset=slave bundle=gmem0 depth=1024
#pragma HLS INTERFACE m_axi     port=logits offset=slave bundle=gmem1 depth=2
#pragma HLS INTERFACE s_axilite port=input  bundle=control
#pragma HLS INTERFACE s_axilite port=logits bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control
#pragma HLS ALLOCATION instances=mul limit=32 operation

    // ---- Step 1: Input projection + positional encoding ----
    data_t x[SEQ_LEN][D_MODEL];
    for (int s = 0; s < SEQ_LEN; s++) {
        for (int d = 0; d < D_MODEL; d++) {
            acc_t sum = input_projection_bias[d];
            for (int i = 0; i < INPUT_DIM; i++) {
#pragma HLS PIPELINE II=1
                sum += input[s][i] * input_projection_weight[d * INPUT_DIM + i];
            }
            x[s][d] = data_t(sum) + position_embedding[s * D_MODEL + d];
        }
    }

    // ---- Step 2: Encoder block ----
    // 2a. Sparse LinearAttention (ACTIVE_DIM Q/K, full V/output)
    linear_attention_q8_sparse(
        x,
        layers_0_attention_query_weight,
        layers_0_attention_key_weight,
        layers_0_attention_value_weight,
        layers_0_attention_output_weight,
        layers_0_attention_output_bias
    );

    // 2b. LayerNorm1
    for (int s = 0; s < SEQ_LEN; s++)
        layer_norm_q8(x[s], layers_0_norm1_weight, layers_0_norm1_bias);

    // 2c. FeedForward
    feedforward_q8(
        x,
        layers_0_feedforward_0_weight,
        layers_0_feedforward_0_bias,
        layers_0_feedforward_3_weight,
        layers_0_feedforward_3_bias
    );

    // 2d. LayerNorm2
    for (int s = 0; s < SEQ_LEN; s++)
        layer_norm_q8(x[s], layers_0_norm2_weight, layers_0_norm2_bias);

    // ---- Step 3: Mean pooling + output norm ----
    data_t pooled[D_MODEL];
    for (int d = 0; d < D_MODEL; d++) {
        acc_t s = 0;
        for (int pos = 0; pos < SEQ_LEN; pos++) {
#pragma HLS PIPELINE II=1
            s += x[pos][d];
        }
        pooled[d] = s / (data_t)SEQ_LEN;
    }
    layer_norm_q8(pooled, output_norm_weight, output_norm_bias);

    // ---- Step 4: Classifier (2×16, tiny — complete unroll fine) ----
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
