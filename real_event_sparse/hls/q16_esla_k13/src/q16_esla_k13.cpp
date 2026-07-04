#include "q16_esla_k13.h"
#include "hls_params_q16.h"
#include <cmath>

static const data_t EPS = data_t(1e-6);

static inline data_t feature_map(data_t x) {
#pragma HLS INLINE
    if (x >= data_t(0)) return x + data_t(1);
    return data_t(expf(x.to_float()));
}

static void layer_norm_q16(
    data_t x[D_MODEL],
    const data_t gamma[D_MODEL],
    const data_t beta[D_MODEL]
) {
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

// Fixed small selector: sort the 16 score/index pairs descending, retain the
// first 13, then restore original token order for sequence semantics.
static void select_top13(
    const acc_t token_score[SEQ_LEN],
    int active_token_indices[ACTIVE_TOKEN_NUM]
) {
    acc_t sorted_score[SEQ_LEN];
    int sorted_index[SEQ_LEN];
    for (int i = 0; i < SEQ_LEN; ++i) {
        sorted_score[i] = token_score[i];
        sorted_index[i] = i;
    }

    for (int i = 1; i < SEQ_LEN; ++i) {
        acc_t key_score = sorted_score[i];
        int key_index = sorted_index[i];
        int j = i - 1;
        while (j >= 0 &&
               (sorted_score[j] < key_score ||
                (sorted_score[j] == key_score && sorted_index[j] > key_index))) {
            sorted_score[j + 1] = sorted_score[j];
            sorted_index[j + 1] = sorted_index[j];
            --j;
        }
        sorted_score[j + 1] = key_score;
        sorted_index[j + 1] = key_index;
    }

    for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a)
        active_token_indices[a] = sorted_index[a];

    // Compact sequence retains the original positional order.
    for (int i = 1; i < ACTIVE_TOKEN_NUM; ++i) {
        int key = active_token_indices[i];
        int j = i - 1;
        while (j >= 0 && active_token_indices[j] > key) {
            active_token_indices[j + 1] = active_token_indices[j];
            --j;
        }
        active_token_indices[j + 1] = key;
    }
}

static void attention_active13(
    data_t x_active[ACTIVE_TOKEN_NUM][D_MODEL],
    const data_t phi_k_active[ACTIVE_TOKEN_NUM][D_MODEL]
) {
#pragma HLS ALLOCATION instances=mul limit=64 operation
    data_t Q[ACTIVE_TOKEN_NUM][D_MODEL];
    data_t V[ACTIVE_TOKEN_NUM][D_MODEL];

    // Real reduced token path: Q and V are generated only for 13 compact tokens.
    for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a) {
        for (int d = 0; d < D_MODEL; ++d) {
            acc_t sq = 0;
            acc_t sv = 0;
            for (int i = 0; i < D_MODEL; ++i) {
#pragma HLS PIPELINE II=1
                data_t xi = x_active[a][i];
                sq += xi * layers_0_attention_query_weight[d * D_MODEL + i];
                sv += xi * layers_0_attention_value_weight[d * D_MODEL + i];
            }
            Q[a][d] = feature_map(data_t(sq));
            V[a][d] = data_t(sv);
        }
    }

    data_t KV[D_MODEL][D_MODEL];
    for (int d1 = 0; d1 < D_MODEL; ++d1) {
        for (int d2 = 0; d2 < D_MODEL; ++d2) {
            acc_t sum = 0;
            for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a) {
#pragma HLS PIPELINE II=1
                sum += phi_k_active[a][d1] * V[a][d2];
            }
            KV[d1][d2] = data_t(sum);
        }
    }

    data_t K_sum[D_MODEL];
    for (int d = 0; d < D_MODEL; ++d) {
        acc_t sum = 0;
        for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a) {
#pragma HLS PIPELINE II=1
            sum += phi_k_active[a][d];
        }
        K_sum[d] = data_t(sum);
    }

    for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a) {
        acc_t normalizer = EPS;
        for (int d = 0; d < D_MODEL; ++d) {
#pragma HLS PIPELINE II=1
            normalizer += Q[a][d] * K_sum[d];
        }
        data_t inv_normalizer = data_t(1.0f / normalizer.to_float());

        data_t attended[D_MODEL];
        for (int d2 = 0; d2 < D_MODEL; ++d2) {
            acc_t numerator = 0;
            for (int d1 = 0; d1 < D_MODEL; ++d1) {
#pragma HLS PIPELINE II=1
                numerator += Q[a][d1] * KV[d1][d2];
            }
            attended[d2] = data_t(numerator * inv_normalizer);
        }

        for (int d = 0; d < D_MODEL; ++d) {
            acc_t sum = layers_0_attention_output_bias[d];
            for (int i = 0; i < D_MODEL; ++i) {
#pragma HLS PIPELINE II=1
                sum += attended[i] *
                       layers_0_attention_output_weight[d * D_MODEL + i];
            }
            x_active[a][d] = x_active[a][d] + data_t(sum);
        }
    }
}

static void feedforward_active13(
    data_t x_active[ACTIVE_TOKEN_NUM][D_MODEL]
) {
#pragma HLS ALLOCATION instances=mul limit=32 operation
    for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a) {
        data_t hidden[FF_DIM];
        for (int d = 0; d < FF_DIM; ++d) {
            acc_t sum = layers_0_feedforward_0_bias[d];
            for (int i = 0; i < D_MODEL; ++i) {
#pragma HLS PIPELINE II=1
                sum += x_active[a][i] *
                       layers_0_feedforward_0_weight[d * D_MODEL + i];
            }
            hidden[d] = data_t(sum);
            if (hidden[d] < data_t(0)) hidden[d] = data_t(0);
        }

        data_t ff_out[D_MODEL];
        for (int d = 0; d < D_MODEL; ++d) {
            acc_t sum = layers_0_feedforward_3_bias[d];
            for (int i = 0; i < FF_DIM; ++i) {
#pragma HLS PIPELINE II=1
                sum += hidden[i] *
                       layers_0_feedforward_3_weight[d * FF_DIM + i];
            }
            ff_out[d] = data_t(sum);
        }
        for (int d = 0; d < D_MODEL; ++d)
            x_active[a][d] = x_active[a][d] + ff_out[d];
    }
}

void q16_esla_k13(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES],
    int active_token_indices[ACTIVE_TOKEN_NUM]
) {
#pragma HLS INTERFACE m_axi port=input offset=slave bundle=gmem0 depth=1024
#pragma HLS INTERFACE m_axi port=logits offset=slave bundle=gmem1 depth=2
#pragma HLS INTERFACE m_axi port=active_token_indices offset=slave bundle=gmem2 depth=13
#pragma HLS INTERFACE s_axilite port=input bundle=control
#pragma HLS INTERFACE s_axilite port=logits bundle=control
#pragma HLS INTERFACE s_axilite port=active_token_indices bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    // Stage 1: faithful score requires dense 16-token input projection.
    data_t x_full[SEQ_LEN][D_MODEL];
    for (int s = 0; s < SEQ_LEN; ++s) {
        for (int d = 0; d < D_MODEL; ++d) {
            acc_t sum = input_projection_bias[d];
            for (int i = 0; i < INPUT_DIM; ++i) {
#pragma HLS PIPELINE II=1
                sum += input[s][i] *
                       input_projection_weight[d * INPUT_DIM + i];
            }
            x_full[s][d] = data_t(sum) +
                           position_embedding[s * D_MODEL + d];
        }
    }

    // Stage 2: dense K/phi(K) for all 16 score candidates. K is not recomputed.
    data_t phi_k_full[SEQ_LEN][D_MODEL];
    acc_t token_score[SEQ_LEN];
    for (int s = 0; s < SEQ_LEN; ++s) {
        acc_t score_sum = 0;
        for (int d = 0; d < D_MODEL; ++d) {
            acc_t key_sum = 0;
            for (int i = 0; i < D_MODEL; ++i) {
#pragma HLS PIPELINE II=1
                key_sum += x_full[s][i] *
                           layers_0_attention_key_weight[d * D_MODEL + i];
            }
            data_t phi_k = feature_map(data_t(key_sum));
            phi_k_full[s][d] = phi_k;
            data_t abs_phi_k = phi_k;
            if (abs_phi_k < data_t(0)) abs_phi_k = data_t(-phi_k);
            score_sum += abs_phi_k;
        }
        token_score[s] = score_sum / acc_t(D_MODEL);
    }

    // Stage 3: fixed top-13 active-token list.
    select_top13(token_score, active_token_indices);

    // Stage 4: physical compaction; no 16-token mask is used downstream.
    data_t x_active[ACTIVE_TOKEN_NUM][D_MODEL];
    data_t phi_k_active[ACTIVE_TOKEN_NUM][D_MODEL];
    for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a) {
        int source_token = active_token_indices[a];
        for (int d = 0; d < D_MODEL; ++d) {
            x_active[a][d] = x_full[source_token][d];
            phi_k_active[a][d] = phi_k_full[source_token][d];
        }
    }

    attention_active13(x_active, phi_k_active);

    for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a)
        layer_norm_q16(
            x_active[a], layers_0_norm1_weight, layers_0_norm1_bias
        );

    feedforward_active13(x_active);

    for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a)
        layer_norm_q16(
            x_active[a], layers_0_norm2_weight, layers_0_norm2_bias
        );

    // Event-aware pooling uses 13, not the original SEQ_LEN=16.
    data_t pooled[D_MODEL];
    for (int d = 0; d < D_MODEL; ++d) {
        acc_t sum = 0;
        for (int a = 0; a < ACTIVE_TOKEN_NUM; ++a) {
#pragma HLS PIPELINE II=1
            sum += x_active[a][d];
        }
        pooled[d] = data_t(sum / acc_t(ACTIVE_TOKEN_NUM));
    }
    layer_norm_q16(pooled, output_norm_weight, output_norm_bias);

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
