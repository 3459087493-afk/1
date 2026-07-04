# Table 3: Comparison with ViT4Mal — Resource, Accuracy, and Latency

| Method | Architecture | Board | Precision | BRAM | DSP | LUT | FF | Power (W) | Accuracy | Inference Time (ms) | Latency Source | PYNQ Measured | Speedup vs ViT4Mal Fastest | Notes |
|--------|-------------|-------|-----------|------|-----|-----|----|-----------|----------|---------------------|----------------|---------------|---------------------------|-------|
| ViT4Mal 4enc4head | ViT (4 enc, 4 heads) | PYNQ-Z1 | 16-bit | 84 | 69 | 16,135 | 16,364 | 1.89 | 92.16% | 2,820 | PYNQ measured | ✅ | 0.29× | Published |
| ViT4Mal 4enc2head | ViT (4 enc, 2 heads) | PYNQ-Z1 | 16-bit | 92 | 69 | 16,200 | 16,390 | 1.90 | 93.16% | 2,810 | PYNQ measured | ✅ | 0.29× | Published |
| ViT4Mal 2enc4head | ViT (2 enc, 4 heads) | PYNQ-Z1 | 16-bit | 84 | 69 | 16,079 | 16,356 | 1.87 | 93.89% | 1,480 | PYNQ measured | ✅ | 0.55× | Published recommended |
| ViT4Mal 2enc2head | ViT (2 enc, 2 heads) | PYNQ-Z1 | 16-bit | 92 | 69 | 16,219 | 16,393 | 1.88 | 93.86% | 1,450 | PYNQ measured | ✅ | 0.56× | Published |
| ViT4Mal 1enc4head | ViT (1 enc, 4 heads) | PYNQ-Z1 | 16-bit | 84 | 69 | 16,029 | 16,358 | 1.85 | 92.47% | 870 | PYNQ measured | ✅ | 0.93× | Published |
| ViT4Mal 1enc2head | ViT (1 enc, 2 heads) | PYNQ-Z1 | 16-bit | 92 | 69 | 16,545 | 16,911 | 1.89 | 92.41% | 810 | PYNQ measured | ✅ | 1.00× | Published fastest (baseline) |
| **Ours Q16 PARETO2 (HLS est.)** | **Linear Transformer 1-layer** | **PYNQ-Z2** | **16-bit** | **13** | **156** | **22,056** | **9,484** | — | **94.50%** | **0.741** | **HLS ESTIMATED** | ❌ | **1,093×** | **HLS est. @100MHz; NOT board validated** |
| **Ours Q16 PARETO2 (PYNQ)** | **Linear Transformer 1-layer** | **PYNQ-Z2** | **16-bit** | **PENDING_BOARD** | **PENDING_BOARD** | **PENDING_BOARD** | **PENDING_BOARD** | **PENDING_BOARD** | **PENDING_BOARD** | **PENDING_BOARD** | **PENDING_BOARD** | **PENDING_BOARD** | **PENDING_BOARD** | **Awaiting Vivado bitstream + PYNQ deployment** |

## Critical Notes
1. ⚠️ **HLS estimated latency is NOT board-measured latency.** Do not claim 1,093× speedup without PYNQ-Z2 validation.
2. ⚠️ ViT4Mal runs on PYNQ-Z1 (xc7z020-clg400, same FPGA as PYNQ-Z2), making comparison fair.
3. ⚠️ Our accuracy is eval200 (200 samples), not full test set. Full test accuracy is 94.19% (Q32 software).
4. ⚠️ ViT4Mal uses 128×128 RGB input; our model uses 32×32 grayscale — different input domains.
5. ⚠️ Power for our design is PENDING_BOARD — depends on Vivado power report and PYNQ measurement.
