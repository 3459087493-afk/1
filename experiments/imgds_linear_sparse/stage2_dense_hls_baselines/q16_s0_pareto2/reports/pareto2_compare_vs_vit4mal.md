# Q16-S0-PARETO2 — DSP-shared vs ViT4Mal Comparison

## Final Results: PARETO2 FITS PYNQ-Z2 ✅

| Metric                   | ViT4Mal fastest (1enc 2head) | Ours Q16-S0 naive | Ours Q16-S0 PARETO1 | **Ours Q16-S0 PARETO2** | PYNQ-Z2 Limit |
|--------------------------|-----------------------------|-------------------|----------------------|--------------------------|---------------|
| HW label accuracy        | 92.41 %                     | 94.50 %           | 94.50 %              | **94.50 %**              | ≥ 92.41 %     |
| Pred match vs Q32        | N/A                         | 0.985             | 0.985                | **0.985**                | ≥ 0.98        |
| BRAM                     | 92                          | 8                 | 17                   | **13**                   | 280           |
| DSP                      | 69                          | 2,410             | 2,639                | **156** ✅               | 220           |
| FF                       | 16,911                      | 117,524           | 89,690               | **9,484** ✅             | 106,400       |
| LUT                      | 16,545                      | 180,835           | 146,862              | **22,056** ✅            | 53,200        |
| Latency (cycles)         | N/A                         | 2,566             | 6,208                | **74,084**               | —             |
| Latency (ms at 100 MHz)  | 810 ms                      | 0.0257 ms         | 0.0621 ms            | **0.741 ms**             | < 27 ms       |
| Estimated clock (ns)     | N/A                         | 7.264 ns          | 7.264 ns             | **7.903 ns**             | 10 ns         |
| Estimated Fmax (MHz)     | N/A                         | 137.66 MHz        | 137.66 MHz           | **126.53 MHz**           | —             |
| PYNQ_Z2 fit              | ✅                          | ❌ (DSP/LUT/FF)    | ❌ (DSP/LUT)          | **✅ ALL PASS**          | ✅             |
| Speedup vs ViT4Mal       | 1.0×                        | 31,555×           | 13,042×              | **1,093×**               | > 30×         |
| Meets 30× goal           | —                           | ✅                | ✅                    | **✅ (1,093×)**          | ✅             |

## PARETO2 Key Design Decisions

1. **Removed almost all UNROLL pragmas** from matrix-multiply loops → DSP dropped from 2,639 to 156
2. **PIPELINE II=1 only on innermost accumulate loops** → shared DSP reuse across iterations
3. **ALLOCATION pragmas**: `instances=mul limit=32` (top), `limit=64` (attention), `limit=32` (FF)
4. **Minimal ARRAY_PARTITION**: only `logits complete`, all other arrays unpartitioned
5. **Direct flat-weight access** → no weight duplication
6. **Serial loops throughout** → latency 74K cycles, still 1,093× faster than ViT4Mal

## Resource Breakdown

| Module              | BRAM | DSP |  FF   |  LUT  |
|---------------------|------|-----|-------|-------|
| linear_attention    | 8    | 22  | 3,279 | 8,534 |
| QKV projection      | 0    | 50  | 1,893 | 4,161 |
| KV computation      | 0    | 50  | 1,893 | 4,161 |
| layer_norm_q16      | 0    | 5   | 1,211 | 2,673 |
| Other (FF, pool, clf)| 5   | 29  | 3,208 | 6,688 |
| **Total**           | **13** | **156** | **9,484** | **22,056** |
| **PYNQ-Z2 limit**   | **280** | **220** | **106,400** | **53,200** |
| **Headroom**         | **267** | **64** | **96,916** | **31,144** |

## Conclusion

**PARETO2 is the first version that fits PYNQ-Z2 with all resources within limits.**
- Accuracy matches Q32 floating-point (94.5%, same 3 mismatches as naive/PARETO1)
- Inference: 0.741 ms per image → 1,350 images/second
- 1,093× faster than ViT4Mal fastest (0.81s)
- Significant headroom in DSP (64 free), LUT (31K free), FF (97K free), BRAM (267 free)

## Next Steps

- **PARETO3 (optional)**: If higher accuracy desired, try ap_fixed<16,8> or QAFM instead of ELU+1
- **Stage 5**: Export IP from PARETO2 → Vivado → bitstream → .hwh
- **Stage 6**: PYNQ-Z2 on-board deployment and runtime measurement
