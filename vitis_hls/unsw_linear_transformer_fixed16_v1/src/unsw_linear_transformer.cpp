#include "unsw_linear_transformer.h"
#include "weights.h"

#include <cmath>

// ── Layer Norm 2D ([seq_len][d_model]) ──
template<typename T_IN, typename T_W, typename T_B, typename T_OUT>
static void layer_norm_2d(
    const T_IN input[UNSW_SEQ_LEN][UNSW_D_MODEL],
    T_OUT output[UNSW_SEQ_LEN][UNSW_D_MODEL],
    const T_W weight[UNSW_D_MODEL],
    const T_B bias[UNSW_D_MODEL]
) {
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        linear_acc_t mean = 0;
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            mean += linear_acc_t(input[sequence][feature]);
        }
        data_t mean_val = data_t(mean / linear_acc_t(UNSW_D_MODEL));

        linear_acc_t variance = 0;
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            data_t centered = data_t(input[sequence][feature]) - mean_val;
            variance += linear_acc_t(centered) * linear_acc_t(centered);
        }
        data_t var_val = data_t(variance / linear_acc_t(UNSW_D_MODEL));
        data_t inv_std;
        {
            float var_float = var_val.to_float();
            inv_std = data_t(1.0f / std::sqrt(var_float + 1.0e-5f));
        }

        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            data_t normalized = data_t(data_t(input[sequence][feature]) - mean_val)
                              * inv_std;
            linear_acc_t scaled = linear_acc_t(normalized)
                                * linear_acc_t(weight[feature])
                                + linear_acc_t(bias[feature]);
            output[sequence][feature] = T_OUT(scaled);
        }
    }
}

// ── Layer Norm 1D ([d_model]) ──
template<typename T_IN, typename T_W, typename T_B, typename T_OUT>
static void layer_norm_1d(
    const T_IN input[UNSW_D_MODEL],
    T_OUT output[UNSW_D_MODEL],
    const T_W weight[UNSW_D_MODEL],
    const T_B bias[UNSW_D_MODEL]
) {
    linear_acc_t mean = 0;
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        mean += linear_acc_t(input[feature]);
    }
    data_t mean_val = data_t(mean / linear_acc_t(UNSW_D_MODEL));

    linear_acc_t variance = 0;
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        data_t centered = data_t(input[feature]) - mean_val;
        variance += linear_acc_t(centered) * linear_acc_t(centered);
    }
    data_t var_val = data_t(variance / linear_acc_t(UNSW_D_MODEL));
    data_t inv_std;
    {
        float var_float = var_val.to_float();
        inv_std = data_t(1.0f / std::sqrt(var_float + 1.0e-5f));
    }

    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        data_t normalized = data_t(data_t(input[feature]) - mean_val)
                          * inv_std;
        linear_acc_t scaled = linear_acc_t(normalized)
                            * linear_acc_t(weight[feature])
                            + linear_acc_t(bias[feature]);
        output[feature] = T_OUT(scaled);
    }
}

// ── Top function ──
void unsw_linear_transformer(
    float input[UNSW_SEQ_LEN][UNSW_INPUT_DIM],
    float logits[UNSW_NUM_CLASSES]
) {
// ── Convert input float → fixed internally ──
    data_t input_fp[UNSW_SEQ_LEN][UNSW_INPUT_DIM];
    for (int s = 0; s < UNSW_SEQ_LEN; ++s) {
        for (int f = 0; f < UNSW_INPUT_DIM; ++f) {
            input_fp[s][f] = data_t(input[s][f]);
        }
    }

// ── 1. Input Embedding ──
    act_t embedded[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            linear_acc_t sum = linear_acc_t(INPUT_PROJECTION_BIAS[output_feature]);
            for (int input_feature = 0; input_feature < UNSW_INPUT_DIM; ++input_feature) {
                sum += linear_acc_t(input_fp[sequence][input_feature])
                     * linear_acc_t(INPUT_PROJECTION_WEIGHT[output_feature][input_feature]);
            }
            sum += linear_acc_t(POSITION_EMBEDDING[0][sequence][output_feature]);
            embedded[sequence][output_feature] = act_t(sum);
        }
    }

// ── 2. Q/K/V Projection ──
    act_t query[UNSW_SEQ_LEN][UNSW_D_MODEL];
    act_t key[UNSW_SEQ_LEN][UNSW_D_MODEL];
    act_t value[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            linear_acc_t query_sum = 0;
            linear_acc_t key_sum = 0;
            linear_acc_t value_sum = 0;
            for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
                const data_t element = embedded[sequence][input_feature];
                query_sum += linear_acc_t(element)
                           * linear_acc_t(LAYERS_0_ATTENTION_QUERY_WEIGHT[output_feature][input_feature]);
                key_sum   += linear_acc_t(element)
                           * linear_acc_t(LAYERS_0_ATTENTION_KEY_WEIGHT[output_feature][input_feature]);
                value_sum += linear_acc_t(element)
                           * linear_acc_t(LAYERS_0_ATTENTION_VALUE_WEIGHT[output_feature][input_feature]);
            }
            // elu_plus_one:
            if (query_sum >= 0) {
                query[sequence][output_feature] = act_t(data_t(query_sum) + data_t(1.0f));
            } else {
                query[sequence][output_feature] = act_t(expf((float)query_sum));
            }
            if (key_sum >= 0) {
                key[sequence][output_feature] = act_t(data_t(key_sum) + data_t(1.0f));
            } else {
                key[sequence][output_feature] = act_t(expf((float)key_sum));
            }
            value[sequence][output_feature] = act_t(value_sum);
        }
    }

// ── 3. KV Outer Accumulation ──
    attn_acc_t key_value[UNSW_D_MODEL][UNSW_D_MODEL];
    for (int key_feature = 0; key_feature < UNSW_D_MODEL; ++key_feature) {
        for (int value_feature = 0; value_feature < UNSW_D_MODEL; ++value_feature) {
            attn_acc_t sum = 0;
            for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
                sum += attn_acc_t(key[sequence][key_feature])
                     * attn_acc_t(value[sequence][value_feature]);
            }
            key_value[key_feature][value_feature] = sum;
        }
    }

// ── 4. Key Sum ──
    fm_t key_sum_arr[UNSW_D_MODEL];
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        linear_acc_t sum = 0;
        for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
            sum += key[sequence][feature];
        }
        key_sum_arr[feature] = fm_t(sum);
    }

// ── 5. Attention ──
    act_t attention[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        attn_acc_t denominator = 0;
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            denominator += attn_acc_t(query[sequence][feature])
                         * attn_acc_t(key_sum_arr[feature]);
        }
        if (denominator < attn_acc_t(0.000001)) {
            denominator = attn_acc_t(0.000001);
        }
        for (int value_feature = 0; value_feature < UNSW_D_MODEL; ++value_feature) {
            attn_acc_t numerator = 0;
            for (int key_feature = 0; key_feature < UNSW_D_MODEL; ++key_feature) {
                numerator += attn_acc_t(query[sequence][key_feature])
                           * key_value[key_feature][value_feature];
            }
            attention[sequence][value_feature] = act_t(numerator / denominator);
        }
    }

// ── 6. Attention Output Projection + Residual 1 ──
    act_t attention_output[UNSW_SEQ_LEN][UNSW_D_MODEL];
    act_t residual1[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            linear_acc_t sum = linear_acc_t(LAYERS_0_ATTENTION_OUTPUT_BIAS[output_feature]);
            for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
                sum += linear_acc_t(attention[sequence][input_feature])
                     * linear_acc_t(LAYERS_0_ATTENTION_OUTPUT_WEIGHT[output_feature][input_feature]);
            }
            attention_output[sequence][output_feature] = act_t(sum);
            residual1[sequence][output_feature] = act_t(
                linear_acc_t(embedded[sequence][output_feature])
                + linear_acc_t(attention_output[sequence][output_feature]));
        }
    }

// ── 7. Layer Norm 1 ──
    act_t norm1[UNSW_SEQ_LEN][UNSW_D_MODEL];
    layer_norm_2d<act_t, weight_t, weight_t, act_t>(
        residual1, norm1,
        LAYERS_0_NORM1_WEIGHT, LAYERS_0_NORM1_BIAS);

// ── 8. FFN Layer 0 (32‑dim, ReLU) ──
    act_t feedforward_hidden[UNSW_SEQ_LEN][UNSW_FF_DIM];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_FF_DIM; ++output_feature) {
            ffn_acc_t sum = ffn_acc_t(LAYERS_0_FEEDFORWARD_0_BIAS[output_feature]);
            for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
                sum += ffn_acc_t(norm1[sequence][input_feature])
                     * ffn_acc_t(LAYERS_0_FEEDFORWARD_0_WEIGHT[output_feature][input_feature]);
            }
            feedforward_hidden[sequence][output_feature] = (sum > 0) ? act_t(sum) : act_t(0);
        }
    }

// ── 9. FFN Layer 3 + Residual 2 ──
    act_t residual2[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            ffn_acc_t sum = ffn_acc_t(LAYERS_0_FEEDFORWARD_3_BIAS[output_feature]);
            for (int input_feature = 0; input_feature < UNSW_FF_DIM; ++input_feature) {
                sum += ffn_acc_t(feedforward_hidden[sequence][input_feature])
                     * ffn_acc_t(LAYERS_0_FEEDFORWARD_3_WEIGHT[output_feature][input_feature]);
            }
            residual2[sequence][output_feature] = act_t(
                linear_acc_t(norm1[sequence][output_feature]) + linear_acc_t(sum));
        }
    }

// ── 10. Layer Norm 2 ──
    act_t norm2[UNSW_SEQ_LEN][UNSW_D_MODEL];
    layer_norm_2d<act_t, weight_t, weight_t, act_t>(
        residual2, norm2,
        LAYERS_0_NORM2_WEIGHT, LAYERS_0_NORM2_BIAS);

// ── 11. Mean Pooling ──
    act_t pooled[UNSW_D_MODEL];
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        linear_acc_t sum = 0;
        for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
            sum += norm2[sequence][feature];
        }
        pooled[feature] = act_t(sum / linear_acc_t(UNSW_SEQ_LEN));
    }

// ── 12. Output Layer Norm ──
    act_t normalized_output[UNSW_D_MODEL];
    layer_norm_1d<act_t, weight_t, weight_t, act_t>(
        pooled, normalized_output,
        OUTPUT_NORM_WEIGHT, OUTPUT_NORM_BIAS);

// ── 13. Classifier ──
    act_t logits_fp[UNSW_NUM_CLASSES];
    for (int output_class = 0; output_class < UNSW_NUM_CLASSES; ++output_class) {
        linear_acc_t sum = linear_acc_t(CLASSIFIER_BIAS[output_class]);
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            sum += linear_acc_t(normalized_output[feature])
                 * linear_acc_t(CLASSIFIER_WEIGHT[output_class][feature]);
        }
        logits_fp[output_class] = act_t(sum);
    }

// ── Convert output: fixed → float for AXI ──
    logits[0] = logits_fp[0].to_float();
    logits[1] = logits_fp[1].to_float();
}