#include "imgds_linear_dense_q4.h"
#include "eval_samples_q4.h"
#include <cstdio>
#include <cmath>

#define MAX_MISMATCH_PRINT 10

int main() {
    int match_count = 0, hw_correct = 0, ref_correct = 0;
    float max_err = 0.0f, sum_err = 0.0f;
    int mismatch_ids[MAX_MISMATCH_PRINT];
    float mismatch_hw0[MAX_MISMATCH_PRINT], mismatch_hw1[MAX_MISMATCH_PRINT];
    float mismatch_ref0[MAX_MISMATCH_PRINT], mismatch_ref1[MAX_MISMATCH_PRINT];
    int mismatch_hw_pred[MAX_MISMATCH_PRINT], mismatch_ref_pred[MAX_MISMATCH_PRINT];
    int mismatch_label[MAX_MISMATCH_PRINT], mismatch_stored = 0;

    printf("Q4-S10 CSIM Testbench\n");
    printf("==================================================\n");

    for (int n = 0; n < N_EVAL_SAMPLES; n++) {
        data_t input[SEQ_LEN][INPUT_DIM];
        for (int s = 0; s < SEQ_LEN; s++)
            for (int d = 0; d < INPUT_DIM; d++)
                input[s][d] = data_t(eval_inputs_flat[n * SEQ_LEN * INPUT_DIM + s * INPUT_DIM + d]);
        data_t logits[2];
        imgds_linear_dense_q4(input, logits);

        int hw_pred = (logits[0] > logits[1]) ? 0 : 1;
        int ref_pred = (ref_logits[n][0] > ref_logits[n][1]) ? 0 : 1;
        int lbl = eval_labels[n];

        if (hw_pred == ref_pred) match_count++;
        else {
            if (mismatch_stored < MAX_MISMATCH_PRINT) {
                mismatch_ids[mismatch_stored]=n;
                mismatch_hw0[mismatch_stored]=logits[0].to_float();
                mismatch_hw1[mismatch_stored]=logits[1].to_float();
                mismatch_ref0[mismatch_stored]=ref_logits[n][0];
                mismatch_ref1[mismatch_stored]=ref_logits[n][1];
                mismatch_hw_pred[mismatch_stored]=hw_pred;
                mismatch_ref_pred[mismatch_stored]=ref_pred;
                mismatch_label[mismatch_stored]=lbl;
            }
            mismatch_stored++;
        }
        if (hw_pred == lbl) hw_correct++;
        if (ref_pred == lbl) ref_correct++;
        float e0 = fabsf(logits[0].to_float()-ref_logits[n][0]);
        float e1 = fabsf(logits[1].to_float()-ref_logits[n][1]);
        if (e0>max_err) max_err=e0;
        if (e1>max_err) max_err=e1;
        sum_err += e0+e1;
    }

    float mr = (float)match_count/N_EVAL_SAMPLES;
    float me = sum_err/(N_EVAL_SAMPLES*2);
    float ha = (float)hw_correct/N_EVAL_SAMPLES;
    float ra = (float)ref_correct/N_EVAL_SAMPLES;
    int mc = N_EVAL_SAMPLES - match_count;

    printf("\n==================================================\n");
    printf("Q4-S10 CSIM Results (N=%d)\n", N_EVAL_SAMPLES);
    printf("==================================================\n");
    printf("  Prediction match rate vs Q4 ref:  %.4f  (%d/%d)\n", mr, match_count, N_EVAL_SAMPLES);
    printf("  HW  label accuracy:               %.4f  (%d/%d)\n", ha, hw_correct, N_EVAL_SAMPLES);
    printf("  Ref label accuracy:               %.4f  (%d/%d)\n", ra, ref_correct, N_EVAL_SAMPLES);
    printf("  Mismatch count (hw!=ref):         %d\n", mc);
    printf("  Max  abs error vs Q4 ref:         %.8f\n", max_err);
    printf("  Mean abs error vs Q4 ref:         %.8f\n", me);

    int pn = (mismatch_stored<MAX_MISMATCH_PRINT)?mismatch_stored:MAX_MISMATCH_PRINT;
    if (pn>0) {
        printf("\n  First %d mismatches:\n", pn);
        for (int i=0; i<pn; i++)
            printf("  %-6d [%7.4f,%7.4f] [%7.4f,%7.4f] hw=%d ref=%d lbl=%d\n",
                   mismatch_ids[i],mismatch_hw0[i],mismatch_hw1[i],
                   mismatch_ref0[i],mismatch_ref1[i],
                   mismatch_hw_pred[i],mismatch_ref_pred[i],mismatch_label[i]);
    }

    bool ok = mr >= 0.90f;
    printf("\n==================================================\n");
    printf("  Match >= 0.90: %s\n", ok?"PASS":"FAIL");
    printf("==================================================\n");
    if (ok) printf("\nCSIM PASSED. HW acc=%.4f.\n", ha);
    else printf("\nCSIM FAILED (match=%.4f < 0.90).\n", mr);
    return ok?0:1;
}
