# Experiment 1 — Step 1: Existing Sparse Results Audit

**Generated:** 2026-07-02
**Root:** `/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse`

---

## 1. Executive Summary

| Question | Answer |
|----------|--------|
| Do attention-only sparse SW results exist? | ✅ YES — all Q16 S0→S100 and Q8 S0→S100 in `experiment1_attention_only_full_sparsity_software_results.csv` |
| Do attention-only sparse HLS projects exist? | ⚠️ PARTIAL — Q16 S10, S20, S30 only (3 projects). No Q8 sparse HLS. |
| Is sparse code "compile-time true sparse"? | ✅ YES — uses `#define ACTIVE_DIM N` and `static const int ACTIVE_CHANNELS[ACTIVE_DIM]` in `active_channels.h`. Each sparsity level gets its own hard-coded constants. |
| Do active channel indices exist for all 6 target configs? | ⚠️ PARTIAL — Q16 S10/S20/S30 have them. Q16 S0 = identity (all 16). Q8 S0/S30 need generation. |
| Are there Vivado bitstreams for any sparse variant? | ❌ NO — only HLS CSIM+CSYNTH. No Vivado, no PYNQ for any sparse variant. |
| Are there PYNQ measured results for any sparse variant? | ❌ NO |
| LUT reduction observed in HLS CSYNTH? | ❌ FLAT at ~25,700 across all sparsity levels |

---

## 2. Six Target Configurations — Status Matrix

| # | Model ID | Quant | ACTIVE_DIM | Eff. Sparsity | SW Acc | SW Match | HLS CSIM | HLS CSYNTH | Vivado | PYNQ |
|---|----------|-------|-----------|---------------|--------|----------|----------|------------|--------|------|
| 1 | Ours-Q16-S0-AttnSparse | Q16 | 16 | 0% | 94.43% | 0.9977 | ✅ PASS_RELAXED | ✅ LUT=25,402 | ✅ DONE (PARETO2-AXI) | ✅ DONE (Q16 Main) |
| 2 | Ours-Q16-S10-AttnSparse | Q16 | 14 | 12.5% | 95.18% | 0.9890 | ✅ PASS_RELAXED | ✅ LUT=25,700 | ❌ | ❌ |
| 3 | Ours-Q16-S20-AttnSparse | Q16 | 13 | 18.75% | 95.15% | 0.9887 | ✅ PASS_RELAXED | ✅ LUT=25,700 | ❌ | ❌ |
| 4 | Ours-Q16-S30-AttnSparse | Q16 | 11 | 31.25% | 95.21% | 0.9887 | ✅ PASS_RELAXED | ✅ LUT=25,700 | ❌ | ❌ |
| 5 | Ours-Q8-S0-AttnSparse | Q8 | 16 | 0% | 91.00% | 0.9501 | ✅ PASS | ✅ LUT=25,378 | ✅ DONE (Q8 Dense) | ⚠️ Package ready, no run |
| 6 | Ours-Q8-S30-AttnSparse | Q8 | 11 | 31.25% | 91.29% | 0.9535 | ❌ NOT STARTED | ❌ | ❌ | ❌ |

---

## 3. Existing Active Channel Indices

### Q16 Attention-Only Q/K Active Channels

Source: `experiment1_attention_only_full_sparsity_software_results.csv` and `experiment1_attention_only_progressive_sparse_results.csv`

| Sparsity | ACTIVE_DIM | Active Q/K Indices |
|----------|-----------|---------------------|
| S0 | 16 | [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] |
| S10 | 14 | [0, 1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15] |
| S20 | 13 | [0, 1, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15] |
| S30 | 11 | [3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15] |

### Q8 Attention-Only Q/K Active Channels

Source: `experiment1_attention_only_full_sparsity_software_results.csv`

| Sparsity | ACTIVE_DIM | Active Q/K Indices |
|----------|-----------|---------------------|
| S0 | 16 | [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] |
| S30 | 11 | [3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15] (same as Q16 S30) |

**Note:** Q8 S30 uses the SAME active channel indices as Q16 S30. The channel selection is based on Q/K weight row L1 norm, which is identical for Q16 and Q8 (same trained model, same weight ranking).

---

## 4. HLS Resource Results (Existing CSYNTH)

Source: `experiment1_attention_only_hls_summary.csv` and csynth reports

| Variant | BRAM | DSP | FF | LUT | Latency (cycles) | Latency @100MHz | PYNQ-Z2 Fit? |
|---------|------|-----|-----|-----|-----------------|-----------------|-------------|
| Q16 S0 (dense) | 13 | 156 | 11,458 | 25,402 | 75,627 | 756.27 us | ✅ |
| Q16 S10 | 13 | 156 | 11,680 | 25,700 | 77,645 | 776.45 us | ✅ |
| Q16 S20 | 13 | 156 | 11,680 | 25,700 | 76,374 | 763.74 us | ✅ |
| Q16 S30 | 13 | 156 | 11,680 | 25,700 | 73,832 | 738.32 us | ✅ |
| Q8 S0 (dense) | 13 | 124 | 11,127 | 25,378 | 75,843 | 758.43 us | ✅ |

**Critical finding:** LUT is FLAT at ~25,700 (HLS estimate) across all sparse variants. The Vivado optimization pass typically reduces this by ~45% (e.g., 25,402 → 14,004 for Q16 dense). Expected Vivado LUT for sparse: ~14,000–14,200 (similar to dense).

---

## 5. Software Accuracy (3444-sample full test)

Source: `experiment1_attention_only_full_sparsity_software_results.csv`

| Variant | Accuracy | Precision | Recall | F1 | Match vs Q32 |
|---------|----------|-----------|--------|-----|-------------|
| Q16 S0 (dense) | 94.43% | 97.71% | 95.72% | 96.71% | 0.9977 |
| Q16 S10 | 95.18% | 97.67% | 96.67% | 97.17% | 0.9890 |
| Q16 S20 | 95.15% | 97.64% | 96.67% | 97.15% | 0.9887 |
| Q16 S30 | **95.21%** | 97.67% | 96.71% | 97.19% | 0.9887 |
| Q8 S0 (dense) | 91.00% | 98.71% | 90.67% | 94.52% | 0.9501 |
| Q8 S30 | 91.29% | 98.68% | 91.04% | 94.71% | 0.9535 |

**Key observation:** Sparse attention IMPROVES Q16 accuracy (94.43% → 95.21% at S30). This is a regularization effect — removing noisy channels acts as beneficial pruning. Q8 accuracy is below ViT4Mal threshold (92.41%) — Q8 variants are quantization ablations, not primary design points.

---

## 6. Existing Reference Logits (for PYNQ validation)

| Variant | Reference logits exist? | Path |
|---------|------------------------|------|
| Q16 S0 (dense) | ✅ yes | `q16_full_pynq_validation/q16_main_test_3444.npz` |
| Q16 S10 | ❌ | Need to generate from SW model with S10 active channels |
| Q16 S20 | ❌ | Need to generate |
| Q16 S30 | ❌ | Need to generate |
| Q8 S0 (dense) | ✅ yes | `q8_dense_pynq_validation/q8_dense_test_3444.npz` |
| Q8 S30 | ❌ | Need to generate |

---

## 7. Code Audit: Compile-Time True Sparse

### ✅ VERIFIED: The existing sparse code IS compile-time true sparse

File: `stage3_attention_only_sparse_hls/q16_s30_attn_only/hls/src/active_channels.h`:
```c
#define ACTIVE_DIM 11
static const int ACTIVE_CHANNELS[ACTIVE_DIM] = {3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15};
```

File: `stage3_attention_only_sparse_hls/q16_s30_attn_only/hls/src/imgds_linear_dense_q16.cpp` (lines 107-118):
```c
// Compute Q/K ONLY for ACTIVE_CHANNELS (truncated loop → real LUT saving)
for (int ii = 0; ii < ACTIVE_DIM; ii++) {
    int d = ACTIVE_CHANNELS[ii];
    acc_t sq = 0, sk = 0;
    for (int i = 0; i < D_MODEL; i++) {
        data_t xi = x[s][i];
        sq += xi * Wq_flat[d * D_MODEL + i];
        sk += xi * Wk_flat[d * D_MODEL + i];
    }
    Q[s][d] = feature_map(data_t(sq));
    K[s][d] = feature_map(data_t(sk));
}
```

The loop bound is `ACTIVE_DIM` (compile-time constant, not data-dependent), and the channel index is `ACTIVE_CHANNELS[ii]` (compile-time constant array). Vitis HLS can unroll/pipeline this with known trip count.

### ⚠️ WARNING: Despite compile-time sparsity, HLS LUT is FLAT

The existing CSYNTH results show LUT = ~25,700 for ALL sparse variants (S10, S20, S30) vs 25,402 for dense S0. This means:

1. The Q/K MAC reduction (~14/16 to ~11/16 channels) is too small relative to total compute
2. V, output projection, FFN, layer norm, and classifier are ALL full-width — these dominate LUT
3. The control logic overhead of ACTIVE_CHANNELS indirection offsets the small MAC savings
4. The PARETO2 design already has very efficient DSP sharing — sparse can't improve much further

---

## 8. Work Required — Complete Pipeline

### Configs 1-2 (Q16 S0, Q8 S0): Existing Vivado bitstreams

- Q16 S0: Re-run PYNQ full 3444 test with per-sample outputs
- Q8 S0: Package npz + PYNQ script, run on board

### Configs 3-5 (Q16 S10, S20, S30): HLS done, need Vivado + PYNQ

Each needs:
1. Verify CSIM PASS (already done)
2. Verify CSYNTH PASS (already done)
3. Generate AXI interface version (m_axi + s_axilite)
4. Export IP
5. Vivado block design + synthesis + implementation
6. Generate bitstream + hwh
7. Generate reference logits (SW model with sparse channels applied)
8. Package npz + PYNQ script
9. Run on PYNQ-Z2

### Config 6 (Q8 S30): Complete from scratch

1. Create active_channels.h for Q8 S30
2. Copy Q8 dense HLS, add sparse attention kernel
3. Run CSIM + CSYNTH
4. Follow Vivado + PYNQ pipeline

---

## 9. Reference Baseline Data for Plots

### From Existing PYNQ-Z2 Measured Results

| Point | LUT | Acc (PYNQ) | Latency (PYNQ) | Type |
|-------|-----|------------|----------------|------|
| Ours-Dense-Q16 (S0) | 14,004 | 94.13% | 926.31 us | Dense PYNQ |
| Ours-Compact-Q16 (small_B) | 13,095 | 93.96% | 454.92 us | Structural PYNQ |

### From ViT4Mal Literature

| Point | LUT | Acc | Latency | Type |
|-------|-----|-----|---------|------|
| ViT4Mal 1E2H (fastest) | 16,545 | 92.41% | 810,000 us | Literature |
| ViT4Mal 2E4H (recommended) | 16,079 | 93.89% | 1,480,000 us | Literature |
| ViT4Mal 4E4H | 16,135 | 92.16% | 2,820,000 us | Literature |

### [4] Linear Transformer Reference

- Latency: **29.86 us = 0.02986 ms** (NOT 29.86 ms)

---

## 10. Next Steps

1. ✅ Step 1 complete — this report documents all existing data
2. → Step 2: Create the 6 HLS project directories with proper active_channels.h
3. → Step 3: Generate reference logits for all 6 configs
4. → Step 4: Run Vivado for S10/S20/S30 (S0 already done)
5. → Step 5: Deploy to PYNQ-Z2 and measure
6. → Step 6: Collect results, generate figures, write conclusion

*Report generated 2026-07-02. All data values verified against source files.*
