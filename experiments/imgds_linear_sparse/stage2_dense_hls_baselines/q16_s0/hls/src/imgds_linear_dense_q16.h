// imgds_linear_dense_q16.h — Q16-S0 ap_fixed<16,6> HLS baseline
#ifndef IMGDS_LINEAR_DENSE_Q16_H
#define IMGDS_LINEAR_DENSE_Q16_H

#include <ap_fixed.h>

#define SEQ_LEN   16
#define INPUT_DIM 64
#define D_MODEL   16
#define FF_DIM    32
#define N_CLASSES 2

// Fixed-point types
// data_t:  ap_fixed<16,6>  range [-32, 31.999], step ~0.0010
// acc_t:   ap_fixed<24,10> range [-8192, 8191.999], step ~0.0010
//          (wider integer part for accumulation safety)
typedef ap_fixed<16,6>  data_t;
typedef ap_fixed<24,10> acc_t;

// Top-level function
void imgds_linear_dense_q16(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
);

#endif
