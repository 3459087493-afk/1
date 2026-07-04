// q16_qksv3_s0.h — Q16-QKSv2-D16
#ifndef Q16_QKSV3_S0_H
#define Q16_QKSV3_S0_H

#include <ap_fixed.h>

#define ACTIVE_TOKENS 16
#define INPUT_DIM 64
#define D_MODEL   16
#define ATTN_DIM  16
#define FF_DIM    32
#define N_CLASSES 2

typedef ap_fixed<16, 6> data_t;
typedef ap_fixed<24, 10> acc_t;
typedef ap_uint<4> token_index_t;

void q16_qksv3_s0(
    data_t input[ACTIVE_TOKENS][INPUT_DIM],
    token_index_t token_indices[ACTIVE_TOKENS],
    data_t logits[N_CLASSES]
);

#endif
