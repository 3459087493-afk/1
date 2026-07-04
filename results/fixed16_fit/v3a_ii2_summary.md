# V3A (Pipeline II=2) Synthesis Summary

## Changes from V2

| Change | Detail |
|---|---|
| Pipeline pragma | All `#pragma HLS pipeline II=4` → `#pragma HLS pipeline II=2` |
| Source | Copied from `v2_resource` |
| Project name | `unsw_linear_transformer_fixed16_v3a_ii2_prj` |
| Algorithm / weights / types | ✅ UNCHANGED — same expf, same fixed16, same testbench |

## CSIM

| Metric | V1 | V2 | V3A |
|---|---|---|---|
| Status | PASS | PASS | **PASS** |
| max_abs_error | 8.713e-03 | 8.713e-03 | **8.713e-03** |
| mean_abs_error | 3.369e-03 | 3.369e-03 | **3.369e-03** |
| prediction_match_rate | 1.0 | 1.0 | **1.0** |

✅ Identical numerical results across all three versions.

## V1 / V2 / V3A Comparison

### Resource

| Resource | V1 (II=1) | V2 (II=4) | V3A (II=2) | Available | Limit |
|---|---|---|---|---|---|
| BRAM | 106 (37%) | 20 (7%) | **20 (7%)** | 280 | < 280 |
| DSP | 260 (118%) ❌ | 29 (13%) ✅ | **29 (13%) ✅** | 220 | < 220 |
| FF | 58,130 (54%) | 13,380 (12%) | **13,862 (13%)** | 106,400 | < 106,400 |
| LUT | 88,520 (166%) ❌ | 29,683 (55%) | **29,716 (55%)** | 53,200 | < 53,200 |

### Timing

| Metric | V1 (II=1) | V2 (II=4) | V3A (II=2) |
|---|---|---|---|
| Latency (cycles) | 5,210 | 115,939 | **68,688** |
| Latency @100 MHz | 52.1 µs | 1,159.4 µs | **686.9 µs** |
| Interval (cycles) | 5,211 | 115,940 | **68,689** |
| Estimated Fmax | 137.82 MHz | 137.82 MHz | **137.13 MHz** |
| Slack | 0.04 ns | 0.04 ns | **0.01 ns** |
| Loop Constraints | ❌ NOT satisfied | ❌ NOT satisfied | **✅ ALL satisfied** |

### Latency vs Resource Trade-off

```
V1  (II=1): 5,210 cycles    — Fails PYNQ‑Z2 (DSP 260, LUT 88K)
V2  (II=4): 115,939 cycles  — Fits PYNQ‑Z2  (DSP 29,  LUT 30K)
V3A (II=2): 68,688 cycles   — Fits PYNQ‑Z2  (DSP 29,  LUT 30K)  ← BEST BALANCE
```

| Metric | V1→V2 change | V2→V3A change |
|---|---|---|
| Latency | +2,125% | **-41%** |
| DSP | -89% | same |
| LUT | -66% | <+1% |
| FF | -77% | +3.6% |

## PYNQ‑Z2 Feasibility

### ✅ V3A FITS PYNQ‑Z2 — ALL RESOURCES PASS

| Check | Value | Status |
|---|---|---|
| BRAM < 280 | 20 (7%) | ✅ |
| DSP < 220 | 29 (13%) | ✅ |
| FF < 106,400 | 13,862 (13%) | ✅ |
| LUT < 53,200 | 29,716 (55%) | ✅ |

## Key Findings

1. **II=2 is the sweet spot**: Going from II=4 to II=2 cuts latency 41% with **negligible resource increase** (+482 FF, +33 LUT, same BRAM/DSP). The tool was already sharing multipliers efficiently at II=4; II=2 just tightens the schedule without requiring additional hardware.

2. **Loop constraints satisfied**: V3A is the first version where ALL loop pipeline constraints are met — the tool was able to achieve II=2 everywhere. This means the schedule is real and the estimates are reliable (V1/V2 had "NOT satisfied" warnings indicating some loops might not actually meet their II target).

3. **V3A represents ~13× latency increase over V1** (68.7K vs 5.2K cycles) but fits comfortably on PYNQ‑Z2. This is a classic HLS resource-latency trade-off.

4. **Further optimization potential**: At 30K LUT / 13.8K FF / 29 DSP, there is still headroom. If lower latency is desired, a future V3B with II=1 on specific loops (e.g., only the Q/K/V inner MACs at II=2, everything else at II=1) could be explored.
