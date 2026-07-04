#include "q16_qksv3_s10.h"
#include <cmath>
#include <iostream>

int main() {
    data_t input[ACTIVE_TOKENS][INPUT_DIM];
    token_index_t indices[ACTIVE_TOKENS];
    data_t logits[N_CLASSES];
    for (int t = 0; t < ACTIVE_TOKENS; ++t) {
        indices[t] = token_index_t(t);
        for (int i = 0; i < INPUT_DIM; ++i) input[t][i] = data_t((t + i) % 17 / 32.0f);
    }
    q16_qksv3_s10(input, indices, logits);
    for (int c = 0; c < N_CLASSES; ++c) {
        float v = logits[c].to_float();
        if (!std::isfinite(v)) return 2;
        std::cout << "logit[" << c << "]=" << v << "\n";
    }
    std::cout << "CSIM_PASS ACTIVE_TOKENS=14 ATTN_DIM=14\n";
    return 0;
}
