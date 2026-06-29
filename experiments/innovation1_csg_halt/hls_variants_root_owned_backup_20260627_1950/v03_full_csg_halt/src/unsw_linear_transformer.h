#ifndef UNSW_LINEAR_TRANSFORMER_H
#define UNSW_LINEAR_TRANSFORMER_H

#define UNSW_SEQ_LEN 8
#define UNSW_INPUT_DIM 24
#define UNSW_D_MODEL 16
#define UNSW_FF_DIM 32
#define UNSW_NUM_CLASSES 2

#define UNSW_ACTIVE_DIM 14
#define UNSW_CSIM_TOLERANCE 1.0e-2f

#include <ap_fixed.h>
typedef ap_fixed<16, 6> data_t;
typedef ap_fixed<18, 8> acc_t;
typedef ap_fixed<24, 10> attn_acc_t;

void unsw_linear_transformer(
    float input[UNSW_SEQ_LEN][UNSW_INPUT_DIM],
    float logits[UNSW_NUM_CLASSES]
);

#endif
