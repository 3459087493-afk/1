/// imgds_linear_dense_q16.h
/// Q16-S0-PARETO1 — ap_fixed<16,6> Linear Transformer with ViT4Mal-style
/// bounded parallelism (cyclic partitioning, pipelining, no complete unroll).
#ifndef IMGDS_LINEAR_DENSE_Q16_H
#define IMGDS_LINEAR_DENSE_Q16_H

#include <ap_fixed.h>

#define SEQ_LEN   16
#define INPUT_DIM 64
#define D_MODEL   16
#define FF_DIM    32
#define N_CLASSES 2

// Fixed-point types — same as q16_s0 naive
typedef ap_fixed<16,6>  data_t;   // range [-32, 31.999]
typedef ap_fixed<24,10> acc_t;    // wider accumulator

// Top-level function
void imgds_linear_dense_q16(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
);

#endif
