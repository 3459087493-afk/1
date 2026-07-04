# QKS-v2 Phase 6: Vivado Implementation & Bitstream Generation

**Date:** 2026-07-03
**Status:** ✅ COMPLETE — All 4 configs built, bit/hwh ready. PYNQ PENDING.

---

## 1. Build Summary

All 4 QKS-v2 configurations successfully passed Vivado implementation:

| Config | ATTN_DIM | LUT | DSP | FF | BRAM | WNS | Timing | Bit | HWH |
|--------|:---:|------|:---:|------|:---:|------|--------|:---:|:---:|
| Q16-QKSv2-D16 | 16 | **13,322** | 147 | 12,733 | 15 | +0.254ns | ✅ PASS | ✅ | ✅ |
| Q16-QKSv2-D14 | 14 | **13,344** | 147 | 12,735 | 15 | +0.494ns | ✅ PASS | ✅ | ✅ |
| Q16-QKSv2-D13 | 13 | **13,349** | 148 | 12,779 | 15 | +0.606ns | ✅ PASS | ✅ | ✅ |
| Q16-QKSv2-D11 | 11 | **13,347** | 148 | 12,779 | 15 | +0.492ns | ✅ PASS | ✅ | ✅ |

---

## 2. Key Findings

### 2.1 All 4 configs PASS timing

Positive WNS (worst negative slack) on all 4:
- D16: +0.254ns
- D14: +0.494ns
- D13: +0.606ns (best)
- D11: +0.492ns

All comfortably within the 100 MHz (10ns) target.

### 2.2 LUT nearly constant across sparsity levels

| Config | LUT | Δ vs D16 |
|--------|------|----------|
| D16 | 13,322 | — |
| D14 | 13,344 | +22 (+0.17%) |
| D13 | 13,349 | +27 (+0.20%) |
| D11 | 13,347 | +25 (+0.19%) |

LUT variation is <0.2% — physically pruning Q/K channels does NOT reduce LUT count. This is expected because:
- The Vivado IP uses DSP-shared sequential MACs (not parallel unrolled multipliers)
- The datapath (FIFOs, control logic, AXI interfaces) stays the same size
- Only loop tripcounts change within shared hardware, not the hardware itself

All configs at ~13.3k LUT = 25% of PYNQ-Z2 (53,200), well within capacity.

### 2.3 DSP barely changes

| Config | DSP | 
|--------|-----|
| D16 | 147 | 
| D14 | 147 |
| D13 | 148 |
| D11 | 148 |

The extra DSP at D13/D11 (+1) comes from slightly different MAC scheduling at smaller ATTN_DIM. Negligible.

### 2.4 FF nearly constant

| Config | FF |
|--------|-----|
| D16 | 12,733 |
| D14 | 12,735 |
| D13 | 12,779 |
| D11 | 12,779 |

Minor increase at D13/D11 (+46, +0.36%) from additional control logic for smaller loop bounds.

---

## 3. Resource vs Latency Trade-off

| Config | LUT | HLS Latency (cycles) | Latency Reduction | Est. Kernel (µs @100MHz) |
|--------|------|------:|------:|------:|
| D16 (0%) | 13,322 | 90,650 | — | ~907 |
| D14 (12.5%) | 13,344 | **86,812** | **-4.23%** | ~868 |
| D13 (18.75%) | 13,349 | **84,874** | **-6.37%** | ~849 |
| D11 (31.25%) | 13,347 | **81,022** | **-10.62%** | ~810 |

**Key insight: Nearly free latency reduction.** Q/K pruning reduces HLS latency by up to 10.62% with negligible resource increase (+0.2% LUT, +0.36% FF). The only resource-neutral design choice made.

---

## 4. PYNQ Readiness

| Criterion | D16 | D14 | D13 | D11 |
|-----------|:---:|:---:|:---:|:---:|
| Vivado impl PASS | ✅ | ✅ | ✅ | ✅ |
| Timing PASS | ✅ | ✅ | ✅ | ✅ |
| Bit file exists | ✅ 3.9M | ✅ 3.9M | ✅ 3.9M | ✅ 3.9M |
| HWH file exists | ✅ 261K | ✅ 261K | ✅ 261K | ✅ 261K |
| LUT < 53,200 | ✅ 25.0% | ✅ 25.1% | ✅ 25.1% | ✅ 25.1% |
| **ready_for_pynq** | ✅ | ✅ | ✅ | ✅ |

**All 4 configs: ready_for_pynq = true.**

---

## 5. What We Know (Pre-PYNQ)

| Metric | Source | Status |
|--------|--------|--------|
| Software accuracy | Phase 1 numpy simulation | ✅ 94.19-95.18% |
| HLS latency | Vitis HLS 2022.2 csynth | ✅ 81,022-90,650 cycles |
| Loop tripcounts | csynth.rpt verification | ✅ ATTN_DIM confirmed |
| Vivado resources | Placed & routed reports | ✅ 13,322-13,349 LUT |
| Vivado timing | Timing summary | ✅ All PASS |
| Bit/HWH files | Vivado write_bitstream | ✅ All 4 generated |
| **PYNQ latency** | **Board measurement** | **⏳ NOT YET** |
| **PYNQ accuracy** | **Board measurement** | **⏳ NOT YET** |

---

## 6. What We Do NOT Know / Cannot Claim Yet

- ❌ **PYNQ warm E2E latency** — no board connected
- ❌ **PYNQ board accuracy** — only software reference available
- ❌ **Kernel latency on PYNQ** — only HLS estimate
- ❌ **Speedup vs ViT4Mal on PYNQ** — needs measurement
- ❌ **Throughput (samples/sec) on PYNQ** — needs measurement

Do NOT cite HLS latency as "PYNQ latency" or "E2E latency."

---

## 7. Next Step: Phase 7 (PYNQ)

### Pre-requisites
1. User connects PYNQ-Z2 board via Ethernet
2. SSH access confirmed at 192.168.2.99
3. IMG_DS test images accessible on board

### Execution
1. Copy bit/hwh for D16, D14, D13, D11 to board
2. Run PYNQ test script (3444 images) for each config
3. Copy back: pynq_result.csv + e2e_latency.csv
4. Verify: accuracy, f1, prediction_match, warm E2E latency

### Expected timeline
~2 hours for all 4 configs (each ~25 min for 3444 images)

---

## 8. Comparison: QKS-v2 vs QKS-v1

| Metric | v1 (Q16-S30) | v2 (Q16-QKSv2-D11) | Improvement |
|--------|-------------|---------------------|-------------|
| Sparsity method | ACTIVE_CHANNELS indirect | Physical Wq/Wk pruning | v2 cleaner |
| HLS latency reduction | -0.34% | **-10.62%** | **31× better** |
| Vivado LUT | 14,044 | **13,347** | -5.0% |
| Vivado FF | 12,945 | **12,779** | -1.3% |
| Vivado DSP | 156 | **148** | -5.1% |
| Vivado timing | +0.370ns | +0.492ns | +33% margin |
| Latency trend | Non-monotonic | **Monotonic** | v2 reliable |
| Software accuracy | 94.13% (PYNQ) | **95.18%** (SW ref) | +1.05pp |

---

## Appendix: Build Command Log

```
Phase 6 build sequence:
  1. generated: run_export_ip.tcl (4 configs)      ← phase6_generate_vivado_scripts.py
  2. generated: create_*_vivado.tcl (4 configs)     ← phase6_generate_vivado_scripts.py
  3. ran:       vitis_hls -f run_export_ip.tcl       ← all 4 PASS (~38s each)
  4. ran:       vivado -mode batch -source create_*_vivado.tcl  ← all 4 PASS
     D16: synth+impl+bitstream (~4min)
     D14: synth+impl+bitstream (~3min)
     D13: synth+impl+bitstream (~3min)
     D11: synth+impl+bitstream (~3min)
  5. verified:  .bit + .hwh exist (all 4)           ← 3.9M + 261K each
  6. extracted: LUT/DSP/FF/BRAM/timing              ← from placed+routed reports
```

---

*Generated from Vivado 2022.2 implementation reports. PYNQ measurements pending board connection.*
