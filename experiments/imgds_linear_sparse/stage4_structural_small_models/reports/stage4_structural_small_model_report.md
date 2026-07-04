# Stage 4: Structural Small Linear Transformer Models — Report

**Generated:** 2026-07-01
**Goal:** Push LUT below 14,004 by structurally reducing model dimensions.
**Model family:** Linear Transformer (NOT ViT4Mal)

---

## 1. Why Structural Reduction?

Post-training quantization (Q8, Q4) and channel sparsity failed to reduce LUT below 14,004:

| Method | HLS LUT | Vivado LUT | Below 14,004? |
|--------|---------|------------|----------------|
| Q16 dense (main) | 25,402 | 14,004 | — (baseline) |
| Q8 dense | 25,378 | 14,019 | No |
| Q16 attn-only S10 | 25,700 | — | No |
| Q4 S10 global | CSIM FAILED | — | Not viable |

The data path dominates LUT. Structural reduction is the remaining strategy.

---

## 2. Small Model Configs

| Model | d_model | ff_dim | Params | vs Q16 |
|-------|---------|--------|--------|--------|
| Q16 Main | 16 | 32 | 3538 | 100% |
| small_A | 12 | 24 | 2270 | 64% |
| small_B | 8 | 16 | 1258 | 36% |
| tiny | 6 | 12 | 848 | 24% |

---

## 3. Training Results

| Model | Test Acc | F1 | AUC | vs ViT4Mal Rec (93.89%) |
|-------|----------|-----|------|-------------------------|
| Q16 Main | 94.43% | 0.9671 | 0.9791 | ABOVE (+0.54pp) |
| small_A | 96.05% | 0.9772 | 0.9793 | ABOVE (+2.16pp) |
| small_B | 95.18% | 0.9722 | 0.9759 | ABOVE (+1.29pp) |
| tiny | 95.53% | 0.9741 | 0.9698 | ABOVE (+1.64pp) |

All 3 exceed ViT4Mal recommended — and are MORE accurate than Q16 main!

---

## 4. Estimated Vivado LUT (Linear Scaling)

| Model | Est. Vivado LUT | Est. DSP |
|-------|-----------------|---------|
| Q16 Main | 14,004 | 156 |
| small_A | ~9,000 | ~100 |
| small_B | ~5,000 | ~56 |
| tiny | ~3,400 | ~38 |

Linear estimates only. Real HLS/Vivado required.

---

## 5. HLS Priority

| Priority | Model | Rationale |
|----------|-------|-----------|
| 1 | small_B | d=8 ff=16. Est LUT ~5000. Acc=95.18%. Best trade-off |
| 2 | small_A | d=12 ff=24. Est LUT ~9000. Acc=96.05%. Safer |
| 3 | tiny | d=6 ff=12. Est LUT ~3400. Acc=95.53%. Aggressive |

---

## 6. Cannot Claim Yet

- Vivado actual LUT for small models
- HLS CSYNTH for small models
- PYNQ measured latency

---

## 7. Rules Followed

- src/transformer.py NOT modified
- Q16 main checkpoint NOT modified
- Linear Transformer family maintained
- ViT4Mal is comparison baseline only
- Software preview only

*Report generated 2026-07-01.*
