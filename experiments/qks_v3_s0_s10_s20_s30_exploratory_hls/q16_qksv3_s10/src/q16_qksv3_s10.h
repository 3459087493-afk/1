// q16_qksv3_s10.h — Q16-QKSv2-D14
#ifndef Q16_QKSV3_S10_H
#define Q16_QKSV3_S10_H

#include <ap_fixed.h>

#define ACTIVE_TOKENS 14
#define INPUT_DIM 64
#define D_MODEL   16
#define ATTN_DIM  14
#define FF_DIM    32
#define N_CLASSES 2

typedef ap_fixed<16, 6> data_t;
typedef ap_fixed<24, 10> acc_t;
typedef ap_uint<4> token_index_t;

void q16_qksv3_s10(
    data_t input[ACTIVE_TOKENS][INPUT_DIM],
    token_index_t token_indices[ACTIVE_TOKENS],
    data_t logits[N_CLASSES]
);

#endif
