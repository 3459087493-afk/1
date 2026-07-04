// imgds_linear_dense_q32.h — Q32-S0 float HLS reference
#ifndef IMGDS_LINEAR_DENSE_Q32_H
#define IMGDS_LINEAR_DENSE_Q32_H

#define SEQ_LEN   16
#define INPUT_DIM 64
#define D_MODEL   16
#define FF_DIM    32
#define N_CLASSES 2
#define EPS       1e-6f

typedef float data_t;
typedef float acc_t;

// Top-level function
void imgds_linear_dense_q32(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
);

#endif
