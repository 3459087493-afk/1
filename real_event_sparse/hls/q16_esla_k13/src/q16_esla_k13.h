// Q16-ESLA-K13: faithful phi(K) token-compacted Linear Transformer.
#ifndef Q16_ESLA_K13_H
#define Q16_ESLA_K13_H

#include <ap_fixed.h>

#define SEQ_LEN          16
#define ACTIVE_TOKEN_NUM 13
#define INPUT_DIM        64
#define D_MODEL          16
#define ACTIVE_DIM       16
#define FF_DIM           32
#define N_CLASSES        2

// ACTIVE_DIM stays 16 because the validated Python candidate is token sparse,
// not the separate Q16-S30 channel-pruned model.
typedef ap_fixed<16, 6> data_t;
typedef ap_fixed<24, 10> acc_t;

void q16_esla_k13(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES],
    int active_token_indices[ACTIVE_TOKEN_NUM]
);

#endif

