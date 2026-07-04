# V2 Resource‑Constrained Fixed‑Point Synthesis Summary

## Changes from V1

| Change | Detail |
|---|---|
| QKV projection | Split from 1 combined loop (3 parallel MACs) → 3 sequential loops (Query, Key, Value) |
| Pipeline II | Added `#pragma HLS pipeline II=4` on all inner MAC loops |
| Allocation limit | `set_directive_allocation -limit 180 -type operation unsw_linear_transformer mul` |
| Project name | `unsw_linear_transformer_fixed16_v2_resource_prj` |

**Algorithm unchanged** — same expf activations, same weights, same model dimensions, same fixed‑point types.

## CSIM

| Metric | V1 | V2 |
|---|---|---|
| Status | **PASS** | **PASS** |
| max_abs_error | 8.713e-03 | 8.713e-03 |
| mean_abs_error | 3.369e-03 | 3.369e-03 |
| prediction_match_rate | 1.0 (16/16) | 1.0 (16/16) |

✅ Identical numerical results — resource constraints did not affect precision.

## CSYNTH — Resource Utilization

| Resource | V1 Used | V2 Used | Available | % (V2) | PYNQ‑Z2 Limit | V1 Fit? | V2 Fit? |
|---|---|---|---|---|---|---|---|
| BRAM | 106 | **20** | 280 | 7% | < 280 | ✅ | ✅ |
| DSP | 260 | **29** | 220 | 13% | < 220 | ❌ | ✅ |
| FF | 58,130 | **13,380** | 106,400 | 12% | < 106,400 | ✅ | ✅ |
| LUT | 88,520 | **29,683** | 53,200 | 55% | < 53,200 | ❌ | ✅ |

### Reduction Summary

| Resource | V1 → V2 | Reduction |
|---|---|---|
| BRAM | 106 → 20 | **-81%** |
| DSP | 260 → 29 | **-89%** |
| FF | 58,130 → 13,380 | **-77%** |
| LUT | 88,520 → 29,683 | **-66%** |

## CSYNTH — Timing

| Metric | V1 | V2 |
|---|---|---|
| Latency (max) | 5,210 cycles | **115,939 cycles** |
| Interval (max) | 5,211 cycles | **115,940 cycles** |
| Estimated Fmax | 137.82 MHz | 137.82 MHz |
| Target Clock | 100 MHz (10 ns) | 100 MHz (10 ns) |
| Slack | 0.04 ns | 0.04 ns |
| Loop Constraints | NOT satisfied | NOT satisfied |

⚠️ Latency increased ~22× due to relaxed pipeline (II=1→II=4) and sequential Q/K/V.

## PYNQ‑Z2 Feasibility

### ✅ ALL FOUR RESOURCES FIT — V2 PASSES PYNQ‑Z2

| Check | Status |
|---|---|
| BRAM < 280 | ✅ 20 (7%) |
| DSP < 220 | ✅ 29 (13%) |
| FF < 106,400 | ✅ 13,380 (12%) |
| LUT < 53,200 | ✅ 29,683 (55%) |

## Key Insights

1. **QKV split** was the most impactful change: combining 3 MAC operations into 1 loop created 3× the parallel DSP demand. Sequential separation allows DSP sharing.
2. **Pipeline II=4** allowed the tool to share multipliers across cycles rather than instantiating fully parallel DSP arrays.
3. **Allocation limit** of 180 mul operations acted as a backstop; actual DSP usage (29) ended up well below the limit, meaning the other changes were sufficient.
4. **BRAM dropped** from 106 to 20 because relaxed pipelining eliminated the need for multi‑ported/partitioned memory for parallel array access.
5. **Trade‑off accepted**: 22× latency increase for PYNQ‑Z2 compatibility. At 100 MHz, inference time is ~1.16 ms vs 52 µs in V1.
