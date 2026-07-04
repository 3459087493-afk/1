// imgds_linear_dense_q16.cpp — Q16-S0 ap_fixed<16,6> HLS baseline
//
// Same architecture as Q32, but using ap_fixed<16,6> for data
// and ap_fixed<24,10> for accumulators.
//
// Architecture:
//   input [16][64]  (ap_fixed<16,6>)
//   → input_projection [16][16] + position_embedding
//   → LinearEncoderBlock (LinearAttention + FFN)
//   → mean pooling → output_norm → classifier → logits [2]

#include "imgds_linear_dense_q16.h"
#include "hls_params_q16.h"
#include <cmath>

static const data_t EPS = data_t(1e-6);

// ---- Helper: elu(x) + 1 -------------------------------------------------
static inline data_t feature_map(data_t x) {
#pragma HLS INLINE
    if (x >= data_t(0)) return x + data_t(1);
    // exp for ap_fixed: convert to float, compute exp, convert back
    float fx = x.to_float();
    return data_t(expf(fx));
}

// ---- Helper: LayerNorm over D_MODEL elements -----------------------------
static void layer_norm_q16(
    data_t x[D_MODEL],
    const data_t gamma[D_MODEL],
    const data_t beta[D_MODEL]
) {
#pragma HLS INLINE
    // Compute mean
    acc_t sum = 0;
    for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL
        sum += x[i];
    }
    data_t mean = sum / (data_t)D_MODEL;

    // Compute variance
    acc_t var_sum = 0;
    for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL
        data_t diff = x[i] - mean;
        var_sum += diff * diff;
    }
    data_t var_val = var_sum / (data_t)D_MODEL;

    // inv_std = 1/sqrt(var + eps)
    float fvar  = var_val.to_float();
    float finv  = 1.0f / sqrtf(fvar + 1e-6f);
    data_t inv_std = data_t(finv);

    // Normalize, scale, shift
    for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL
        data_t normed = (x[i] - mean) * inv_std;
        x[i] = normed * gamma[i] + beta[i];
    }
}

// ---- Linear Attention (ap_fixed) ----------------------------------------
static void linear_attention_q16(
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
#pragma HLS ARRAY_PARTITION variable=Q complete dim=2
#pragma HLS ARRAY_PARTITION variable=K complete dim=2
#pragma HLS ARRAY_PARTITION variable=V complete dim=2

    // Compute Q, K, V projections + feature_map on Q, K
    for (int s = 0; s < SEQ_LEN; s++) {
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            acc_t sq = 0, sk = 0, sv = 0;
            for (int i = 0; i < D_MODEL; i++) {
#pragma HLS UNROLL
                sq += x[s][i] * Wq[d][i];
                sk += x[s][i] * Wk[d][i];
                sv += x[s][i] * Wv[d][i];
            }
            Q[s][d] = feature_map(data_t(sq));
            K[s][d] = feature_map(data_t(sk));
            V[s][d] = data_t(sv);
        }
    }

    // KV = K^T @ V → [D_MODEL][D_MODEL]
    data_t KV[D_MODEL][D_MODEL];
#pragma HLS ARRAY_PARTITION variable=KV complete dim=2
    for (int d1 = 0; d1 < D_MODEL; d1++) {
        for (int d2 = 0; d2 < D_MODEL; d2++) {
            acc_t s = 0;
            for (int pos = 0; pos < SEQ_LEN; pos++) {
                s += K[pos][d1] * V[pos][d2];
            }
            KV[d1][d2] = data_t(s);
        }
    }

    // K_sum = column-wise sum of K → [D_MODEL]
    data_t K_sum[D_MODEL];
#pragma HLS ARRAY_PARTITION variable=K_sum complete dim=1
    for (int d = 0; d < D_MODEL; d++) {
        acc_t s = 0;
        for (int pos = 0; pos < SEQ_LEN; pos++) {
            s += K[pos][d];
        }
        K_sum[d] = data_t(s);
    }

    // Per-position output
    for (int pos = 0; pos < SEQ_LEN; pos++) {
        // normalizer = Q[pos] · K_sum + eps
        acc_t normalizer = EPS;
        for (int d = 0; d < D_MODEL; d++) {
            normalizer += Q[pos][d] * K_sum[d];
        }
        float fnorm = normalizer.to_float();
        data_t inv_norm = data_t(1.0f / fnorm);

        // attended = Q[pos] @ KV / normalizer
        data_t attended[D_MODEL];
#pragma HLS ARRAY_PARTITION variable=attended complete dim=1
        for (int d2 = 0; d2 < D_MODEL; d2++) {
            acc_t numerator = 0;
            for (int d1 = 0; d1 < D_MODEL; d1++) {
                numerator += Q[pos][d1] * KV[d1][d2];
            }
            attended[d2] = data_t(numerator * inv_norm);
        }

        // Output projection + residual
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            acc_t s = bo[d];
            for (int i = 0; i < D_MODEL; i++) {
                s += attended[i] * Wo[d][i];
            }
            x[pos][d] = x[pos][d] + data_t(s);
        }
    }
}

// ---- FeedForward (ap_fixed) ---------------------------------------------
static void feedforward_q16(
    data_t x[SEQ_LEN][D_MODEL],
    const data_t W0[FF_DIM][D_MODEL],
    const data_t b0[FF_DIM],
    const data_t W3[D_MODEL][FF_DIM],
    const data_t b3[D_MODEL]
) {
    for (int pos = 0; pos < SEQ_LEN; pos++) {
        // Layer 0: D_MODEL → FF_DIM
        data_t hidden[FF_DIM];
#pragma HLS ARRAY_PARTITION variable=hidden complete dim=1
        for (int d = 0; d < FF_DIM; d++) {
#pragma HLS UNROLL
            acc_t s = b0[d];
            for (int i = 0; i < D_MODEL; i++) {
                s += x[pos][i] * W0[d][i];
            }
            hidden[d] = data_t(s);
            // ReLU
            if (hidden[d] < data_t(0)) hidden[d] = data_t(0);
        }

        // Layer 3: FF_DIM → D_MODEL
        data_t ff_out[D_MODEL];
#pragma HLS ARRAY_PARTITION variable=ff_out complete dim=1
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            acc_t s = b3[d];
            for (int i = 0; i < FF_DIM; i++) {
                s += hidden[i] * W3[d][i];
            }
            ff_out[d] = data_t(s);
        }

        // Residual
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            x[pos][d] = x[pos][d] + ff_out[d];
        }
    }
}

// ---- Top-level function --------------------------------------------------
void imgds_linear_dense_q16(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
) {
#pragma HLS INTERFACE ap_memory port=input
#pragma HLS INTERFACE ap_memory port=logits
#pragma HLS ARRAY_PARTITION variable=input  complete dim=2
#pragma HLS ARRAY_PARTITION variable=logits complete dim=1

    // ---- Step 1: Input projection + positional encoding ----
    data_t x[SEQ_LEN][D_MODEL];
#pragma HLS ARRAY_PARTITION variable=x complete dim=2

    for (int s = 0; s < SEQ_LEN; s++) {
        for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
            acc_t sum = input_projection_bias[d];
            for (int i = 0; i < INPUT_DIM; i++) {
#pragma HLS UNROLL
                sum += input[s][i] * input_projection_weight[d * INPUT_DIM + i];
            }
            x[s][d] = data_t(sum) + position_embedding[s * D_MODEL + d];
        }
    }

    // ---- Step 2: Encoder block ----
    // Pack weight matrices for attention
    data_t Wq[D_MODEL][D_MODEL], Wk[D_MODEL][D_MODEL];
    data_t Wv[D_MODEL][D_MODEL], Wo[D_MODEL][D_MODEL];
#pragma HLS ARRAY_PARTITION variable=Wq complete dim=2
#pragma HLS ARRAY_PARTITION variable=Wk complete dim=2
#pragma HLS ARRAY_PARTITION variable=Wv complete dim=2
#pragma HLS ARRAY_PARTITION variable=Wo complete dim=2
    for (int i = 0; i < D_MODEL; i++) {
        for (int j = 0; j < D_MODEL; j++) {
            Wq[i][j] = layers_0_attention_query_weight[i * D_MODEL + j];
            Wk[i][j] = layers_0_attention_key_weight[i * D_MODEL + j];
            Wv[i][j] = layers_0_attention_value_weight[i * D_MODEL + j];
            Wo[i][j] = layers_0_attention_output_weight[i * D_MODEL + j];
        }
    }
    linear_attention_q16(x, Wq, Wk, Wv, Wo, layers_0_attention_output_bias);

    // 2b. LayerNorm1
    for (int s = 0; s < SEQ_LEN; s++)
        layer_norm_q16(x[s], layers_0_norm1_weight, layers_0_norm1_bias);

    // 2c. FeedForward
    data_t Wff0[FF_DIM][D_MODEL];
    data_t Wff3[D_MODEL][FF_DIM];
#pragma HLS ARRAY_PARTITION variable=Wff0 complete dim=2
#pragma HLS ARRAY_PARTITION variable=Wff3 complete dim=2
    for (int i = 0; i < FF_DIM; i++)
        for (int j = 0; j < D_MODEL; j++)
            Wff0[i][j] = layers_0_feedforward_0_weight[i * D_MODEL + j];
    for (int i = 0; i < D_MODEL; i++)
        for (int j = 0; j < FF_DIM; j++)
            Wff3[i][j] = layers_0_feedforward_3_weight[i * FF_DIM + j];
    feedforward_q16(x, Wff0, layers_0_feedforward_0_bias, Wff3, layers_0_feedforward_3_bias);

    // 2d. LayerNorm2
    for (int s = 0; s < SEQ_LEN; s++)
        layer_norm_q16(x[s], layers_0_norm2_weight, layers_0_norm2_bias);

    // ---- Step 3: Mean pooling + output norm ----
    data_t pooled[D_MODEL];
#pragma HLS ARRAY_PARTITION variable=pooled complete dim=1
    for (int d = 0; d < D_MODEL; d++) {
#pragma HLS UNROLL
        acc_t s = 0;
        for (int pos = 0; pos < SEQ_LEN; pos++) {
            s += x[pos][d];
        }
        pooled[d] = s / (data_t)SEQ_LEN;
    }
    layer_norm_q16(pooled, output_norm_weight, output_norm_bias);

    // ---- Step 4: Classifier ----
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
