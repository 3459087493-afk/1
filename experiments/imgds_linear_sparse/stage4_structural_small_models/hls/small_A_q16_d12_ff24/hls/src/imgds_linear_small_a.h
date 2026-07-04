/// imgds_linear_small_a.h — small_B (d_model=8, ff_dim=16)
#ifndef IMGDS_LINEAR_SMALL_A_H
#define IMGDS_LINEAR_SMALL_A_H
#include <ap_fixed.h>
#define SEQ_LEN   16
#define INPUT_DIM 64
#define D_MODEL   12
#define FF_DIM    24
#define N_CLASSES 2
typedef ap_fixed<16,6>  data_t;
typedef ap_fixed<24,10> acc_t;
void imgds_linear_small_a(data_t input[SEQ_LEN][INPUT_DIM], data_t logits[N_CLASSES]);
#endif
