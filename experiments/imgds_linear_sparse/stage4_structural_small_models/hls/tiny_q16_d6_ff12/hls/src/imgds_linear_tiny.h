/// imgds_linear_tiny.h — small_B (d_model=8, ff_dim=16)
#ifndef IMGDS_LINEAR_TINY_H
#define IMGDS_LINEAR_TINY_H
#include <ap_fixed.h>
#define SEQ_LEN   16
#define INPUT_DIM 64
#define D_MODEL    6
#define FF_DIM     12
#define N_CLASSES 2
typedef ap_fixed<16,6>  data_t;
typedef ap_fixed<24,10> acc_t;
void imgds_linear_tiny(data_t input[SEQ_LEN][INPUT_DIM], data_t logits[N_CLASSES]);
#endif
