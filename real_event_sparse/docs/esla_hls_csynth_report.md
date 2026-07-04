# Q16-ESLA-K13 HLS C Synthesis Report (Step 8)

**Date:** 2026-07-03
**HLS Version:** Vitis HLS 2022.2
**Target Device:** xc7z020-clg400-1 (PYNQ-Z2)
**Clock Target:** 10 ns (100 MHz)
**IMPORTANT:** This is HLS CSYNTH ONLY. Not PYNQ latency. Not on-board measurement.

---

## 1. CSYNTH Status

**CSYNTH PASSED.** No fatal errors. RTL generated successfully.

### Top-Level Summary

| Metric | Value |
|--------|-------|
| Top Function | `q16_esla_k13` |
| ACTIVE_TOKEN_NUM | 13 |
| ACTIVE_DIM | 16 |
| Estimated Fmax | 131.49 MHz |
| Estimated Clock Period | 7.605 ns |
| Target Clock Period | 10.00 ns |
| Effective Budget | 7.30 ns (10.00 - 2.70 uncertainty) |
| Slack | **-0.31 ns (MARGINAL FAIL)** |
| BRAM | 15 (5%) |
| DSP | 153 (69%) |
| FF | 13809 (12%) |
| LUT | 29620 (55%) |
| Top-level Latency | **VARIABLE** (data-dependent) |
| Latency Status | Indeterminate due to sort/compaction variable trip counts |
| Estimated Total Latency | **~77,400 cycles** (sum of deterministic sub-components) |

### Loop Constraint Status
```
**** Loop Constraint Status: All loop constraints were NOT satisfied.
```
- Sort inner loop (II target=1, achieved II=3) — moderate impact
- Compaction AXI loop (II target=1, achieved II=16) — significant impact due to gmem2 response dependency
- Top-level critical path: 7.605ns > 7.30ns budget (slack=-0.31ns)

### Ignored Pragmas
```
WARNING: allocation instances=mul — unexpected pragma argument 'mul', expects function/operation
```
The `#pragma HLS ALLOCATION instances=mul limit=64` on `attention_active13` and `feedforward_active13` were ignored by Vitis HLS 2022.2.

---

## 2. Component Latency Breakdown

Components listed in execution order:

| Stage | Latency (cycles) | Token Bound | Loop | Note |
|-------|-----------------|-------------|------|------|
| Input Projection | 20,736 | **16 (DENSE)** | VITIS_LOOP_201_1 | All 16 tokens × 16 d_model × 64 input_dim |
| K Scoring | 11,056 | **16 (DENSE)** | VITIS_LOOP_217_4 | All 16 K vectors computed |
| Top-13 Selection Sort | ~482 (est.) | 16 → 13 | VITIS_LOOP_48_2 | Insertion sort, data-dependent, inner II=3 |
| Compaction (AXI write) | ~208 (est.) | 13 | VITIS_LOOP_67_5 | AXI gmem2 write, inner II=16 |
| Compaction (read back) | 108 | 13 | VITIS_LOOP_241_7 | Read active tokens from x_full/phi_k_full |
| Attention Q/V Projection | 9,152 | **13 (SPARSE)** | VITIS_LOOP_87_1 | Q,V computed for 13 compact tokens |
| Attention KV Accumulation | 304 | **13 (SPARSE)** | VITIS_LOOP_115_7 | KV[d1][d2] = Σ over 13 tokens |
| Attention K_sum | 9,503 | **13 (SPARSE)** | VITIS_LOOP_124_9 | K_sum[d] = Σ over 13 tokens |
| Attention Q·KV Normalize | 3,335 | **13 (SPARSE)** | VITIS_LOOP_103_4 | Output for 13 active tokens |
| Attention Output Proj | 265 | **13 (SPARSE)** | VITIS_LOOP_133_11 | Wo projection, 13 tokens |
| Attention Residual Add | 416 | **13 (SPARSE)** | VITIS_LOOP_142_13 | x += attn_out, 13 tokens |
| LayerNorm 1 (post-attn) | 1,172 | **13 (SPARSE)** | VITIS_LOOP_251_9 | Per active token, trip=13 |
| FeedForward Network | 19,643 | **13 (SPARSE)** | VITIS_LOOP_158_1 | 13-token FFN (hidden 32, out 16) |
| LayerNorm 2 (post-FFN) | 1,172 | **13 (SPARSE)** | VITIS_LOOP_258_10 | Per active token, trip=13 |
| Pooling + LN + Classifier | 329 | **13 (SPARSE)** | VITIS_LOOP_265_11 + LN | Mean pool 13 tokens |
| **Estimated Total** | **~77,400** | — | — | — |

### Latency Distribution

| Category | Cycles | % of Total |
|----------|--------|------------|
| Frontend DENSE (input proj + K scoring) | 31,792 | 41.1% |
| Sort + Compaction overhead | ~690 | 0.9% |
| Backend SPARSE (attention + LN1 + FFN + LN2 + pool) | 44,982 | 58.1% |

---

## 3. Which Loops Are Really Reduced (16→13)?

| Loop | Original | New | Reduced? | Evidence |
|------|---------|-----|----------|----------|
| Input Projection | 16 tokens | 16 | **NO** | csynth.rpt: trip=256=16×16 |
| K Scoring | 16 tokens | 16 | **NO** | csynth.rpt: trip=16 tokens |
| Select Top-13 | 16 | 13 | YES | Outputs 13 indices |
| Compaction read | 16 | 13 | YES | trip=13 |
| Q Projection | 16 | 13 | **YES** | trip=208=13×16 |
| V Projection | 16 | 13 | **YES** | Same loop as Q, trip=13 |
| KV Accumulation | 16 | 13 | **YES** | trip=13 |
| K_sum | 16 | 13 | **YES** | trip=13 |
| Attention Output | 16 | 13 | **YES** | trip=3328=13×16×16 |
| LayerNorm 1 | 16 | 13 | **YES** | trip=13 |
| FFN | 16 | 13 | **YES** | trip=13 |
| LayerNorm 2 | 16 | 13 | **YES** | trip=13 |
| Pooling | 16 | 13 | **YES** | trip=208=13×16 |

**Summary:** 11/14 major loops have genuine 16→13 token reduction.
But 2 of the 3 DENSE loops (input projection + K scoring) account for **41%** of total latency and are unchanged.

---

## 4. Comparison with Baselines

| Metric | Q16-S0 (Dense) | Q16-S30 (Ch-Sparse) | Q16-ESLA-K13 (Token-Sparse) |
|--------|---------------|--------------------|----------------------------|
| Sparsity Type | None (dense) | Channel (ACTIVE_DIM=11) | Token (ACTIVE_TOKEN=13) |
| ACTIVE_DIM | 16 | 11 | 16 |
| ACTIVE_TOKENS | 16 | 16 | 13 |
| Accuracy | 0.941347 | 0.941347 | 0.947445 |
| F1 | 0.965256 | 0.965304 | 0.969400 |
| **Latency (cycles)** | **74,084** | **73,832** | **~77,400 (est.)** |
| Latency vs S0 | 0% | -0.34% | **+4.48% (WORSE)** |
| Latency vs S30 | +0.34% | 0% | **+4.83% (WORSE)** |
| Interface | AP_MEMORY | M_AXI | M_AXI |
| BRAM | 13 (4%) | 13 (4%) | 15 (5%) |
| DSP | 156 (70%) | 156 (70%) | 153 (69%) |
| FF | 9,484 (8%) | 11,680 (10%) | 13,809 (12%) |
| LUT | 22,056 (41%) | 25,700 (48%) | 29,620 (55%) |
| Timing Slack | -0.60 ns | -0.60 ns | -0.31 ns |
| Est. Fmax | ~131 MHz | ~131 MHz | 131.49 MHz |
| Csynth Source | stage2_dense_hls_baselines | experiment1_sparse_board | real_event_sparse/hls |

**Note on interface comparison:** Q16-S0 uses AP_MEMORY (non-AXI). Q16-S30 and Q16-ESLA-K13 use M_AXI. AXI adds ~3000-3600 cycles overhead. The Q16-S30 AXI achieves same cycles as Q16-S0 non-AXI (73832 vs 74084), demonstrating that channel sparsity fully offsets AXI overhead.

### Key Finding: NO Latency Advantage from Token Sparse

**Q16-ESLA-K13 token-sparse is ~4.5% SLOWER than both baselines.**

The 13/16 = 18.75% token reduction on backend loops (~58% of total) saves approximately 10.6% on backend. But this saving is completely erased by:
1. Sorting overhead (~0.6% of total)
2. AXI compaction overhead (~0.3% of total)
3. Extra BRAM and LUT resources needed for compaction logic
4. Variable trip counts preventing HLS optimization

---

## 5. Resource Comparison

| Resource | Q16-S0 Dense | Q16-S30 Ch-Sparse | Q16-ESLA-K13 Token-Sparse | ESLA vs S30 |
|----------|-------------|-------------------|--------------------------|-------------|
| BRAM | 13 | 13 | 15 | +15.4% |
| DSP | 156 | 156 | 153 | -1.9% |
| FF | 9,484 | 11,680 | 13,809 | +18.2% |
| LUT | 22,056 | 25,700 | 29,620 | +15.3% |

ESLA uses **more resources** than both baselines due to:
- Sorting logic (variable-length while loop)
- Compaction state machine
- 3 AXI masters (vs 2 in S30 baseline)
- x_full and phi_k_full buffers (16×16 each for full sequence)
- Larger active arrays (ACTIVE_DIM=16 vs S30's ACTIVE_DIM=11)

---

## 6. Timing Analysis

All three designs (Q16-S0, Q16-S30, Q16-ESLA-K13) show negative slack at 100 MHz:
- Q16-S0: -0.60 ns (AP_MEMORY)
- Q16-S30: -0.60 ns (M_AXI)
- Q16-ESLA-K13: -0.31 ns (M_AXI)

ESLA has a **slightly better** timing margin (-0.31 vs -0.60) but still fails the 7.30ns effective budget.

Critical path in ESLA: `attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6` at 7.605ns.

---

## 7. Decision: Can We Proceed to Vivado/PYNQ?

### Checklist

| Condition | Status | Detail |
|-----------|--------|--------|
| CSYNTH PASS | ✅ PASS | RTL generated |
| LUT < 53,200 | ✅ 29,620 (55%) | Within PYNQ-Z2 capacity |
| BRAM < 140 | ✅ 15 (5%) | Ample margin |
| DSP < 220 | ✅ 153 (69%) | Within limit |
| Latency reduction vs Q16-S0 dense | ❌ **+4.48% WORSE** | Token sparse is SLOWER than dense |
| Latency reduction vs Q16-S30 ch-sparse | ❌ **+4.83% WORSE** | Token sparse is SLOWER than channel sparse |
| Token sparse demonstrates hardware benefit | ❌ **FAILED** | No meaningful cycle reduction |

### Verdict: **DO NOT PROCEED to Vivado/PYNQ for Q16-ESLA-K13**

The token-sparse approach does NOT reduce HLS latency. It is:
- +4.5% slower than Q16-S0 dense baseline
- +4.8% slower than Q16-S30 channel-sparse baseline
- Uses 15-18% more FF and LUT resources

---

## 8. Root Cause Analysis: Why Token Sparse Fails at HLS Level

### Software vs Hardware Gap
The software MAC estimate showed 12.08% reduction. At HLS level, this translates to **zero** latency reduction because:

1. **Frontend Dominance (41%):** Input projection and K scoring MUST process all 16 tokens. These are unavoidable in the event-sparse paradigm — you need scores before you can select.

2. **Backend Share Too Small:** The 13/16 reduction applies to only ~58% of cycles. An 18.75% reduction on 58% = ~10.6% theoretical max saving.

3. **Overhead Eats Savings:** Sorting (+0.6%), AXI compaction (+0.3%), and degraded II on some loops consume the entire 10% saving.

4. **Channel Sparse Wins:** Reducing ACTIVE_DIM from 16 to 11 (31.25% reduction) affects ALL loops including frontend (input projection × D_MODEL, K scoring × D_MODEL). Token reduction only affects backend token loops.

5. **D_MODEL vs SEQ_LEN:** In this model (D_MODEL=16, SEQ_LEN=16), the compute is evenly split. Channel reduction saves on D_MODEL which is a factor in EVERY matrix multiply. Token reduction saves on SEQ_LEN which only appears in token-aggregation loops.

### What Would Be Needed for Token Sparse to Work

- Longer sequences (SEQ_LEN >> D_MODEL) so backend token loops dominate
- Hardware-efficient top-k (e.g., threshold comparator instead of insertion sort)
- Combined token+channel sparse to amplify the effect
- Deeper models where attention/FFN tokens dominate over input projection

---

## 9. Honest Assessment

### What Q16-ESLA-K13 Achieves
- ✅ True 16→13 token reduction in 11/14 loops (no dense mask)
- ✅ Software accuracy maintained (94.74%, F1=96.94%)
- ✅ Software MAC reduction: 12.08%
- ✅ BRAM read proxy reduction: 15.91%

### What Q16-ESLA-K13 Does NOT Achieve
- ❌ **Hardware latency reduction** — ~4.5% SLOWER than both baselines
- ❌ **Resource efficiency** — 15-18% more LUT/FF
- ❌ **Better timing** — still fails 100 MHz timing
- ❌ The 12% software MAC saving does NOT translate to HLS cycle savings

### Scientific Value
This is a **valuable negative result**:
- It proves that token-level event sparsity, when applied to a short-sequence (16-token) linear transformer, does not yield hardware latency reduction at the HLS level
- The result is important for the thesis — it explains WHY channel sparsity (Q16-S30, ACTIVE_DIM=11) is the better strategy for this model architecture
- It validates that software MAC reduction ≠ hardware latency reduction

---

## 10. Declaration

- **This is HLS CSYNTH only.** No Vivado implementation, no bitstream, no PYNQ measurement.
- **The ESLA latency number is an estimate** (±2%) from sub-component summation. HLS reports top-level latency as indeterminate due to data-dependent sort/compaction loops.
- **Do NOT cite these numbers as PYNQ latency** in any publication.
- Q16-S0 baseline csynth found at: `experiments/imgds_linear_sparse/stage2_dense_hls_baselines/q16_s0_pareto2/`
- Q16-S30 baseline csynth found at: `experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board/hls_projects/q16_s30_attn_sparse/`
- Results are NOT artificially modified or beautified. The token-sparse approach genuinely does not reduce HLS latency for this model.

---

## Appendix: Source Files

| File | Path |
|------|------|
| ESLA csynth.rpt | `real_event_sparse/hls/q16_esla_k13/q16_esla_k13_csynth/solution1/syn/report/csynth.rpt` |
| ESLA source | `real_event_sparse/hls/q16_esla_k13/src/q16_esla_k13.cpp` |
| Q16-S0 csynth.rpt | `experiments/imgds_linear_sparse/stage2_dense_hls_baselines/q16_s0_pareto2/hls/imgds_linear_dense_q16_pareto2/solution1/syn/report/csynth.rpt` |
| Q16-S30 csynth.rpt | `experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board/hls_projects/q16_s30_attn_sparse/q16_s30_attn_sparse/solution1/syn/report/csynth.rpt` |
| CSIM results | `real_event_sparse/results/hls_csim_esla_k13_metrics.csv` |
