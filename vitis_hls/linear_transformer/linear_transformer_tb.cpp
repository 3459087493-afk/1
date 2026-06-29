#include <algorithm>
#include <cmath>
#include <iostream>

#include "linear_transformer.h"

int main() {
  din_t xx[SEQ_LEN][INPUT_DIM] = {
      {0.2, 0.2}, {0.2, 0.2}, {0.4, 0.4}, {0.4, 0.4},
      {0.6, 0.6}, {0.6, 0.6}, {0.8, 0.8}, {0.8, 0.8},
  };
  // din_t xx[SEQ_LEN][INPUT_DIM] = {{0, 0}, {0, 0}, {0, 0}, {0, 0},
  //                                 {0, 0}, {0, 0}, {0, 0}, {0, 0}};

  dout_t tf_output[1] = {-1234567};
  transformer(&xx[0][0], tf_output);
  std::cout << "tf_output: " << tf_output[0] << std::endl;

  const dout_t expected = 3.5092673f;
  const dout_t tolerance = 0.001f;
  const dout_t abs_error = std::fabs(tf_output[0] - expected);
  if (!std::isfinite(tf_output[0]) || !std::isfinite(abs_error) ||
      abs_error > tolerance) {
    std::cerr << "ERROR: expected " << expected << ", got " << tf_output[0]
              << ", abs_error " << abs_error << std::endl;
    return 1;
  }

  std::cout << "PASS: output matches expected value within tolerance "
            << tolerance << std::endl;
  return 0;
}
