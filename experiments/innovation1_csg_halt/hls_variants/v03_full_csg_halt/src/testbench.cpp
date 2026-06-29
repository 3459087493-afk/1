#include "unsw_linear_transformer.h"
#include "test_vectors.h"

#include <cmath>
#include <iomanip>
#include <iostream>

int main() {
    float maximum_absolute_error = 0.0f;
    double absolute_error_sum = 0.0;
    int prediction_matches = 0;

    std::cout << std::scientific << std::setprecision(9);
    for (int sample = 0; sample < UNSW_NUM_TEST_SAMPLES; ++sample) {
        float input[UNSW_SEQ_LEN][UNSW_INPUT_DIM];
        float actual_logits[UNSW_NUM_CLASSES];
        for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
            for (int feature = 0; feature < UNSW_INPUT_DIM; ++feature) {
                input[sequence][feature] = test_inputs[sample][sequence][feature];
            }
        }

        unsw_linear_transformer(input, actual_logits);

        float sample_max_error = 0.0f;
        float class_absolute_error[UNSW_NUM_CLASSES] = {0.0f, 0.0f};
        for (int output_class = 0; output_class < UNSW_NUM_CLASSES; ++output_class) {
            const float error = std::fabs(
                actual_logits[output_class] - expected_logits[sample][output_class]
            );
            class_absolute_error[output_class] = error;
            absolute_error_sum += error;
            if (error > sample_max_error) {
                sample_max_error = error;
            }
            if (error > maximum_absolute_error) {
                maximum_absolute_error = error;
            }
        }

        const int actual_prediction = actual_logits[1] > actual_logits[0] ? 1 : 0;
        const int expected_prediction = expected_predictions[sample];
        const bool prediction_match = actual_prediction == expected_prediction;
        if (prediction_match) {
            ++prediction_matches;
        }

        std::cout
            << "sample=" << sample
            << " expected_logits=[" << expected_logits[sample][0]
            << "," << expected_logits[sample][1] << "]"
            << " actual_logits=[" << actual_logits[0]
            << "," << actual_logits[1] << "]"
            << " abs_error=[" << class_absolute_error[0]
            << "," << class_absolute_error[1] << "]"
            << " max_abs_error=" << sample_max_error
            << " pred_ref=" << expected_prediction
            << " pred_hls=" << actual_prediction
            << " label=" << expected_labels[sample]
            << " prediction_flipped=" << (prediction_match ? "false" : "true")
            << " prediction_match=" << (prediction_match ? "true" : "false")
            << std::endl;
    }

    const double mean_absolute_error = absolute_error_sum
        / static_cast<double>(UNSW_NUM_TEST_SAMPLES * UNSW_NUM_CLASSES);
    const double prediction_match_rate = static_cast<double>(prediction_matches)
        / static_cast<double>(UNSW_NUM_TEST_SAMPLES);

    std::cout
        << "CSIM_METRICS max_abs_error=" << maximum_absolute_error
        << " mean_abs_error=" << mean_absolute_error
        << " prediction_match_rate=" << prediction_match_rate
        << std::endl;

    if (maximum_absolute_error > UNSW_CSIM_TOLERANCE) {
        std::cerr << "CSIM FAIL: max_abs_error exceeds " << UNSW_CSIM_TOLERANCE << std::endl;
        return 1;
    }
    if (prediction_match_rate < 1.0) {
        std::cerr << "CSIM FAIL: prediction match rate is below 1.0" << std::endl;
        return 1;
    }

    std::cout << "CSIM PASS" << std::endl;
    return 0;
}
