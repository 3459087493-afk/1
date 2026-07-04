#include "imgds_linear_dense_q32.h"
#include "eval_samples_float.h"
#include <cstdio>
#include <cmath>
#include <cstdlib>

int main() {
    int match_count = 0;
    float max_err = 0.0f;
    float sum_err = 0.0f;

    printf("Q32-S0 CSIM Testbench\n");
    printf("==========================\n");

    for (int n = 0; n < N_EVAL_SAMPLES; n++) {
        data_t input[SEQ_LEN][INPUT_DIM];
        // Load from flat array: eval_inputs_flat[n * SEQ_LEN * INPUT_DIM + ...]
        for (int s = 0; s < SEQ_LEN; s++)
            for (int d = 0; d < INPUT_DIM; d++)
                input[s][d] = (data_t)eval_inputs_flat[n * SEQ_LEN * INPUT_DIM + s * INPUT_DIM + d];

        data_t logits[2];
        imgds_linear_dense_q32(input, logits);

        // Compare with reference
        int hw_pred = (logits[0] > logits[1]) ? 0 : 1;
        int ref_pred = (ref_logits[n][0] > ref_logits[n][1]) ? 0 : 1;
        if (hw_pred == ref_pred) match_count++;

        float err0 = fabsf(logits[0] - (data_t)ref_logits[n][0]);
        float err1 = fabsf(logits[1] - (data_t)ref_logits[n][1]);
        if (err0 > max_err) max_err = err0;
        if (err1 > max_err) max_err = err1;
        sum_err += err0 + err1;

        if (n < 3) {
            printf("  Sample %d: HW=[%.6f,%.6f] Ref=[%.6f,%.6f] pred=%d ref=%d %s\n",
                   n, (float)logits[0], (float)logits[1],
                   ref_logits[n][0], ref_logits[n][1],
                   hw_pred, ref_pred, (hw_pred==ref_pred)?"OK":"MISMATCH");
        }
    }

    float match_rate = (float)match_count / (float)N_EVAL_SAMPLES;
    float mean_err = sum_err / (float)(N_EVAL_SAMPLES * 2);
    printf("\nResults (N=%d):\n", N_EVAL_SAMPLES);
    printf("  Prediction match rate: %.4f\n", match_rate);
    printf("  Max abs error:        %.8f\n", max_err);
    printf("  Mean abs error:       %.8f\n", mean_err);
    printf("\n");

    if (match_rate >= 0.99f)
        printf("CSIM PASSED.\n");
    else
        printf("CSIM FAILED — prediction mismatch rate too high.\n");

    return (match_rate >= 0.99f) ? 0 : 1;
}
