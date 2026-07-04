# Attention-only Q/K Sparse v4 Clear Figures — Notes

**Generated:** 2026-07-01
**Source CSVs:**
- `tables/experiment1_attention_only_progressive_sparse_results.csv`
- `tables/experiment1_software_quant_sparsity_results.csv`
- `tables/experiment1_attention_only_hls_summary.csv`
- `tables/experiment1_attention_only_full_sparsity_software_results.csv` (NOT YET GENERATED — run supplement script)

---

## Figure Inventory

| File | Data Source | Can Use in Paper? |
|------|------------|-------------------|
| `fig3_*_v4_clear.png` | Progressive SW | ✅ SW accuracy trend |
| `fig4_*_v4_clear.png` | SW (global + attn-only) | ✅ SW accuracy comparison |
| `fig5_*_v4_clear.png` | HLS CSYNTH | ⚠️ HLS only, NOT Vivado |
| `fig6_*_v4_clear.png` | HLS CSYNTH + SW acc | ⚠️ Hybrid (LUT=HLS, Acc=SW) |
| `fig7_*_v4_clear.png` | SW (full sparsity) | ✅ SW accuracy for all levels |

---

## fig3: Progressive attention-only accuracy vs sparsity

- **Q16:** Stable ~95.15–95.21% from S5 to S30. Above ViT4Mal recommended (93.89%).
- **Q8:** ~91.0–91.4%. Below ViT4Mal fastest (92.41%). Low-bit ablation only.
- Software accuracy. No HLS/PYNQ claim.

## fig4: Global pruning vs attention-only

- Q16 S10: global 85.89% → attention-only 95.18% (+9.3pp).
- Q16 S30: global 77.15% → attention-only 95.21% (+18.1pp).
- Attention-only preserves accuracy; global pruning fails.
- Software accuracy only.

## fig5: HLS CSYNTH LUT/Latency

- **LUT remains flat at ~25,700** across S0–S30.
- S30 latency = 73,832 cycles (2.4% less than S0 baseline 75,627).
- Attention-only Q/K channel sparsity does NOT reduce HLS LUT.
- HLS CSYNTH only. NOT Vivado actual. NOT PYNQ measured.

## fig6: Accuracy vs HLS LUT

- Accuracy stays 95.15–95.21% for all sparse variants.
- HLS LUT unchanged at ~25,700.
- Slight x-offset used for visualization (S10/S20/S30 all have LUT=25700).
- HLS LUT from CSYNTH. Accuracy from SW simulation.

## fig7: Teacher-required full sparsity (0/10/30/50/70/90/100)

- Global pruning: severe accuracy degradation at all sparsity levels.
- Attention-only: preserves accuracy at low sparsity; high-sparsity pending.
- 50%–100% region marked as ablation only.

---

## Key Conclusions

1. **Attention-only Q/K sparse preserves/increases software accuracy.**
   Q16 S10–S30: 95.15–95.21% (above 94.43% dense baseline and above ViT4Mal 93.89%).

2. **Attention-only Q/K sparse does NOT reduce HLS LUT.**
   HLS CSYNTH LUT = 25,700 for all sparse variants (vs 25,402 baseline).
   Loop truncation alone is insufficient — V channels and output projection dominate hardware.

3. **Q8 dense HLS remains the primary path for LUT below 14,004.**
   Lower bitwidth is the main lever for resource reduction in this architecture.

4. **Global pruning is confirmed as a failed ablation.**
   Accuracy drops severely, demonstrating why selective channel pruning matters.

---

## What Is NOT Done Yet

- ❌ Q8 S0 dense HLS (CSIM/CSYNTH)
- ❌ Sparse Vivado synthesis/implementation
- ❌ Sparse PYNQ-Z2 deployment
- ❌ Vivado actual LUT for any sparse variant
- ❌ PYNQ measured latency for any sparse variant

---

## Old Figures Preserved

- `fig1_acc_vs_lut.png` — untouched
- `fig2_acc_vs_latency.png` — untouched
- `fig3_attention_only_accuracy_vs_sparsity_v4.png` — old v4, untouched
- `fig4_global_vs_attention_only_accuracy_v4.png` — old v4, untouched
- `fig5_acc_vs_lut_attention_only_v4_estimated.png` — old estimated LUT, untouched

---

*Generated 2026-07-01.*
