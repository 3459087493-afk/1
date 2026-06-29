#include "linear_transformer.h"

#include <stdio.h>

#include <iostream>

#include "scaled_dp_params.h"

#define EPS 0.000001f  // for normalizer numerical stability

void print_mat(const dout_t* mat, int T1, int T2) {
  for (int i = 0; i < T1; i++) {
    for (int j = 0; j < T2; j++) {
      printf("%.6f ", mat[i * T2 + j]);
    }
    printf("\n");
  }
}

using namespace std;

// Inputs are the flattened SEQ_LEN x INPUT_DIM window.
void transformer(volatile din_t* input_array, volatile dout_t* val) {
#pragma HLS INTERFACE m_axi port = input_array offset = slave bundle = gmem0 depth = 16
#pragma HLS INTERFACE m_axi port = val offset = slave bundle = gmem1 depth = 1
#pragma HLS INTERFACE s_axilite port = input_array bundle = control
#pragma HLS INTERFACE s_axilite port = val bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control

  dout_t result = 0.0f;
  transformer_for_sample(input_array, &result);
  val[0] = result;
}

void transformer_for_sample(volatile din_t* input_array, dout_t* out) {
#pragma HLS INLINE off
  dout_t front[SEQ_LEN * BLOCK_INPUT_DIM] = {0};
  dout_t query[SEQ_LEN * BLOCK_INPUT_DIM] = {0};
  dout_t key[SEQ_LEN * BLOCK_INPUT_DIM] = {0};
  dout_t value[SEQ_LEN * BLOCK_INPUT_DIM] = {0};
  dout_t value_t[BLOCK_INPUT_DIM * SEQ_LEN] = {0};
  dout_t kv[SEQ_LEN * SEQ_LEN] = {0};
  dout_t sum_k[SEQ_LEN] = {0};
  dout_t normalizer[SEQ_LEN] = {0};
  dout_t values_new[SEQ_LEN * BLOCK_INPUT_DIM] = {0};
  dout_t o_proj[SEQ_LEN * BLOCK_INPUT_DIM] = {0};
  dout_t attn_residual[SEQ_LEN * BLOCK_INPUT_DIM] = {0};
  dout_t ff1[SEQ_LEN * 2 * BLOCK_INPUT_DIM] = {0};
  dout_t ff2[SEQ_LEN * BLOCK_INPUT_DIM] = {0};
  dout_t encoder_out[SEQ_LEN * BLOCK_INPUT_DIM] = {0};
  dout_t final_out[SEQ_LEN] = {0};

front_linear_i:
  for (int i = 0; i < SEQ_LEN; i++) {
  front_linear_j:
    for (int j = 0; j < BLOCK_INPUT_DIM; j++) {
      dout_t sum = 0.0f;
    front_linear_k:
      for (int k = 0; k < INPUT_DIM; k++) {
        sum += input_array[i * INPUT_DIM + k] * FRONT_LINEAR_WEIGHT[k][j];
      }
      front[i * BLOCK_INPUT_DIM + j] = sum + FRONT_LINEAR_BIAS[j];
    }
  }

qkv_i:
  for (int i = 0; i < SEQ_LEN; i++) {
  qkv_j:
    for (int j = 0; j < BLOCK_INPUT_DIM; j++) {
      dout_t q_sum = 0.0f;
      dout_t k_sum = 0.0f;
      dout_t v_sum = 0.0f;
    qkv_k:
      for (int k = 0; k < BLOCK_INPUT_DIM; k++) {
        const dout_t a = front[i * BLOCK_INPUT_DIM + k];
        q_sum += a * TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT[k][j];
        k_sum += a * TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT[k][j];
        v_sum += a * TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT[k][j];
      }
      q_sum = q_sum < 0.0f ? expf(q_sum) : q_sum + 1.0f;
      k_sum = k_sum < 0.0f ? expf(k_sum) : k_sum + 1.0f;
      query[i * BLOCK_INPUT_DIM + j] = q_sum;
      key[i * BLOCK_INPUT_DIM + j] = k_sum;
      value[i * BLOCK_INPUT_DIM + j] = v_sum;
    }
  }

transpose_value_i:
  for (int i = 0; i < SEQ_LEN; i++) {
  transpose_value_j:
    for (int j = 0; j < BLOCK_INPUT_DIM; j++) {
      value_t[j * SEQ_LEN + i] = value[i * BLOCK_INPUT_DIM + j];
    }
  }

kv_i:
  for (int i = 0; i < SEQ_LEN; i++) {
  kv_j:
    for (int j = 0; j < SEQ_LEN; j++) {
      dout_t sum = 0.0f;
    kv_k:
      for (int k = 0; k < BLOCK_INPUT_DIM; k++) {
        sum += key[i * BLOCK_INPUT_DIM + k] * value_t[k * SEQ_LEN + j];
      }
      kv[i * SEQ_LEN + j] = sum;
    }
  }

sum_k_j:
  for (int j = 0; j < SEQ_LEN; j++) {
    dout_t sum = 0.0f;
  sum_k_i:
    for (int i = 0; i < SEQ_LEN; i++) {
      sum += key[i * BLOCK_INPUT_DIM + j];
    }
    sum_k[j] = sum;
  }

normalizer_i:
  for (int i = 0; i < SEQ_LEN; i++) {
    dout_t sum = 0.0f;
  normalizer_k:
    for (int k = 0; k < BLOCK_INPUT_DIM; k++) {
      sum += query[k * BLOCK_INPUT_DIM + i] * sum_k[k];
    }
    normalizer[i] = 1.0f / (sum + EPS);
  }

numerator_i:
  for (int i = 0; i < SEQ_LEN; i++) {
  numerator_j:
    for (int j = 0; j < BLOCK_INPUT_DIM; j++) {
      dout_t sum = 0.0f;
    numerator_k:
      for (int k = 0; k < SEQ_LEN; k++) {
        sum += query[i * BLOCK_INPUT_DIM + k] * kv[k * SEQ_LEN + j];
      }
      values_new[i * BLOCK_INPUT_DIM + j] = sum * normalizer[i];
    }
  }

o_proj_i:
  for (int i = 0; i < SEQ_LEN; i++) {
  o_proj_j:
    for (int j = 0; j < BLOCK_INPUT_DIM; j++) {
      dout_t sum = 0.0f;
    o_proj_k:
      for (int k = 0; k < BLOCK_INPUT_DIM; k++) {
        sum += values_new[i * BLOCK_INPUT_DIM + k] *
               TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT[k][j];
      }
      o_proj[i * BLOCK_INPUT_DIM + j] =
          sum + TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_BIAS[j];
      attn_residual[i * BLOCK_INPUT_DIM + j] =
          front[i * BLOCK_INPUT_DIM + j] + o_proj[i * BLOCK_INPUT_DIM + j];
    }
  }

ff1_i:
  for (int i = 0; i < SEQ_LEN; i++) {
  ff1_j:
    for (int j = 0; j < 2 * BLOCK_INPUT_DIM; j++) {
      dout_t sum = 0.0f;
    ff1_k:
      for (int k = 0; k < BLOCK_INPUT_DIM; k++) {
        sum += attn_residual[i * BLOCK_INPUT_DIM + k] *
               TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT[k][j];
      }
      sum += TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_BIAS[j];
      ff1[i * 2 * BLOCK_INPUT_DIM + j] = sum < 0.0f ? 0.0f : sum;
    }
  }

ff2_i:
  for (int i = 0; i < SEQ_LEN; i++) {
  ff2_j:
    for (int j = 0; j < BLOCK_INPUT_DIM; j++) {
      dout_t sum = 0.0f;
    ff2_k:
      for (int k = 0; k < 2 * BLOCK_INPUT_DIM; k++) {
        sum += ff1[i * 2 * BLOCK_INPUT_DIM + k] *
               TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT[k][j];
      }
      ff2[i * BLOCK_INPUT_DIM + j] =
          sum + TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS[j];
      encoder_out[i * BLOCK_INPUT_DIM + j] =
          attn_residual[i * BLOCK_INPUT_DIM + j] + ff2[i * BLOCK_INPUT_DIM + j];
    }
  }

final_i:
  for (int i = 0; i < SEQ_LEN; i++) {
    dout_t sum = 0.0f;
  final_k:
    for (int k = 0; k < BLOCK_INPUT_DIM; k++) {
      sum += encoder_out[i * BLOCK_INPUT_DIM + k] * FINAL_LINEAR_WEIGHT[k][0];
    }
    final_out[i] = sum + FINAL_LINEAR_BIAS[0];
  }

  out[0] = final_out[0];
}
