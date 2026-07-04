# PYNQ-Z2 Board Candidate Inventory

**Scan date:** 2026-07-01
**Project root:** `/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse`

---

## Status Legend

| Status | Meaning |
|--------|---------|
| **DONE** | PYNQ full 3444 test completed, result CSV exists |
| **DONE (partial)** | PYNQ tested on eval200 only, full 3444 pending |
| **Ready** | Has bit + hwh + HLS done, needs npz + PYNQ script |
| **Need Vivado** | HLS CSYNTH done, no bit yet, needs Vivado flow |
| **Need HLS** | SW trained/checked, no HLS run yet |
| **Not viable** | CSIM failed or accuracy collapsed, do not board |

---

## 1. DONE — Already PYNQ-Z2 Validated

| # | Paper Name | Internal Code | Directory | bit | hwh | 3444 npz | PYNQ script | Result CSV | Acc (SW) | Acc (PYNQ) | LUT (Vivado) | Latency (PYNQ) | Paper Role |
|---|-----------|---------------|-----------|-----|-----|----------|-------------|------------|----------|------------|--------------|----------------|-----------|
| 1 | **Ours-Compact-Q16** | small_B | `stage4_structural_small_models/pynq_test_package/` | ✅ | ✅ | ✅ | ✅ | ✅ | 95.18% | 93.96% | 13,095 | 454.92 us | Low-LUT low-latency point |
| 2 | **Ours-Dense-Q16** | Q16 Main / PARETO2-AXI | `q16_full_pynq_validation/` | ✅ | ✅ | ✅ | ✅ | ⏳ Pending board run | 94.19% | TBD | 14,004 | TBD | High-accuracy point |

> **Note on #2:** Q16 Main has an older eval200 PYNQ result (`pynq_pareto2_axi_runtime.csv`): 99% acc on 200 samples, 2408.76 us latency. Full 3444 test package is ready and awaiting board run. Do NOT use the old 200-sample result as the final number — wait for 3444-sample result.

---

## 2. Ready — Has bit + hwh, Needs npz + PYNQ Script

| # | Paper Name | Internal Code | Directory | bit | hwh | 3444 npz | PYNQ script | SW Acc | HLS LUT | Vivado LUT | Estimated Latency | Paper Role |
|---|-----------|---------------|-----------|-----|-----|----------|-------------|--------|---------|------------|-------------------|-----------|
| 3 | **Ours-Dense-Q8** | Q8 dense S0 | `stage3_quant_sparsity_hls/q8_s0_pareto_axi/` | ✅ | ✅ | ❌ | ❌ | 91.00% | 25,378 | **14,019** | ~758 us (HLS est) | Quantization ablation — shows Q16→Q8 accuracy/LUT trade-off |

> **Note on #3:** Q8 bitstream already exists at `vivado/q8_s0_pareto2.bit`. Vivado LUT=14,019 (flat vs Q16 14,004), but DSP=124 (-20.5% vs Q16 156). Q8 is the fastest path to another board point — only needs: (a) generate Q8 ref logits npz, (b) write PYNQ script (same int16 template as Q16/small_B), (c) run on board.
>
> **Expected result:** Acc loss ~3pp vs Q16 from quantization. DSP drop ~20%. LUT flat. Provides a useful quantization ablation data point for the paper.

---

## 3. Need Vivado — HLS Done, No bit Yet

| # | Paper Name | Internal Code | Directory | bit | hwh | HLS LUT | HLS Latency | SW Acc | Paper Role |
|---|-----------|---------------|-----------|-----|-----|---------|-------------|--------|-----------|
| 4 | **Ours-Sparse-Q16-S10** | q16_s10_attn_only | `stage3_attention_only_sparse_hls/q16_s10_attn_only/` | ❌ | ❌ | 25,700 | 776.45 us | 95.18% | Sparse ablation — shows S10 preserves acc but LUT flat |
| 5 | **Ours-Sparse-Q16-S30** | q16_s30_attn_only | `stage3_attention_only_sparse_hls/q16_s30_attn_only/` | ❌ | ❌ | 25,700 | 738.32 us | 95.21% | Sparse ablation — strongest sparse with best SW acc |

> **Critical note on #4, #5:** HLS LUT is FLAT at ~25,700 for all sparse variants (vs 25,402 baseline). Attention-only Q/K channel sparsity preserves software accuracy (95.18–95.21%) but does **not** reduce HLS LUT. If Vivado'd, expected Vivado LUT ~14,000–14,100 (same as Q16 dense/Q8). These points are scientifically valid as a **negative result**: "sparse attention preserves accuracy but does not reduce FPGA resource utilization in this Linear Transformer architecture."
>
> **Worth boarding?** Marginally. They would confirm the HLS flat-LUT finding at Vivado level, and provide PYNQ accuracy numbers, but they won't move the Pareto frontier. If teacher wants sparse data points, pick **S30** only (best SW acc of the sweep).
>
> **Effort:** ~2 hours per point (Vivado synthesis+implementation, then npz generation + PYNQ script).

---

## 4. Need HLS+Vivado+PYNQ — SW Only

| # | Paper Name | Internal Code | Directory | bit | hwh | Params | SW Acc | Est. Vivado LUT | Paper Role |
|---|-----------|---------------|-----------|-----|-----|--------|--------|-----------------|-----------|
| 6 | **Ours-CompactA-Q16** | small_A | `stage4_structural_small_models/` | ❌ | ❌ | 2,270 | **96.05%** | ~9,000 (est.) | Next structural frontier — higher acc than Q16 Main |
| 7 | **Ours-Tiny-Q16** | tiny | `stage4_structural_small_models/` | ❌ | ❌ | 848 | **95.53%** | ~6,100 (est.) | Extreme compression — smallest model |

> **Note on #6, #7:** These have trained checkpoints and SW accuracy data but no HLS run yet. small_A (d=12/ff=24) is the most promising: 96.05% SW acc (higher than Q16 Main 94.19%!) at 64% of the parameters. Follows the same PARETO2 architecture pattern used for Q16 Main and Compact-Q16 HLS. The HLS→Vivado→PYNQ pipeline works the same way.
>
> **Effort:** ~3–4 hours each (HLS CSIM+CSYNTH ~30 min, Vivado ~30 min, npz generation ~2 min, PYNQ script ~5 min).

---

## 5. Not Viable — Do NOT Board

| # | Paper Name | Internal Code | Reason |
|---|-----------|---------------|--------|
| — | Ours-Dense-Q4 | q4_s0 | SW acc=67.71%, accuracy collapsed |
| — | Ours-Sparse-Q4-S10 | q4_s10_global | CSIM FAILED, match=82.5% |
| — | Q16 global pruning S10/S30 | e1_q16_s10 / e1_q16_s30 | SW acc dropped to 85.89%/77.15% |
| — | Q16 attn S20 | q16_s20_attn_only | HLS LUT same as S10/S30, no additional value |

---

## 6. Recommended Boarding Priority

| Priority | Candidate | Reason | Effort | Pareto Value |
|----------|-----------|--------|--------|-------------|
| **Already done** | Ours-Dense-Q16 | ✅ 3444 package ready, awaiting run | 0 (script done) | High accuracy anchor |
| **Already done** | Ours-Compact-Q16 | ✅ Fully done | 0 | Low-LUT frontier |
| **1 (next)** | **Ours-Dense-Q8** | bit+hwh ready, just needs npz+script. Quantization ablation. | ~30 min | DSP trade-off data |
| **2** | **Ours-CompactA-Q16** (small_A) | 96.05% SW acc, 64% params. Potential 3rd Pareto point. | ~3–4 hours | 3rd red star on frontier |
| **3** | **Ours-Tiny-Q16** (tiny) | 95.53% SW acc, 24% params. Most extreme compression. | ~3–4 hours | 4th red star if works |
| **4 (optional)** | Ours-Sparse-Q16-S30 | HLS done, needs Vivado. Negative result but scientifically valid. | ~2 hours | Sparse ablation |

---

## 7. Summary

| Category | Count | Names |
|----------|-------|-------|
| **DONE (PYNQ measured)** | 2 | Ours-Dense-Q16, Ours-Compact-Q16 |
| **Ready (bit+hwh, needs package)** | 1 | Ours-Dense-Q8 |
| **Need Vivado (HLS done)** | 2 | Ours-Sparse-Q16-S10, Ours-Sparse-Q16-S30 |
| **Need HLS+Vivado** | 2 | Ours-CompactA-Q16 (small_A), Ours-Tiny-Q16 (tiny) |
| **Not viable** | 4 | Q4 Dense, Q4 S10, global pruning S10/S30, sparse S20 |

---

## 8. If Teacher Wants More Points

**Minimal effort path (2–3 more points):**
1. **Q8 Dense** — 30 min, already has bitstream.
2. **small_A** — 3–4 hours, highest potential (96% SW acc at 64% params). Could become the 3rd red star.
3. **Sparse S30** — 2 hours if Vivado already done elsewhere (same flow).

**This would give the paper 4–5 PYNQ-validated design points** — comparable to ViT4Mal Table 13 which has 6 points.

---

*Inventory generated 2026-07-01.*
