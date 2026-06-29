#include "transformer.h"

#include <stdio.h>

#include <iostream>

#include "scaled_dp_params.h"

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
void transformer(din_t x0, din_t x1, din_t x2, din_t x3, din_t x4, din_t x5,
                 din_t x6, din_t x7, din_t x8, din_t x9, din_t x10,
                 din_t x11, din_t x12, din_t x13, din_t x14, din_t x15,
                 dout_t* val) {
#pragma HLS INTERFACE s_axilite port = x0 bundle = control
#pragma HLS INTERFACE s_axilite port = x1 bundle = control
#pragma HLS INTERFACE s_axilite port = x2 bundle = control
#pragma HLS INTERFACE s_axilite port = x3 bundle = control
#pragma HLS INTERFACE s_axilite port = x4 bundle = control
#pragma HLS INTERFACE s_axilite port = x5 bundle = control
#pragma HLS INTERFACE s_axilite port = x6 bundle = control
#pragma HLS INTERFACE s_axilite port = x7 bundle = control
#pragma HLS INTERFACE s_axilite port = x8 bundle = control
#pragma HLS INTERFACE s_axilite port = x9 bundle = control
#pragma HLS INTERFACE s_axilite port = x10 bundle = control
#pragma HLS INTERFACE s_axilite port = x11 bundle = control
#pragma HLS INTERFACE s_axilite port = x12 bundle = control
#pragma HLS INTERFACE s_axilite port = x13 bundle = control
#pragma HLS INTERFACE s_axilite port = x14 bundle = control
#pragma HLS INTERFACE s_axilite port = x15 bundle = control
#pragma HLS INTERFACE s_axilite port = val bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control

  din_t xx[SEQ_LEN][INPUT_DIM];
  xx[0][0] = x0;
  xx[0][1] = x1;
  xx[1][0] = x2;
  xx[1][1] = x3;
  xx[2][0] = x4;
  xx[2][1] = x5;
  xx[3][0] = x6;
  xx[3][1] = x7;
  xx[4][0] = x8;
  xx[4][1] = x9;
  xx[5][0] = x10;
  xx[5][1] = x11;
  xx[6][0] = x12;
  xx[6][1] = x13;
  xx[7][0] = x14;
  xx[7][1] = x15;

  dout_t result = 0;
  transformer_for_sample(xx, &result);
  val[0] = result;
}

void transformer_for_sample(din_t xx[SEQ_LEN][INPUT_DIM], dout_t* out) {
#pragma HLS INLINE off
// for every element in the sequence, apply front linear
// front_linear is 8x2 but it is stored as a transposed matrix
// so multiply on the right
// xx is 8x2
// so yy is 8x8
  dout_t front_linear_raw[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
  dout_t front_linear_output[SEQ_LEN][BLOCK_INPUT_DIM] = {0};

  kernel_mmult<dout_t, SEQ_LEN, INPUT_DIM, BLOCK_INPUT_DIM>(
      xx, FRONT_LINEAR_WEIGHT, front_linear_raw);
  kernel_bias_add<dout_t, SEQ_LEN, BLOCK_INPUT_DIM>(
      front_linear_raw, FRONT_LINEAR_BIAS, front_linear_output);

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "front_linear_output: " << endl;
  print_mat((dout_t*)front_linear_output, SEQ_LEN, BLOCK_INPUT_DIM);
#endif

  // Transformer encoder
  // calculate query key and value matrices
  dout_t query_mat[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
  dout_t key_mat[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
  dout_t value_mat[SEQ_LEN][BLOCK_INPUT_DIM] = {0};

  kernel_mmult<dout_t, SEQ_LEN, BLOCK_INPUT_DIM, BLOCK_INPUT_DIM>(
      front_linear_output,
      TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT, query_mat);

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "query_mat: " << endl;
  print_mat((dout_t*)query_mat, SEQ_LEN, BLOCK_INPUT_DIM);
#endif

  kernel_mmult<dout_t, SEQ_LEN, BLOCK_INPUT_DIM, BLOCK_INPUT_DIM>(
      front_linear_output,
      TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT, key_mat);

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "key_mat: " << endl;
  print_mat((dout_t*)key_mat, SEQ_LEN, BLOCK_INPUT_DIM);
#endif

  kernel_mmult<dout_t, SEQ_LEN, BLOCK_INPUT_DIM, BLOCK_INPUT_DIM>(
      front_linear_output,
      TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT, value_mat);

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "value_mat: " << endl;
  print_mat((dout_t*)value_mat, SEQ_LEN, BLOCK_INPUT_DIM);
#endif

  dout_t query_mat_transposed[NUM_HEADS][SEQ_LEN][HEAD_DIM] = {0};
  dout_t key_mat_transposed[NUM_HEADS][SEQ_LEN][HEAD_DIM] = {0};
  dout_t value_mat_transposed[NUM_HEADS][SEQ_LEN][HEAD_DIM] = {0};

qkv_split_transpose:
  for (int i = 0; i < SEQ_LEN; i++) {
    for (int h = 0; h < NUM_HEADS; h++) {
      for (int k = 0; k < HEAD_DIM; k++) {
        int feature_idx = h * HEAD_DIM + k;
        query_mat_transposed[h][i][k] = query_mat[i][feature_idx];
        key_mat_transposed[h][i][k] = key_mat[i][feature_idx];
        value_mat_transposed[h][i][k] = value_mat[i][feature_idx];
      }
    }
  }

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "query_mat_transposed: " << endl;
  print_mat_3d<dout_t, NUM_HEADS, SEQ_LEN, HEAD_DIM>(query_mat_transposed);

  cout << "key_mat_transposed: " << endl;
  print_mat_3d<dout_t, NUM_HEADS, SEQ_LEN, HEAD_DIM>(key_mat_transposed);

  cout << "value_mat_transposed: " << endl;
  print_mat_3d<dout_t, NUM_HEADS, SEQ_LEN, HEAD_DIM>(value_mat_transposed);
#endif

  // Calculate multi-head attention explicitly. Keeping the fixed dimensions in
  // this function avoids HLS mis-scheduling the nested template calls.
  dout_t query_key[NUM_HEADS][SEQ_LEN][SEQ_LEN] = {0};
  dout_t query_key_softmax[NUM_HEADS][SEQ_LEN][SEQ_LEN] = {0};
  dout_t scaled_dot_product_attention[NUM_HEADS][SEQ_LEN][HEAD_DIM] = {0};
  const dout_t inv_sqrt_head_dim = 0.5f;

attention_scores:
  for (int h = 0; h < NUM_HEADS; h++) {
    for (int i = 0; i < SEQ_LEN; i++) {
      for (int j = 0; j < SEQ_LEN; j++) {
        dout_t sum = 0;
        for (int k = 0; k < HEAD_DIM; k++) {
          sum += query_mat_transposed[h][i][k] * key_mat_transposed[h][j][k];
        }
        query_key[h][i][j] = sum * inv_sqrt_head_dim;
      }
    }
  }

attention_softmax:
  for (int h = 0; h < NUM_HEADS; h++) {
    for (int i = 0; i < SEQ_LEN; i++) {
      dout_t max_element = query_key[h][i][0];
      for (int j = 1; j < SEQ_LEN; j++) {
        if (query_key[h][i][j] > max_element) {
          max_element = query_key[h][i][j];
        }
      }

      dout_t sum = 0;
      for (int j = 0; j < SEQ_LEN; j++) {
        dout_t exp_value = exp(query_key[h][i][j] - max_element);
        query_key_softmax[h][i][j] = exp_value;
        sum += exp_value;
      }

      for (int j = 0; j < SEQ_LEN; j++) {
        query_key_softmax[h][i][j] = query_key_softmax[h][i][j] / sum;
      }
    }
  }

attention_weighted_values:
  for (int h = 0; h < NUM_HEADS; h++) {
    for (int i = 0; i < SEQ_LEN; i++) {
      for (int d = 0; d < HEAD_DIM; d++) {
        dout_t sum = 0;
        for (int j = 0; j < SEQ_LEN; j++) {
          sum += query_key_softmax[h][i][j] * value_mat_transposed[h][j][d];
        }
        scaled_dot_product_attention[h][i][d] = sum;
      }
    }
  }

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "scaled_dot_product_attention: " << endl;
  print_mat_3d<dout_t, NUM_HEADS, SEQ_LEN, HEAD_DIM>(
      scaled_dot_product_attention);
#endif

  // concat heads
  dout_t attention_values[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
attention_concat:
  for (int i = 0; i < SEQ_LEN; i++) {
    for (int h = 0; h < NUM_HEADS; h++) {
      for (int d = 0; d < HEAD_DIM; d++) {
        attention_values[i][h * HEAD_DIM + d] =
            scaled_dot_product_attention[h][i][d];
      }
    }
  }

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "attention_values: " << endl;
  print_mat((dout_t*)attention_values, SEQ_LEN, BLOCK_INPUT_DIM);
#endif

  // o_proj, exiting the multihead attention
  dout_t o_proj_raw[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
  dout_t o_proj[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
  kernel_mmult<dout_t, SEQ_LEN, BLOCK_INPUT_DIM, BLOCK_INPUT_DIM>(
      attention_values, TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT,
      o_proj_raw);
  kernel_bias_add<dout_t, SEQ_LEN, BLOCK_INPUT_DIM>(
      o_proj_raw, TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_BIAS, o_proj);

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "o_proj: " << endl;
  print_mat((dout_t*)o_proj, SEQ_LEN, BLOCK_INPUT_DIM);
#endif

  // Match PyTorch EncoderBlock.forward:
  // x = norm1(x + dropout(attn_out)); norm1/dropout are Identity here.
  dout_t after_attention_residual[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
attention_residual:
  for (int i = 0; i < SEQ_LEN; i++) {
    for (int j = 0; j < BLOCK_INPUT_DIM; j++) {
      after_attention_residual[i][j] = front_linear_output[i][j] + o_proj[i][j];
    }
  }

  // linear net
  // TODO: maybe its a bit dirty that I hardcode the
  // 2 * BLOCK_INPUT_DIM here
  dout_t first_linear_net_raw[SEQ_LEN][2 * BLOCK_INPUT_DIM] = {0};
  dout_t first_linear_net_output[SEQ_LEN][2 * BLOCK_INPUT_DIM] = {0};
  kernel_mmult<dout_t, SEQ_LEN, BLOCK_INPUT_DIM, 2 * BLOCK_INPUT_DIM>(
      after_attention_residual, TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT,
      first_linear_net_raw);
  kernel_bias_add<dout_t, SEQ_LEN, 2 * BLOCK_INPUT_DIM>(
      first_linear_net_raw, TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_BIAS,
      first_linear_net_output);

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "first_linear_net_output: " << endl;
  print_mat((dout_t*)first_linear_net_output, SEQ_LEN, 2 * BLOCK_INPUT_DIM);
#endif

  // ReLU
  relu_inplace<dout_t, SEQ_LEN, 2 * BLOCK_INPUT_DIM>(first_linear_net_output);

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "first_linear_net_output after ReLU: " << endl;
  print_mat((dout_t*)first_linear_net_output, SEQ_LEN, 2 * BLOCK_INPUT_DIM);
#endif

  // second linear net
  dout_t second_linear_net_raw[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
  dout_t second_linear_net_output[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
  kernel_mmult<dout_t, SEQ_LEN, 2 * BLOCK_INPUT_DIM, BLOCK_INPUT_DIM>(
      first_linear_net_output, TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT,
      second_linear_net_raw);
  kernel_bias_add<dout_t, SEQ_LEN, BLOCK_INPUT_DIM>(
      second_linear_net_raw, TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS,
      second_linear_net_output);

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "second_linear_net_output: " << endl;
  print_mat((dout_t*)second_linear_net_output, SEQ_LEN, BLOCK_INPUT_DIM);
#endif

  // Match PyTorch EncoderBlock.forward:
  // x = norm2(x + dropout(linear_out)); norm2/dropout are Identity here.
  dout_t encoder_output[SEQ_LEN][BLOCK_INPUT_DIM] = {0};
linear_residual:
  for (int i = 0; i < SEQ_LEN; i++) {
    for (int j = 0; j < BLOCK_INPUT_DIM; j++) {
      encoder_output[i][j] = after_attention_residual[i][j] + second_linear_net_output[i][j];
    }
  }

  // final_layer
  dout_t final_layer_raw[SEQ_LEN][1] = {0};
  dout_t final_layer_output[SEQ_LEN][1] = {0};
  kernel_mmult<dout_t, SEQ_LEN, BLOCK_INPUT_DIM, 1>(
      encoder_output, FINAL_LINEAR_WEIGHT, final_layer_raw);
  kernel_bias_add<dout_t, SEQ_LEN, 1>(final_layer_raw, FINAL_LINEAR_BIAS,
                                      final_layer_output);

#ifdef PRINT_INTERMEDIATE_RESULTS
  cout << "final_layer_output: " << endl;
  print_mat((dout_t*)final_layer_output, SEQ_LEN, 1);
#endif

  *out = final_layer_output[0][0];
}
