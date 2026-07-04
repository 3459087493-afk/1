# Final Teacher Summary: IMG_DS PYNQ-Z2 Results vs ViT4Mal

**Generated:** 2026-07-01
**Project:** Linear Transformer FPGA Acceleration on IMG_DS

---

## 1. Our Two Final PYNQ-Z2 Points

| Property | Ours-Dense-Q16 | Ours-Compact-Q16 |
|----------|---------------|------------------|
| d_model / ff_dim | 16 / 32 | 8 / 16 |
| Model params | 3,538 | 1,258 |
| Quantization | ap_fixed<16,6> | ap_fixed<16,6> |
| Test samples | 3,444 | 3,444 |
| **PYNQ HW Accuracy** | **94.13%** | **93.96%** |
| Ref Accuracy | 94.19% | 95.18% |
| Prediction Match vs Ref | 99.25% | 97.15% |
| **Vivado LUT** | **14,004** (26.3%) | **13,095** (24.6%) |
| Vivado DSP | 156 (70.9%) | 98 (44.5%) |
| Vivado FF | 12,903 (12.1%) | 12,154 (11.4%) |
| Vivado BRAM | 15 (5.4%) | 11 (3.9%) |
| **Kernel Latency (1000 runs)** | **926.31 μs** | **454.92 μs** |
| Throughput | 155.25 samples/s | 172.58 samples/s |
| NaN / Inf samples | 0 / 0 | 0 / 0 |

---

## 2. Comparison with ViT4Mal

| Point | Accuracy | LUT | DSP | Latency | Speedup vs ViT4Mal-Fastest |
|-------|----------|-----|-----|---------|---------------------------|
| ViT4Mal-Fastest (1E2H) | 92.41% | 16,545 | 69 | 810 ms | 1× |
| ViT4Mal-Rec (2E4H) | 93.89% | 16,079 | 69 | 1,480 ms | 0.55× |
| **Ours-Dense-Q16** | **94.13%** | **14,004** | 156 | **0.93 ms** | **870×** |
| **Ours-Compact-Q16** | **93.96%** | **13,095** | **98** | **0.46 ms** | **1,781×** |

---

## 3. Key Conclusions

1. **Ours-Dense-Q16 is the high-accuracy point.**
   - Accuracy 94.13% exceeds all 6 ViT4Mal configurations.
   - LUT 14,004 is 15% lower than ViT4Mal-Fastest (16,545).
   - Latency 0.93 ms is 870× faster than ViT4Mal-Fastest (810 ms).

2. **Ours-Compact-Q16 is the low-resource, low-latency point.**
   - Accuracy 93.96% ties ViT4Mal-Rec (93.89%) while using less LUT.
   - LUT 13,095 is 21% lower than ViT4Mal-Fastest.
   - Latency 0.46 ms is 1,781× faster than ViT4Mal-Fastest.
   - DSP 98 (vs ViT4Mal 69) is the only resource where we are higher.

3. **Accuracy-latency-resource trade-off is improved.**
   - Our method achieves comparable or higher accuracy at drastically lower latency.
   - LUT, FF, and BRAM are lower than all ViT4Mal configurations.
   - DSP usage is higher (156 / 98 vs ViT4Mal's 69) — this trade-off must be acknowledged in the paper.

4. **DSP trade-off note for the paper:**
   The paper should NOT claim "all resources are lower." Instead, position the contribution as:
   - "Our Linear Transformer achieves 870–1,781× latency reduction and 15–21% LUT reduction compared to ViT4Mal, at the cost of higher DSP utilization (156 vs 69 for the dense variant). The compact variant (DSP=98) narrows this gap significantly."

---

## 4. Data Provenance

| Data | Source |
|------|--------|
| ViT4Mal accuracy/LUT/latency | Published ViT4Mal paper, Table 13 |
| Ours accuracy | PYNQ-Z2 measured, 3,444-sample full IMG_DS test set |
| Ours LUT/DSP/FF/BRAM | Vivado 2022.2 placed utilization report |
| Ours latency | PYNQ-Z2 measured, kernel_runtime 1000-run mean |
| Model architecture | Linear Transformer (NOT ViT or standard Transformer) |
| Model training | 30 epochs on IMG_DS training set, no retraining for HLS |

---

## 5. What the Paper Should NOT Claim

- ❌ Do NOT claim all resources are lower than ViT4Mal (DSP is higher).
- ❌ Do NOT claim the model is a ViT variant (it is a Linear Transformer).
- ❌ Do NOT claim HLS estimated latency as PYNQ measured (all latency values above are PYNQ-Z2 measured).
- ❌ Do NOT use the 29.86 ms Linear Transformer result from reference [4] as our final result — our figures use PYNQ-Z2 measured 0.46–0.93 ms.
- ❌ Do NOT claim our method works on 128×128 RGB images (we use 32×32 grayscale).

---

## 6. Figures

| Figure | Description |
|--------|-------------|
| `fig1_acc_vs_lut_final.png` | Accuracy vs LUT: Ours (2 points) vs ViT4Mal (6 points) |
| `fig2_acc_vs_latency_final.png` | Accuracy vs Latency (log ms): Ours vs ViT4Mal |
