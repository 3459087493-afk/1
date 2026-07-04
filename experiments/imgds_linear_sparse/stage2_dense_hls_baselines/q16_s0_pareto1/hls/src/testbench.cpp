#include "imgds_linear_dense_q16.h"
#include "eval_samples_q16.h"
#include <cstdio>
#include <cmath>
#include <cstdlib>

#define MAX_MISMATCH_PRINT 10

int main() {
    int match_count     = 0;   // hw_pred == ref_pred
    int hw_correct      = 0;   // hw_pred == true_label
    int ref_correct     = 0;   // ref_pred == true_label
    float max_err       = 0.0f;
    float sum_err       = 0.0f;

    // Store first few mismatches for diagnostics
    int    mismatch_ids[MAX_MISMATCH_PRINT];
    float  mismatch_hw0[MAX_MISMATCH_PRINT], mismatch_hw1[MAX_MISMATCH_PRINT];
    float  mismatch_ref0[MAX_MISMATCH_PRINT], mismatch_ref1[MAX_MISMATCH_PRINT];
    int    mismatch_hw_pred[MAX_MISMATCH_PRINT], mismatch_ref_pred[MAX_MISMATCH_PRINT];
    int    mismatch_label[MAX_MISMATCH_PRINT];
    int    mismatch_stored = 0;

    printf("Q16-S0-PARETO1 CSIM Testbench\n");
    printf("==================================================\n");

    for (int n = 0; n < N_EVAL_SAMPLES; n++) {
        data_t input[SEQ_LEN][INPUT_DIM];
        for (int s = 0; s < SEQ_LEN; s++)
            for (int d = 0; d < INPUT_DIM; d++)
                input[s][d] = data_t(eval_inputs_flat[n * SEQ_LEN * INPUT_DIM
                                                      + s * INPUT_DIM + d]);

        data_t logits[2];
        imgds_linear_dense_q16(input, logits);

        int hw_pred  = (logits[0] > logits[1]) ? 0 : 1;
        int ref_pred = (ref_logits[n][0] > ref_logits[n][1]) ? 0 : 1;
        int true_lbl = eval_labels[n];

        if (hw_pred == ref_pred) match_count++;
        else {
            if (mismatch_stored < MAX_MISMATCH_PRINT) {
                mismatch_ids[mismatch_stored]      = n;
                mismatch_hw0[mismatch_stored]      = logits[0].to_float();
                mismatch_hw1[mismatch_stored]      = logits[1].to_float();
                mismatch_ref0[mismatch_stored]     = ref_logits[n][0];
                mismatch_ref1[mismatch_stored]     = ref_logits[n][1];
                mismatch_hw_pred[mismatch_stored]  = hw_pred;
                mismatch_ref_pred[mismatch_stored] = ref_pred;
                mismatch_label[mismatch_stored]    = true_lbl;
            }
            mismatch_stored++;
        }

        if (hw_pred  == true_lbl) hw_correct++;
        if (ref_pred == true_lbl) ref_correct++;

        float err0 = fabsf(logits[0].to_float() - ref_logits[n][0]);
        float err1 = fabsf(logits[1].to_float() - ref_logits[n][1]);
        if (err0 > max_err) max_err = err0;
        if (err1 > max_err) max_err = err1;
        sum_err += err0 + err1;
    }

    // ---- Summary ----
    float match_rate    = (float)match_count / (float)N_EVAL_SAMPLES;
    float mean_err      = sum_err / (float)(N_EVAL_SAMPLES * 2);
    float hw_accuracy   = (float)hw_correct  / (float)N_EVAL_SAMPLES;
    float ref_accuracy  = (float)ref_correct / (float)N_EVAL_SAMPLES;
    int   mismatch_cnt  = N_EVAL_SAMPLES - match_count;

    printf("\n");
    printf("==================================================\n");
    printf("Q16-S0-PARETO1  CSIM Results (N=%d)\n", N_EVAL_SAMPLES);
    printf("==================================================\n");
    printf("  Prediction match rate vs Q32:  %.4f  (%d/%d)\n",
           match_rate, match_count, N_EVAL_SAMPLES);
    printf("  HW  label accuracy:            %.4f  (%d/%d)\n",
           hw_accuracy,  hw_correct,  N_EVAL_SAMPLES);
    printf("  Ref label accuracy:            %.4f  (%d/%d)\n",
           ref_accuracy, ref_correct, N_EVAL_SAMPLES);
    printf("  Mismatch count  (hw!=ref):     %d\n", mismatch_cnt);
    printf("  Max  abs error vs Q32 ref:     %.8f\n", max_err);
    printf("  Mean abs error vs Q32 ref:     %.8f\n", mean_err);

    // Mismatch details
    int print_n = (mismatch_stored < MAX_MISMATCH_PRINT)
                      ? mismatch_stored : MAX_MISMATCH_PRINT;
    if (print_n > 0) {
        printf("\n  First %d mismatches:\n", print_n);
        printf("  %-6s %-14s %-14s %-6s %-6s %-6s\n",
               "sample", "hw_logits", "ref_logits",
               "hw_pr", "ref_pr", "label");
        printf("  %-6s %-14s %-14s %-6s %-6s %-6s\n",
               "------", "--------------", "--------------",
               "-----", "-----", "-----");
        for (int i = 0; i < print_n; i++) {
            printf("  %-6d [%7.4f,%7.4f] [%7.4f,%7.4f] %-5d %-5d %-5d\n",
                   mismatch_ids[i],
                   mismatch_hw0[i],  mismatch_hw1[i],
                   mismatch_ref0[i], mismatch_ref1[i],
                   mismatch_hw_pred[i], mismatch_ref_pred[i],
                   mismatch_label[i]);
        }
        if (mismatch_stored > MAX_MISMATCH_PRINT) {
            printf("  ... and %d more mismatches not shown.\n",
                   mismatch_stored - MAX_MISMATCH_PRINT);
        }
    } else {
        printf("\n  No mismatches — all predictions match Q32 reference.\n");
    }

    // ---- Pass / Fail ----
    bool strict_pass  = (match_rate >= 0.99f);
    bool relaxed_pass = (match_rate >= 0.98f) && (hw_accuracy >= 0.94f);

    printf("\n==================================================\n");
    printf("  strict_threshold_0p99  (match_rate >= 0.99)              : %s\n",
           strict_pass  ? "PASS" : "FAIL");
    printf("  relaxed_threshold_0p98 (match_rate >= 0.98 && hw_acc >= 0.94): %s\n",
           relaxed_pass ? "PASS" : "FAIL");
    printf("==================================================\n");

    if (relaxed_pass) {
        printf("\nCSIM PASSED (relaxed criteria).\n");
        printf("HW label accuracy %.4f confirms the PARETO1 model still classifies correctly.\n",
               hw_accuracy);
    } else {
        printf("\nCSIM FAILED — prediction mismatch rate or HW accuracy too low.\n");
    }

    return relaxed_pass ? 0 : 1;
}
