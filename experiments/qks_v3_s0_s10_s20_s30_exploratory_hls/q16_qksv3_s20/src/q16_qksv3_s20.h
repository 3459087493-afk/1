// q16_qksv3_s20.h — Q16-QKSv2-D13
#ifndef Q16_QKSV3_S20_H
#define Q16_QKSV3_S20_H

#include <ap_fixed.h>

#define ACTIVE_TOKENS 13
#define INPUT_DIM 64
#define D_MODEL   16
#define ATTN_DIM  13
#define FF_DIM    32
#define N_CLASSES 2

typedef ap_fixed<16, 6> data_t;
typedef ap_fixed<24, 10> acc_t;
typedef ap_uint<4> token_index_t;

void q16_qksv3_s20(
    data_t input[ACTIVE_TOKENS][INPUT_DIM],
    token_index_t token_indices[ACTIVE_TOKENS],
    data_t logits[N_CLASSES]
);

#endif
