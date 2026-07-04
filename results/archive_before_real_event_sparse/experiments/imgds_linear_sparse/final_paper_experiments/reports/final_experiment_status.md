# Final Experiment Status Report

**Date:** 2026-06-30
**Project:** IMG_DS Linear Transformer FPGA Acceleration vs ViT4Mal
**Branch:** icl_thesis-master

---

## 1. Completed Experiments

### Stage 1: Software Dense ONNX Baseline ✅

| Metric | Value |
|--------|-------|
| Accuracy | 94.19% |
| Precision | 97.71% |
| Recall | 95.45% |
| F1 | 96.57% |
| AUC | 97.91% |
| Test set | Full (3,444 samples) |
| ONNX max_abs_error | 7.15 × 10⁻⁷ |
| ONNX allclose | True |

Artifacts:
- `experiments/imgds_linear_sparse/onnx/linear_imgds_dense_r32_p8.onnx`
- `experiments/imgds_linear_sparse/reports/test_metrics.csv`
- `experiments/imgds_linear_sparse/reports/onnx_pytorch_diff.csv`

### Stage 2: Q16 Fake Quant Eval200 ✅

| Metric | Value |
|--------|-------|
| Accuracy | 95.5% |
| Precision | 97.59% |
| Recall | 97.01% |
| F1 | 97.30% |
| prediction_match_rate_vs_q32 | 99.5% |
| max_logit_error | 0.0594 |
| mean_logit_error | 0.0141 |

Artifacts:
- `experiments/imgds_linear_sparse/stage2_dense_hls_baselines/q16_s0/reports/q16_fake_quant_metrics.csv`

### Stage 3: Q32 HLS CSIM ✅

| Metric | Value |
|--------|-------|
| Prediction match rate | 100.0% |
| Max abs error | 0.00052404 |
| Mean abs error | 0.00010890 |
| CSIM | PASSED |

Artifacts:
- `stage2_dense_hls_baselines/q32_s0/logs/q32_csim_manual.log`

### Stage 4: Q16 HLS CSIM (Relaxed) ✅

| Metric | Value |
|--------|-------|
| Prediction match rate vs Q32 | 98.5% (197/200) |
| HW label accuracy | 94.5% (189/200) |
| Ref label accuracy | 95.0% (190/200) |
| Max abs error vs Q32 | 0.4212 |
| Mean abs error vs Q32 | 0.0659 |
| CSIM | PASSED (relaxed criteria) |

### Stage 5: HLS Optimization Path (PARETO0→1→2) ✅

#### Q16-S0-naive
- DSP: 2,410 (11× over PYNQ-Z2 limit)
- LUT: 180,835 (3.4× over)
- FF: 117,524 (1.1× over)
- DOES NOT FIT PYNQ-Z2

#### Q16-S0-PARETO1
- DSP: 2,639 (12× over — increased due to cyclic partition)
- LUT: 146,862 (2.76× over)
- DOES NOT FIT PYNQ-Z2

#### Q16-S0-PARETO2 ✅
| Resource | Used | Available | Utilization |
|----------|------|-----------|-------------|
| BRAM | 13 | 280 | 4.6% |
| DSP | 156 | 220 | 70.9% |
| FF | 9,484 | 106,400 | 8.9% |
| LUT | 22,056 | 53,200 | 41.5% |

| Timing Metric | Value |
|---------------|-------|
| Latency cycles | 74,084 |
| Estimated clock | 7.903 ns |
| Estimated Fmax | 126.53 MHz |
| Latency at 100 MHz | 740.84 μs (0.741 ms) |
| Throughput at 100 MHz | ~1,350 samples/sec |
| **PYNQ-Z2 FIT** | **YES — ALL resources within limits** |

Artifacts:
- `stage2_dense_hls_baselines/q16_s0_pareto2/reports/pareto2_csynth_summary.csv`
- `stage2_dense_hls_baselines/q16_s0_pareto2/reports/pareto2_csim_summary.txt`

---

## 2. PENDING: Not Yet Completed

### P1: Vivado Bitstream Generation ❌
- **Status:** NOT STARTED
- **Blocked by:** Nothing (PARETO2 csynth is complete)
- **Action:** Export IP from PARETO2 HLS project → Vivado block design → synthesize → implement → generate bitstream
- **Output:** `pareto2.bit`, `pareto2.hwh`

### P2: PYNQ-Z2 Board Deployment ❌
- **Status:** PENDING_BOARD (blocked by P1)
- **Action:** Copy bitstream + test package to PYNQ-Z2 → run `run_pareto2_pynq_test.py`
- **Measured values expected:**
  - single_kernel_runtime_us
  - kernel_runtime_mean_us_100runs
  - total_runtime_mean_us_100runs
  - prediction_match_rate_vs_q32
  - hw_label_accuracy
  - speedup_vs_vit4mal_fastest_0p81s

### P3: Sparse Attention HLS ❌
- **Status:** NOT STARTED (innovation1_csg_halt has intermediate results but no final sparse HLS IP)
- **Action:** Implement sparse attention mask in HLS C++ → integrate into PARETO2 design → re-run CSIM/CSYNTH

### P4: Event Sparse HLS ❌
- **Status:** NOT STARTED
- **Action:** Implement event-based sparse attention pruning in HLS

### P5: ViT4Mal-Aligned 128×128 RGB Supplement ❌
- **Status:** NOT STARTED
- **Blocked by:** Would require retraining a new model with different input size (explicitly prohibited by project constraints)
- **Note:** Current model uses 32×32 grayscale; ViT4Mal uses 128×128 RGB. Input domain differs. This is a limitation to acknowledge in the paper.

### P6: Power Measurement ❌
- **Status:** PENDING_BOARD (blocked by P1/P2)
- **Action:** Run Vivado power report OR measure on PYNQ-Z2

### P7: Final Speedup Validation ❌
- **Status:** PENDING_BOARD (blocked by P2)
- **Action:** After PYNQ-Z2 measurement, compute actual speedup vs ViT4Mal

---

## 3. What Can Be Written in the Paper Now

### Claims Supported by Measured Data:

1. ✅ **Linear Transformer achieves 94.19% accuracy on IMG_DS full test set** (float32, software), compared to 93.89% for ViT4Mal 2enc4head.

2. ✅ **Q16 fake quantization preserves accuracy** (95.5% on eval200, 99.5% match rate vs Q32).

3. ✅ **PARETO2 HLS design fits PYNQ-Z2** (xc7z020-clg400-1) with all resources within limits:
   - DSP: 156/220 (71%), LUT: 22,056/53,200 (41%), FF: 9,484/106,400 (9%), BRAM: 13/280 (5%).

4. ✅ **HLS estimated latency is 0.741 ms at 100 MHz**, yielding ~1,093× estimated speedup vs ViT4Mal fastest (0.81 s). This is an HLS estimate, not yet board-validated.

5. ✅ **PARETO2 achieves 94.5% hw_label_accuracy on eval200** (HLS CSIM relaxed pass), compared to 95.0% reference accuracy (Q32).

6. ✅ **DSP optimization path**: From 2,410 (naive unrolled) → 2,639 (cyclic partition) → 156 (ALLOCATION pragmas, serialized). A 15.4× DSP reduction.

7. ✅ **ViT4Mal comparison framework established** with Tables 1-4 and Pareto figures.

### Claims That MUST Be Hedged:

- ⚠️ "1,093× faster than ViT4Mal" → Must be clearly stated as **HLS estimated, pending board validation.**
- ⚠️ "0.741 ms inference" → Must specify **HLS csynth estimated latency, not PYNQ measured.**
- ⚠️ "94.5% accuracy" → Must specify **eval200 subset (200 samples), not full 3,444-sample test set.**
- ⚠️ "Fits PYNQ-Z2" → True for resources. Timing closure and on-board functionality are not yet verified.

---

## 4. What CANNOT Be Written in the Paper (Yet)

### Do NOT Claim:

1. ❌ "Measured 30× speedup over ViT4Mal on PYNQ-Z2" — No board measurement exists.
2. ❌ "0.741 ms measured FPGA latency" — This is HLS estimated, not measured.
3. ❌ "Sparse Linear Transformer achieves X sparsity with Y accuracy" — Sparse HLS not yet implemented.
4. ❌ "Event-sparse attention reduces latency by X%" — Not yet implemented.
5. ❌ "Power consumption is X W" — No power analysis done yet.
6. ❌ "PARETO2 is fully validated on PYNQ-Z2" — Only HLS simulation and synthesis are complete.
7. ❌ "Our model matches ViT4Mal input domain" — Different input (32×32 grayscale vs 128×128 RGB).
8. ❌ "Accuracy on full test set is 95.5%" — The 95.5% is on eval200, not full test. Full test: 94.19%.

---

## 5. Project Constraints (Reminders)

| Constraint | |
|------------|-----|
| Do NOT retrain 32×32 model | ✅ Respected |
| Do NOT modify src/transformer.py | ✅ Respected |
| Do NOT use host conda environments | ✅ Using Docker/Jupyter kernel |
| Do NOT fake sparse results | ✅ Not claiming any sparse results |
| Do NOT fake board latency | ✅ All board latency = PENDING_BOARD |
| Do NOT confuse HLS estimated with PYNQ measured | ✅ Clearly separated in all tables/figures |
| Use notebooks (not scattered .py files) | ✅ Master notebook created |

---

## 6. File Inventory

### Tables (CSV + MD):
- `tables/table1_model_accuracy_comparison.{csv,md}` — Model accuracy comparison
- `tables/table2_hls_optimization_path.{csv,md}` — HLS optimization path
- `tables/table3_compare_with_vit4mal.{csv,md}` — Comparison with ViT4Mal
- `tables/table4_cpu_gpu_fpga_latency.{csv,md}` — CPU/GPU/FPGA latency

### Figures:
- `figures/fig1_acc_vs_lut.png` — Accuracy vs LUT (Pareto)
- `figures/fig2_acc_vs_latency.png` — Accuracy vs Latency (Pareto)

### PYNQ Package:
- `pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/run_pareto2_pynq_test.py`
- `pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/README.md`
- `pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/eval_samples_q16.npz`
- `pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/expected_outputs.npy`
- `pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/expected_labels.npy`
- `pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/pareto2.bit` → **PENDING**
- `pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/pareto2.hwh` → **PENDING**

### Master Notebook:
- `notebooks/IMGDS_Final_Paper_Experiments.ipynb`

### Latency (pending):
- `latency/pynq_pareto2_runtime.csv` → **PENDING_BOARD**

### Reports:
- `reports/final_experiment_status.md` ← this file

---

## 7. Immediate Next Steps

1. **Generate Vivado bitstream** from PARETO2 csynth (highest priority)
   ```
   Export IP from Vitis HLS → Vivado block design → bitstream
   ```
2. **Deploy to PYNQ-Z2** and run `run_pareto2_pynq_test.py`
3. **Fill all PENDING_BOARD entries** in Tables 3 and 4
4. **Run Section E of the master notebook** in Docker Jupyter to get CPU/ONNX latency benchmarks
5. **Update fig1/fig2** with any new data points

---

*Report generated 2026-06-30. Docker/Jupyter kernel environment.*
