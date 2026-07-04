# Design Space Figures — Explanation

**Generated:** 2026-07-01

---

## Figure 1: `fig1_acc_vs_lut_final_designspace.png`

**Accuracy vs LUT on IMG_DS.**

| Marker | Group | Source | Meaning |
|--------|-------|--------|---------|
| Blue squares | ViT4Mal | ViT4Mal Table 13 (published) | Architecture variants (1E2H to 4E4H) |
| Light red open circles | Ours SW/HLS candidates | HLS CSYNTH or SW estimates | Design-space exploration: quant, sparse, small models |
| Large red stars | Ours PYNQ-Z2 measured | Vivado + PYNQ-Z2 board | Final validated points |

Key annotations:
- **ViT4Mal-Fastest:** LUT=16,545, Acc=92.41%
- **ViT4Mal-Rec:** LUT=16,079, Acc=93.89%
- **Ours-Dense-Q16:** LUT=14,004, Acc=94.13% (PYNQ measured)
- **Ours-Compact-Q16:** LUT=13,095, Acc=93.96% (PYNQ measured)

Orange dashed line: PYNQ-Z2 LUT limit (53,200).

---

## Figure 2: `fig2_acc_vs_latency_final_designspace.png`

**Accuracy vs Latency on IMG_DS.**

Same marker convention as Figure 1. x-axis uses **log scale** because ViT4Mal latency (810–2,820 ms) and
Ours latency (0.46–0.93 ms for final points; 0.28–0.78 ms HLS estimate range for candidates) differ by ~3 orders of magnitude.

Key annotations:
- **ViT4Mal-Fastest:** 810 ms, Acc=92.41%
- **ViT4Mal-Rec:** 1,480 ms, Acc=93.89%
- **Ours-Dense-Q16:** 0.93 ms, Acc=94.13% (PYNQ measured)
- **Ours-Compact-Q16:** 0.46 ms, Acc=93.96% (PYNQ measured)

---

## Evidence Level Legend

| Evidence Level | Marker | What It Means |
|---------------|--------|---------------|
| **Level 3 (highest)** | Large red star | Real PYNQ-Z2 board validation. Vivado actual LUT + PYNQ measured latency + PYNQ measured accuracy on 3,444 test samples. |
| **Level 2 (intermediate)** | Light red open circle | HLS CSYNTH completed. LUT from CSYNTH report. Latency from cycle count / 100 MHz. Accuracy from CSIM or SW simulation. NOT Vivado. NOT PYNQ. |
| **Level 1 (preliminary)** | Light red open circle | Software simulation only. LUT linearly estimated from model parameter ratio. Latency linearly estimated. SW accuracy only. |
| **Level 0 (reference)** | Blue square | Published ViT4Mal results. For comparison only. |

---

## Design Space Points Detail

| Point | Evidence Lv | Acc (%) | LUT | Latency (HLS estimate) | Data Source |
|-------|-----------|--------|-----|------------------------|-------------|
| Q16 dense (HLS baseline) | Lv 2 | 94.43 | 25,402 (HLS) | 756.27 us | `experiment1_hls_quant_sparsity_summary.csv` |
| Q8 dense (HLS) | Lv 2 | 91.00 | 25,378 (HLS) | 758.43 us | `experiment1_hls_quant_sparsity_summary.csv` |
| Q16 attn S10 (HLS) | Lv 2 | 95.18 | 25,700 (HLS) | 776.45 us | `experiment1_attention_only_hls_summary.csv` |
| Q16 attn S30 (HLS) | Lv 2 | 95.21 | 25,700 (HLS) | 738.32 us | `experiment1_attention_only_hls_summary.csv` |
| small_A (SW est.) | Lv 1 | 96.05 | ~16,300 (est) | ~485 us (est) | `structural_small_model_software_summary.csv` |
| tiny (SW est.) | Lv 1 | 95.53 | ~9,450 (est) | ~281 us (est) | `structural_small_model_software_summary.csv` |

---

## Key Conclusions

1. **Ours-Dense-Q16** is the high-accuracy point (94.13%), with 874× speedup over ViT4Mal-Fastest.
2. **Ours-Compact-Q16** is the low-resource low-latency point (93.96%, LUT=13,095), with 1,781× speedup.
3. The design-space sweep shows that:
   - Post-training quantization (Q8) and channel sparsity (attn S10/S30) preserve accuracy but do NOT reduce LUT in HLS.
   - Structural reduction (d_model=8, ff_dim=16) is the effective method that reduced Vivado LUT from 14,004 to 13,095.
   - Further reduction (tiny, d=6/ff=12) is available as a future ablation but not yet validated.
4. Blue squares (ViT4Mal) and red stars (Ours final) are the only points with board-level validation.
   Light-red candidates provide design-space context but must NOT be cited as measured results.

---

*Generated 2026-07-01.*
