/// imgds_linear_dense_q8.h
/// Q8-S0 — Q8 weight storage + Q16 computation path.
/// Weights: ap_fixed<8,4>, Computation: ap_fixed<16,6>, Acc: ap_fixed<24,10>
#ifndef IMGDS_LINEAR_DENSE_Q8_H
#define IMGDS_LINEAR_DENSE_Q8_H

#include <ap_fixed.h>

#define SEQ_LEN   16
#define INPUT_DIM 64
#define D_MODEL   16
#define FF_DIM    32
#define N_CLASSES 2

typedef ap_fixed<16,6>  data_t;   // data path: 16-bit [-32, 31.999]
typedef ap_fixed<24,10> acc_t;    // accumulator: 24-bit

void imgds_linear_dense_q8(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
);

#endif
