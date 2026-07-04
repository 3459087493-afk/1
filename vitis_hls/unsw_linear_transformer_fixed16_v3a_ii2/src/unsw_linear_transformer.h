#ifndef UNSW_LINEAR_TRANSFORMER_H
#define UNSW_LINEAR_TRANSFORMER_H

#include "hls_types.h"

#define UNSW_SEQ_LEN 8
#define UNSW_INPUT_DIM 24
#define UNSW_D_MODEL 16
#define UNSW_FF_DIM 32
#define UNSW_NUM_CLASSES 2

// AXI interface: float32 input / float32 output
// Internal arithmetic: ap_fixed (see hls_types.h)
void unsw_linear_transformer(
    float input[UNSW_SEQ_LEN][UNSW_INPUT_DIM],
    float logits[UNSW_NUM_CLASSES]
);

#endif