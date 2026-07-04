/// imgds_linear_dense_q4.h
/// Q4-S10 — ap_fixed<4,2> weight storage + ap_fixed<16,6> data path + global 10% sparse.
#ifndef IMGDS_LINEAR_DENSE_Q4_H
#define IMGDS_LINEAR_DENSE_Q4_H

#include <ap_fixed.h>

#define SEQ_LEN   16
#define INPUT_DIM 64
#define D_MODEL   16
#define FF_DIM    32
#define N_CLASSES 2

typedef ap_fixed<16,6>  data_t;   // Q16 data path (avoids Q4 overflow)
typedef ap_fixed<24,10> acc_t;    // wide accumulator

void imgds_linear_dense_q4(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
);

#endif
