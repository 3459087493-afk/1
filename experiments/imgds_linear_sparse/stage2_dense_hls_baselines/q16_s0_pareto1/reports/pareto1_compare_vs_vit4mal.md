# Q16-S0-PARETO1 vs ViT4Mal Comparison

## Resource & Latency Summary

| Metric                     | ViT4Mal fastest (1enc 2head) | ViT4Mal recommended (2enc 4head) | Ours Q16-S0 naive unrolled | Ours Q16-S0 PARETO1 | PYNQ-Z2 Limit |
|----------------------------|-----------------------------|----------------------------------|---------------------------|---------------------|---------------|
| Accuracy / HW label acc    | 92.41 %                     | 93.89 %                          | 94.5 %                    | 94.5 %              | >= 92.41 %    |
| Prediction match vs Q32    | N/A                         | N/A                              | 0.985                     | 0.985               | >= 0.98       |
| BRAM                       | 92                          | 84                               | 8                         | 17                  | 280           |
| DSP                        | 69                          | 69                               | 2,410                     | 2,639               | 220           |
| FF                         | 16,911                      | 16,356                           | 117,524                   | 89,690              | 106,400       |
| LUT                        | 16,545                      | 16,079                           | 180,835                   | 146,862             | 53,200        |
| Latency (cycles)           | N/A                         | N/A                              | 2,566                     | 6,208               | —             |
| Latency (ms at 100 MHz)    | 810 ms                      | 1,480 ms                         | 0.0257 ms                 | 0.0621 ms           | < 27 ms       |
| Estimated clock (ns)       | N/A                         | N/A                              | 7.264 ns                  | 7.264 ns            | 10 ns         |
| Estimated Fmax (MHz)       | N/A                         | N/A                              | 137.66 MHz                | 137.66 MHz          | —             |
| PYNQ-Z2 fit                | ✅                          | ✅                               | ❌ (DSP/LUT/FF)           | ❌ (DSP/LUT)        | ✅ target      |
| Speedup vs ViT4Mal fastest | 1.0×                        | 0.55×                            | 31,555×                   | 13,042×             | > 30×         |

## Analysis

### PARETO1 improvements over naive
- **FF**: 117,524 → 89,690 (24% reduction)
- **LUT**: 180,835 → 146,862 (19% reduction)
- **Latency**: 2,566 → 6,208 cycles (2.4× slower, but still 13,000× faster than ViT4Mal)
- **DSP**: 2,410 → 2,639 (10% increase — cyclic partitioning created more DSP instances)

### Remaining bottlenecks (PARETO1)
1. **DSP (2,639 vs 220 limit)** — 12× over budget. Root cause:
   - `linear_attention_q16`: DSP=1,234
   - `feedforward_q16`: DSP=741
   - `imgds_linear_dense_q16_Pipeline_VITIS_LOOP_252_1`: DSP=610 (input projection)
   - HLS synthesizes dedicated MAC units for every `UNROLL factor=4` × `PIPELINE II=1` combination

2. **LUT (146,862 vs 53,200 limit)** — 2.76× over budget
   - `linear_attention_q16`: LUT=88,007
   - Even with cyclic factor=4, LUT usage is dominated by combinatorial logic

3. **FF (89,690 vs 106,400)** — borderline, might tighten after Vivado

### Why PARETO1 still exceeds resources
The `ap_fixed<16,6>` MAC operation `acc += x * w` synthesizes to a DSP48E primitive.  
With `UNROLL factor=4` + `PIPELINE II=1`, the tool creates ~4 parallel MAC units per pipelined loop.  
For a 16×16 matrix multiply × 16 positions × 3 projections (Q,K,V), the parallelism multiplies DSP count.

### Path to PARETO2
1. **DSP sharing**: Use `ALLOCATION` pragma to limit MAC instances (e.g., max 16 DSPs for attention)
2. **Reduce unroll**: factor=2 instead of factor=4
3. **Pipeline II=4** for the most expensive loops (attention Q/K/V projection)
4. **Merge sequential operations**: fuse the Q,K,V projections into a single pass
5. **Use `ap_fixed<16,6>` without DSP** where possible (LUT-based multipliers)
6. **Resource pragma**: `#pragma HLS RESOURCE variable=... core=FMul_ap_fixed`

## Conclusion

PARETO1 is **13,000× faster** than ViT4Mal fastest but still **2.76× over LUT and 12× over DSP** budget.  
PARETO2 needs aggressive DSP sharing/reuse to fit PYNQ-Z2 while keeping inference under 27 ms.
