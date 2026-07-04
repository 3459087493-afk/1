# Pending PYNQ Runs — Q16-QKS10 / Q16-QKS20

**Date:** 2026-07-03
**Status:** ✅ ALREADY COMPLETED (2026-07-02) — NOT PENDING

---

## Status

Both Q16-QKS10 (`q16_s10_attn_sparse`) and Q16-QKS20 (`q16_s20_attn_sparse`) were **already measured on PYNQ-Z2** on 2026-07-02. All 3,444 IMG_DS test images were processed. The results are in:

| Config | PYNQ result CSV | E2E latency CSV |
|--------|----------------|-----------------|
| Q16-QKS10 | `results/pynq_sparse_pareto/q16_s10_attn_sparse/q16_s10_attn_sparse_pynq_result.csv` | `results/pynq_sparse_pareto/q16_s10_attn_sparse/e2e_image_latency_result.csv` |
| Q16-QKS20 | `results/pynq_sparse_pareto/q16_s20_attn_sparse/q16_s20_attn_sparse_pynq_result.csv` | `results/pynq_sparse_pareto/q16_s20_attn_sparse/e2e_image_latency_result.csv` |

---

## Measured Results Summary

| Metric | Q16-QKS10 | Q16-QKS20 |
|--------|----------|----------|
| accuracy | 0.941057 (94.11%) | 0.942218 (94.22%) |
| precision | 0.978049 | 0.976752 |
| recall | 0.952494 | 0.955209 |
| f1 | 0.965102 | 0.965860 |
| prediction_match_rate | 0.993902 | 0.994483 |
| warm_e2e_mean_us | 20,288.40 | 21,332.90 |
| warm_e2e_p95_us | 26,487.50 | 24,595.86 |
| cold_start_latency_us | 3,998,326.91 | 3,948,968.30 |
| kernel_latency_us_1000runs | 954.77 | 939.25 |
| n_test_images | 3,444 | 3,444 |

---

## Bit/HWH Paths (for reference)

| Config | Bitstream | HWH |
|--------|-----------|-----|
| Q16-QKS10 | `experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board/hls_projects/q16_s10_attn_sparse/vivado/q16_s10_attn_sparse.bit` | `...vivado/q16_s10_attn_sparse.hwh` |
| Q16-QKS20 | `experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board/hls_projects/q16_s20_attn_sparse/vivado/q16_s20_attn_sparse.bit` | `...vivado/q16_s20_attn_sparse.hwh` |

---

## PYNQ Run Scripts (already executed)

| Config | Script path |
|--------|-----------|
| Q16-QKS10 | `results/pynq_sparse_pareto/q16_s10_attn_sparse/run_q16_s10_attn_sparse_pynq_full_test.py` (inferred) |
| Q16-QKS20 | Similar pattern |

---

## IMG_DS 3444 Sample Path

`data/IMG_DS/images/` (3,444 JPEG test images)

---

## If Re-measurement Is Ever Needed

1. Copy `.bit` and `.hwh` to PYNQ board
2. Run: `python3 run_q16_s10_attn_sparse_pynq_full_test.py` (S10) and S20 equivalent
3. Output targets:
   - `results/pynq_sparse_pareto/q16_s10_attn_sparse/e2e_image_latency_result.csv`
   - `results/pynq_sparse_pareto/q16_s20_attn_sparse/e2e_image_latency_result.csv`
4. Verify: accuracy, precision, recall, f1, prediction_match, warm E2E mean, P95, throughput

---

## Conclusion

**No action needed.** Q16-QKS10 and Q16-QKS20 were fully built and measured. The development board is currently disconnected, but this is irrelevant — the measurements are already complete.
