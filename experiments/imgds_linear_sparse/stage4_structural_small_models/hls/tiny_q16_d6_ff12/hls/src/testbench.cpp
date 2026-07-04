#include "imgds_linear_tiny.h"
#include "eval_samples_tiny.h"
#include <cstdio>
#include <cmath>
#define MAX_MM 10
int main() {
    int mc=0,hc=0,rc=0,ms=0;
    float me=0.0f,se=0.0f;
    int mids[MAX_MM]; float mh0[MAX_MM],mh1[MAX_MM],mr0[MAX_MM],mr1[MAX_MM];
    int mhp[MAX_MM],mrp[MAX_MM],ml[MAX_MM];
    printf("small_B CSIM Testbench\n==================================================\n");
    for (int n=0; n<N_EVAL_SAMPLES; n++) {
        data_t input[SEQ_LEN][INPUT_DIM];
        for (int s=0; s<SEQ_LEN; s++)
            for (int d=0; d<INPUT_DIM; d++)
                input[s][d]=data_t(eval_inputs_flat[n*SEQ_LEN*INPUT_DIM+s*INPUT_DIM+d]);
        data_t logits[2]; imgds_linear_tiny(input,logits);
        int hp=(logits[0]>logits[1])?0:1;
        int rp=(ref_logits[n][0]>ref_logits[n][1])?0:1;
        int lb=eval_labels[n];
        if (hp==rp) mc++; else {
            if (ms<MAX_MM) { mids[ms]=n; mh0[ms]=logits[0].to_float(); mh1[ms]=logits[1].to_float();
                mr0[ms]=ref_logits[n][0]; mr1[ms]=ref_logits[n][1]; mhp[ms]=hp; mrp[ms]=rp; ml[ms]=lb; }
            ms++;
        }
        if (hp==lb) hc++; if (rp==lb) rc++;
        float e0=fabsf(logits[0].to_float()-ref_logits[n][0]);
        float e1=fabsf(logits[1].to_float()-ref_logits[n][1]);
        if (e0>me) me=e0; if (e1>me) me=e1; se+=e0+e1;
    }
    float mr=(float)mc/N_EVAL_SAMPLES,ma=se/(N_EVAL_SAMPLES*2);
    float ha=(float)hc/N_EVAL_SAMPLES,ra=(float)rc/N_EVAL_SAMPLES;
    printf("\n==================================================\n");
    printf("small_B CSIM Results (N=%d)\n",N_EVAL_SAMPLES);
    printf("==================================================\n");
    printf("  Pred match vs PyTorch ref: %.4f (%d/%d)\n",mr,mc,N_EVAL_SAMPLES);
    printf("  HW label accuracy:         %.4f (%d/%d)\n",ha,hc,N_EVAL_SAMPLES);
    printf("  Ref label accuracy:        %.4f (%d/%d)\n",ra,rc,N_EVAL_SAMPLES);
    printf("  Mismatches: %d\n",ms);
    printf("  Max abs error: %.8f\n",me);
    printf("  Mean abs error: %.8f\n",ma);
    int pn=(ms<MAX_MM)?ms:MAX_MM;
    if (pn>0) { printf("\n  First %d mismatches:\n",pn);
        for (int i=0;i<pn;i++) printf("  %-6d [%7.4f,%7.4f] [%7.4f,%7.4f] hw=%d ref=%d lbl=%d\n",
            mids[i],mh0[i],mh1[i],mr0[i],mr1[i],mhp[i],mrp[i],ml[i]); }
    bool ok=mr>=0.95f;
    printf("\n==================================================\n");
    printf("  Match >= 0.95: %s\n",ok?"PASS":"FAIL");
    printf("==================================================\n");
    if (ok) printf("\nCSIM PASSED. HW acc=%.4f.\n",ha);
    else printf("\nCSIM FAILED (match=%.4f).\n",mr);
    return ok?0:1;
}
