#include <algorithm>
#include <iostream>

#include "transformer.h"

int main() {
  din_t xx[SEQ_LEN][INPUT_DIM] = {
      {0.2, 0.2}, {0.2, 0.2}, {0.4, 0.4}, {0.4, 0.4},
      {0.6, 0.6}, {0.6, 0.6}, {0.8, 0.8}, {0.8, 0.8},
  };
  // din_t xx[SEQ_LEN][INPUT_DIM] = {{0, 0}, {0, 0}, {0, 0}, {0, 0},
  //                                 {0, 0}, {0, 0}, {0, 0}, {0, 0}};

  din_t xx_flat[SEQ_LEN * INPUT_DIM];
  for (int i = 0; i < SEQ_LEN; i++) {
    for (int j = 0; j < INPUT_DIM; j++) {
      xx_flat[i * INPUT_DIM + j] = xx[i][j];
    }
  }

#ifdef PRINT_INTERMEDIATE_RESULTS
  std::cout << "xx_flat" << std::endl;
  for (int i = 0; i < SEQ_LEN * INPUT_DIM; i++) {
    std::cout << xx_flat[i] << ", ";
  }
  std::cout << std::endl;
#endif

  dout_t tf_output[1] = {-1234567};
  transformer(xx_flat[0], xx_flat[1], xx_flat[2], xx_flat[3], xx_flat[4],
              xx_flat[5], xx_flat[6], xx_flat[7], xx_flat[8], xx_flat[9],
              xx_flat[10], xx_flat[11], xx_flat[12], xx_flat[13],
              xx_flat[14], xx_flat[15], (dout_t*)tf_output);
  std::cout << "tf_output: " << tf_output[0] << std::endl;
}
