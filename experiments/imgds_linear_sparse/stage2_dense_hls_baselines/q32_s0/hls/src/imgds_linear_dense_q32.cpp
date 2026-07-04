// imgds_linear_dense_q32.cpp — Q32-S0 float HLS reference implementation
//
// Architecture (from src/transformer.py LinearUNSWAnomalyDetector):
//   input [16][64]
//   → input_projection [16][16] + position_embedding [16][16]
//   → LinearEncoderBlock:
//       → LinearAttention (feature_map=elu+1, linear kernel)
//       → Add + LayerNorm
//       → FeedForward (16→32→16, ReLU)
//       → Add + LayerNorm
//   → mean pooling over 16 positions → [16]
//   → output LayerNorm → [16]
//   → classifier → logits [2]

#include "imgds_linear_dense_q32.h"
#include "hls_params_float.h"
#include <cmath>
#include <cstring>

// ---- Helper: elu(x) + 1 -------------------------------------------------
static inline data_t feature_map(data_t x) {
#pragma HLS INLINE
    if (x >= 0.0f) return x + 1.0f;
    else           return expf(x);
}

// ---- Helper: LayerNorm over D elements ----------------------------------
//  y = (x - mean) / sqrt(var + eps) * gamma + beta
static void layer_norm(
    data_t x[D_MODEL],
    const data_t gamma[D_MODEL],
    const data_t beta[D_MODEL]
) {
    // Compute mean
    acc_t sum = 0.0f;
    for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL
        sum += x[i];
    }
    data_t mean = sum / (data_t)D_MODEL;

    // Compute variance
    acc_t var_sum = 0.0f;
    for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL
        data_t diff = x[i] - mean;
        var_sum += diff * diff;
    }
    data_t var = var_sum / (data_t)D_MODEL;
    data_t inv_std = 1.0f / sqrtf(var + EPS);

    // Normalize, scale, shift
    for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL
        x[i] = (x[i] - mean) * inv_std * gamma[i] + beta[i];
    }
}

// ---- Linear layer: out = x @ W^T + bias ----------------------------------
// x: [IN_D], W: [OUT_D][IN_D], bias: [OUT_D], out: [OUT_D]
template<int IN_D, int OUT_D>
static void linear(
    const data_t x[IN_D],
    const data_t W[OUT_D][IN_D],
    const data_t bias[OUT_D],
    bool has_bias,
    data_t out[OUT_D]
) {
    for (int o = 0; o < OUT_D; o++) {
#pragma HLS UNROLL
        acc_t s = 0.0f;
        for (int i = 0; i < IN_D; i++) {
#pragma HLS UNROLL
            s += x[i] * W[o][i];
        }
        out[o] = (data_t)(has_bias ? (s + bias[o]) : s);
    }
}

// ---- Linear Attention ----------------------------------------------------
// Input:  x [SEQ_LEN][D_MODEL]
// Output:  [SEQ_LEN][D_MODEL] (in-place)
static void linear_attention(
    data_t x[SEQ_LEN][D_MODEL],
    const data_t Wq[D_MODEL][D_MODEL],
    const data_t Wk[D_MODEL][D_MODEL],
    const data_t Wv[D_MODEL][D_MODEL],
    const data_t Wo[D_MODEL][D_MODEL],
    const data_t bo[D_MODEL]
) {
    data_t Q[SEQ_LEN][D_MODEL];
    data_t K[SEQ_LEN][D_MODEL];
    data_t V[SEQ_LEN][D_MODEL];

    // Compute Q, K, V projections + feature_map on Q, K
    for (int s = 0; s < SEQ_LEN; s++) {
        data_t q_in[D_MODEL], k_in[D_MODEL], v_in[D_MODEL];
        linear<D_MODEL, D_MODEL>(x[s], Wq, nullptr, false, q_in);
        linear<D_MODEL, D_MODEL>(x[s], Wk, nullptr, false, k_in);
        linear<D_MODEL, D_MODEL>(x[s], Wv, nullptr, false, v_in);
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            Q[s][d] = feature_map(q_in[d]);
            K[s][d] = feature_map(k_in[d]);
            V[s][d] = v_in[d];
        }
    }

    // KV = K^T @ V   → [D_MODEL][D_MODEL]
    data_t KV[D_MODEL][D_MODEL] = {{0.0f}};
    for (int d1 = 0; d1 < D_MODEL; d1++) {
        for (int d2 = 0; d2 < D_MODEL; d2++) {
#pragma HLS UNROLL factor=4
            acc_t s = 0.0f;
            for (int pos = 0; pos < SEQ_LEN; pos++) {  // note: loop variable 'pos' shadows outer
                s += K[pos][d1] * V[pos][d2];
            }
            KV[d1][d2] = (data_t)s;
        }
    }

    // K_sum = row-wise sum of K → [D_MODEL]
    data_t K_sum[D_MODEL];
    for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
        acc_t s = 0.0f;
        for (int pos = 0; pos < SEQ_LEN; pos++) {
            s += K[pos][d];
        }
        K_sum[d] = (data_t)s;
    }

    // Compute per-position output: for each pos, compute Q @ KV / (Q @ K_sum + eps)
    for (int pos = 0; pos < SEQ_LEN; pos++) {
        // normalizer = Q[pos] · K_sum  → scalar
        acc_t normalizer = EPS;
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            normalizer += Q[pos][d] * K_sum[d];
        }
        data_t inv_norm = 1.0f / (data_t)normalizer;

        // attended[pos] = Q[pos] @ KV / normalizer  → [D_MODEL]
        data_t attended[D_MODEL];
        for (int d2 = 0; d2 < D_MODEL; d2++) {
#pragma HLS UNROLL
            acc_t numerator = 0.0f;
            for (int d1 = 0; d1 < D_MODEL; d1++) {
                numerator += Q[pos][d1] * KV[d1][d2];
            }
            attended[d2] = (data_t)(numerator * inv_norm);
        }

        // Output projection
        data_t out_proj[D_MODEL];
        linear<D_MODEL, D_MODEL>(attended, Wo, bo, true, out_proj);

        // Residual: x = x + attn_out
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            x[pos][d] += out_proj[d];
        }
    }
}

// ---- FeedForward: 16→32→16 with ReLU -----------------------------------
static void feedforward(
    data_t x[SEQ_LEN][D_MODEL],
    const data_t W0[FF_DIM][D_MODEL],
    const data_t b0[FF_DIM],
    const data_t W3[D_MODEL][FF_DIM],
    const data_t b3[D_MODEL]
) {
    for (int pos = 0; pos < SEQ_LEN; pos++) {
        // Layer 0: D_MODEL → FF_DIM
        data_t hidden[FF_DIM];
        linear<D_MODEL, FF_DIM>(x[pos], W0, b0, true, hidden);
        // ReLU
        for (int d = 0; d < FF_DIM; d++) {
#pragma HLS UNROLL
            if (hidden[d] < 0.0f) hidden[d] = 0.0f;
        }
        // Layer 3: FF_DIM → D_MODEL
        data_t ff_out[D_MODEL];
        linear<FF_DIM, D_MODEL>(hidden, W3, b3, true, ff_out);
        // Residual
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            x[pos][d] += ff_out[d];
        }
    }
}

// ---- Top-level function --------------------------------------------------
void imgds_linear_dense_q32(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
) {
#pragma HLS INTERFACE ap_memory port=input
#pragma HLS INTERFACE ap_memory port=logits
#pragma HLS ARRAY_PARTITION variable=input   complete dim=2
#pragma HLS ARRAY_PARTITION variable=logits  complete dim=1

    // ---- Step 1: Input projection + positional encoding ----
    data_t x[SEQ_LEN][D_MODEL];
#pragma HLS ARRAY_PARTITION variable=x complete dim=2

    for (int s = 0; s < SEQ_LEN; s++) {
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            acc_t sum = input_projection_bias[d];
            for (int i = 0; i < INPUT_DIM; i++) {
                sum += input[s][i] * input_projection_weight[d * INPUT_DIM + i];
            }
            x[s][d] = (data_t)sum + position_embedding[s * D_MODEL + d];
        }
    }

    // ---- Step 2: Encoder block ----
    // 2a. Linear attention — pack weight matrices from flat arrays
    data_t Wq[D_MODEL][D_MODEL];
    data_t Wk[D_MODEL][D_MODEL];
    data_t Wv[D_MODEL][D_MODEL];
    data_t Wo[D_MODEL][D_MODEL];
    for (int i = 0; i < D_MODEL; i++) {
        for (int j = 0; j < D_MODEL; j++) {
            Wq[i][j] = layers_0_attention_query_weight[i * D_MODEL + j];
            Wk[i][j] = layers_0_attention_key_weight[i * D_MODEL + j];
            Wv[i][j] = layers_0_attention_value_weight[i * D_MODEL + j];
            Wo[i][j] = layers_0_attention_output_weight[i * D_MODEL + j];
        }
    }
    linear_attention(x, Wq, Wk, Wv, Wo, layers_0_attention_output_bias);

    // 2b. Add + LayerNorm1
    for (int s = 0; s < SEQ_LEN; s++) {
        layer_norm(x[s], layers_0_norm1_weight, layers_0_norm1_bias);
    }

    // 2c. FeedForward
    data_t Wff0[FF_DIM][D_MODEL];
    data_t Wff3[D_MODEL][FF_DIM];
    for (int i = 0; i < FF_DIM; i++)
        for (int j = 0; j < D_MODEL; j++)
            Wff0[i][j] = layers_0_feedforward_0_weight[i * D_MODEL + j];
    for (int i = 0; i < D_MODEL; i++)
        for (int j = 0; j < FF_DIM; j++)
            Wff3[i][j] = layers_0_feedforward_3_weight[i * FF_DIM + j];
    feedforward(x, Wff0, layers_0_feedforward_0_bias, Wff3, layers_0_feedforward_3_bias);

    // 2d. Add + LayerNorm2
    for (int s = 0; s < SEQ_LEN; s++) {
        layer_norm(x[s], layers_0_norm2_weight, layers_0_norm2_bias);
    }

    // ---- Step 3: Mean pooling + output norm ----
    data_t pooled[D_MODEL];
    for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
        acc_t s = 0.0f;
        for (int pos = 0; pos < SEQ_LEN; pos++) {
            s += x[pos][d];
        }
        pooled[d] = (data_t)(s / (data_t)SEQ_LEN);
    }
    layer_norm(pooled, output_norm_weight, output_norm_bias);

    // ---- Step 4: Classifier ----
    for (int c = 0; c < N_CLASSES; c++) {
#pragma HLS UNROLL
        acc_t s = classifier_bias[c];
        for (int d = 0; d < D_MODEL; d++) {
            s += pooled[d] * classifier_weight[c * D_MODEL + d];
        }
        logits[c] = (data_t)s;
    }
}
