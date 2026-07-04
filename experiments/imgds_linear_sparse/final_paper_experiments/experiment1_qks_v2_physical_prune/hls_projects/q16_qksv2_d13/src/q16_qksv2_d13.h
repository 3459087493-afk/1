// q16_qksv2_d13.h — Q16-QKSv2-D13
#ifndef Q16_QKSV2_D13_H
#define Q16_QKSV2_D13_H

#include <ap_fixed.h>

#define SEQ_LEN   16
#define INPUT_DIM 64
#define D_MODEL   16
#define ATTN_DIM  13
#define FF_DIM    32
#define N_CLASSES 2

typedef ap_fixed<16, 6> data_t;
typedef ap_fixed<24, 10> acc_t;

void q16_qksv2_d13(
    data_t input[SEQ_LEN][INPUT_DIM],
    data_t logits[N_CLASSES]
);

#endif
