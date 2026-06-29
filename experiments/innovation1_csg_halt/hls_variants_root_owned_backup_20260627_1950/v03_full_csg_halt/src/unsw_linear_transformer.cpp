#include "unsw_linear_transformer.h"
#include "weights.h"

static const int ACTIVE_Q_CHANNELS[UNSW_ACTIVE_DIM] = {0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15};
static const int ACTIVE_K_CHANNELS[UNSW_ACTIVE_DIM] = {0, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15};
static const bool Q_ACTIVE_MASK[UNSW_D_MODEL] = {true, false, true, true, true, true, true, true, true, true, true, true, false, true, true, true};

#include <cmath>

static float elu_plus_one(float value) {
    if (value >= 0.0f) {
        return value + 1.0f;
    }
    if (value >= -1.0f) {
        return 1.0f + 0.63212056f * value;
    }
    if (value >= -2.0f) {
        return 0.6004236f + 0.2325442f * value;
    }
    return 0.1353353f;
}

static void layer_norm_2d(
    const float input[UNSW_SEQ_LEN][UNSW_D_MODEL],
    float output[UNSW_SEQ_LEN][UNSW_D_MODEL],
    const float weight[UNSW_D_MODEL],
    const float bias[UNSW_D_MODEL]
) {
    const float epsilon = 1.0e-5f;
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        float mean = 0.0f;
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            mean += input[sequence][feature];
        }
        mean /= static_cast<float>(UNSW_D_MODEL);

        float variance = 0.0f;
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            const float centered = input[sequence][feature] - mean;
            variance += centered * centered;
        }
        variance /= static_cast<float>(UNSW_D_MODEL);
        const float inverse_std = 1.0f / std::sqrt(variance + epsilon);

        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            const float normalized = (input[sequence][feature] - mean) * inverse_std;
            output[sequence][feature] = normalized * weight[feature] + bias[feature];
        }
    }
}

static void layer_norm_1d(
    const float input[UNSW_D_MODEL],
    float output[UNSW_D_MODEL],
    const float weight[UNSW_D_MODEL],
    const float bias[UNSW_D_MODEL]
) {
    const float epsilon = 1.0e-5f;
    float mean = 0.0f;
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        mean += input[feature];
    }
    mean /= static_cast<float>(UNSW_D_MODEL);

    float variance = 0.0f;
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        const float centered = input[feature] - mean;
        variance += centered * centered;
    }
    variance /= static_cast<float>(UNSW_D_MODEL);
    const float inverse_std = 1.0f / std::sqrt(variance + epsilon);

    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        const float normalized = (input[feature] - mean) * inverse_std;
        output[feature] = normalized * weight[feature] + bias[feature];
    }
}

void unsw_linear_transformer(
    float input[UNSW_SEQ_LEN][UNSW_INPUT_DIM],
    float logits[UNSW_NUM_CLASSES]
) {
    float embedded[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            float sum = INPUT_PROJECTION_BIAS[output_feature];
            for (int input_feature = 0; input_feature < UNSW_INPUT_DIM; ++input_feature) {
                sum += input[sequence][input_feature]
                    * INPUT_PROJECTION_WEIGHT[output_feature][input_feature];
            }
            embedded[sequence][output_feature] = sum
                + POSITION_EMBEDDING[0][sequence][output_feature];
        }
    }

    float query[UNSW_SEQ_LEN][UNSW_D_MODEL];
    float key[UNSW_SEQ_LEN][UNSW_D_MODEL];
    float value[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            float query_sum = 0.0f;
            float key_sum = 0.0f;
            float value_sum = 0.0f;
            for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
                const float element = embedded[sequence][input_feature];
                query_sum += element
                    * LAYERS_0_ATTENTION_QUERY_WEIGHT[output_feature][input_feature];
                key_sum += element
                    * LAYERS_0_ATTENTION_KEY_WEIGHT[output_feature][input_feature];
                value_sum += element
                    * LAYERS_0_ATTENTION_VALUE_WEIGHT[output_feature][input_feature];
            }
            query[sequence][output_feature] = elu_plus_one(query_sum);
            key[sequence][output_feature] = elu_plus_one(key_sum);
            value[sequence][output_feature] = value_sum;
        }
    }


    // Bound shared arithmetic to target PYNQ-Z2 resources instead of full unrolling.
    #pragma HLS ALLOCATION operation instances=mul limit=32
    #pragma HLS ALLOCATION operation instances=add limit=32

    // Compact K channels form the physical sparse reduction dimension. Q entries are
    // zeroed when the same channel is absent from the independently calibrated Q set.
    data_t sparse_query[UNSW_SEQ_LEN][UNSW_ACTIVE_DIM];
    data_t sparse_key[UNSW_SEQ_LEN][UNSW_ACTIVE_DIM];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {
            // A modest II exposes sequence parallelism without replicating all multipliers.
            #pragma HLS PIPELINE II=2

            const int channel = ACTIVE_K_CHANNELS[active_feature];
            sparse_key[sequence][active_feature] = key[sequence][channel];
            sparse_query[sequence][active_feature] = Q_ACTIVE_MASK[channel]
                ? query[sequence][channel] : 0.0f;
        }
    }

    attn_acc_t key_value[UNSW_ACTIVE_DIM][UNSW_D_MODEL];
    for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {
        for (int value_feature = 0; value_feature < UNSW_D_MODEL; ++value_feature) {
            attn_acc_t sum = 0.0f;
            for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
                sum += sparse_key[sequence][active_feature] * value[sequence][value_feature];
            }
            key_value[active_feature][value_feature] = sum;
        }
    }

    attn_acc_t key_sum[UNSW_ACTIVE_DIM];
    for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {
        attn_acc_t sum = 0.0f;
        for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
            sum += sparse_key[sequence][active_feature];
        }
        key_sum[active_feature] = sum;
    }

    float attention[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        attn_acc_t denominator = 0.0f;
        for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {
            denominator += sparse_query[sequence][active_feature] * key_sum[active_feature];
        }
        if (denominator < 1.0e-6f) {
            denominator = 1.0e-6f;
        }
        for (int value_feature = 0; value_feature < UNSW_D_MODEL; ++value_feature) {
            attn_acc_t numerator = 0.0f;
            for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {
                numerator += sparse_query[sequence][active_feature]
                    * key_value[active_feature][value_feature];
            }
            attention[sequence][value_feature] = static_cast<float>(numerator / denominator);
        }
    }

    float attention_output[UNSW_SEQ_LEN][UNSW_D_MODEL];
    float residual1[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            float sum = LAYERS_0_ATTENTION_OUTPUT_BIAS[output_feature];
            for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
                sum += attention[sequence][input_feature]
                    * LAYERS_0_ATTENTION_OUTPUT_WEIGHT[output_feature][input_feature];
            }
            attention_output[sequence][output_feature] = sum;
            residual1[sequence][output_feature] = embedded[sequence][output_feature] + sum;
        }
    }

    float norm1[UNSW_SEQ_LEN][UNSW_D_MODEL];
    layer_norm_2d(
        residual1,
        norm1,
        LAYERS_0_NORM1_WEIGHT,
        LAYERS_0_NORM1_BIAS
    );

    float feedforward_hidden[UNSW_SEQ_LEN][UNSW_FF_DIM];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_FF_DIM; ++output_feature) {
            float sum = LAYERS_0_FEEDFORWARD_0_BIAS[output_feature];
            for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
                sum += norm1[sequence][input_feature]
                    * LAYERS_0_FEEDFORWARD_0_WEIGHT[output_feature][input_feature];
            }
            feedforward_hidden[sequence][output_feature] = sum > 0.0f ? sum : 0.0f;
        }
    }

    float residual2[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            float sum = LAYERS_0_FEEDFORWARD_3_BIAS[output_feature];
            for (int input_feature = 0; input_feature < UNSW_FF_DIM; ++input_feature) {
                sum += feedforward_hidden[sequence][input_feature]
                    * LAYERS_0_FEEDFORWARD_3_WEIGHT[output_feature][input_feature];
            }
            residual2[sequence][output_feature] = norm1[sequence][output_feature] + sum;
        }
    }

    float norm2[UNSW_SEQ_LEN][UNSW_D_MODEL];
    layer_norm_2d(
        residual2,
        norm2,
        LAYERS_0_NORM2_WEIGHT,
        LAYERS_0_NORM2_BIAS
    );

    float pooled[UNSW_D_MODEL];
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        float sum = 0.0f;
        for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
            sum += norm2[sequence][feature];
        }
        pooled[feature] = sum / static_cast<float>(UNSW_SEQ_LEN);
    }

    float normalized_output[UNSW_D_MODEL];
    layer_norm_1d(pooled, normalized_output, OUTPUT_NORM_WEIGHT, OUTPUT_NORM_BIAS);

    for (int output_class = 0; output_class < UNSW_NUM_CLASSES; ++output_class) {
        float sum = CLASSIFIER_BIAS[output_class];
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            sum += normalized_output[feature] * CLASSIFIER_WEIGHT[output_class][feature];
        }
        logits[output_class] = sum;
    }
}
