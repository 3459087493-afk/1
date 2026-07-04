# q16_s20_attn_only
## Attention-Only Q/K Active-Channel Sparse HLS

**Sparsity:** 20% (13/16 active Q/K channels)
**Active channels:** [0, 1, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15]
**Inactive (pruned) channels:** [2, 5, 9]

**Software simulation accuracy:** 95.15%
**Baseline (Q16 S0 dense):** 94.43% SW accuracy

**Method:**
- Q/K attention accumulation loops truncated to ACTIVE_DIM=13
- V, output projection, feedforward, classifier: FULL 16 channels
- input_projection: FULL
- Active channel selection: Q/K weight row L1 norm (descending)

**Loop truncation (NOT mask-based):**
```cpp
for (int ii = 0; ii < ACTIVE_DIM; ii++) {
    int c = ACTIVE_CHANNELS[ii];
    // Only ACTIVE_DIM iterations → real LUT/DSP saving
    sum += q[c] * k[c];
}
```

**Status:** PENDING_CSIM (HLS not yet run)
**Source:** Modified from `q16_s0_pareto2_axi` baseline
