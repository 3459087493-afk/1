# Experiment 1 — Build & Deployment Status

**Updated:** 2026-07-02 16:00
**Board:** PYNQ-Z2 @ 192.168.2.99

---

## Tier 1: READY FOR PYNQ DEPLOYMENT (S0 = existing bitstreams)

| # | Config | Bit | HWH | NPZ | PYNQ Script | Status |
|---|--------|-----|-----|-----|-------------|--------|
| 1 | Ours-Q16-S0-AttnSparse | ✅ q16_main.bit | ✅ q16_main.hwh | ✅ 3 files | ✅ | **READY** |
| 5 | Ours-Q8-S0-AttnSparse  | ✅ q8_s0_pareto2.bit | ✅ q8_s0_pareto2.hwh | ✅ 3 files | ✅ | **READY** |

### Deploy immediately:
```bash
# Q16 S0
scp pynq_packages/q16_s0_attn_sparse/* xilinx@192.168.2.99:/home/xilinx/jupyter_notebooks/sy1/imgds_sparse_q16_s0/
ssh xilinx@192.168.2.99 "cd /home/xilinx/jupyter_notebooks/sy1/imgds_sparse_q16_s0 && sudo /usr/local/share/pynq-venv/bin/python3 run_q16_s0_attn_sparse_pynq_full_test.py 2>&1 | tee q16_s0_attn_sparse_pynq_log.txt"

# Q8 S0
scp pynq_packages/q8_s0_attn_sparse/* xilinx@192.168.2.99:/home/xilinx/jupyter_notebooks/sy1/imgds_sparse_q8_s0/
ssh xilinx@192.168.2.99 "cd /home/xilinx/jupyter_notebooks/sy1/imgds_sparse_q8_s0 && sudo /usr/local/share/pynq-venv/bin/python3 run_q8_s0_attn_sparse_pynq_full_test.py 2>&1 | tee q8_s0_attn_sparse_pynq_log.txt"
```

---

## Tier 2: NEEDS VIVADO BITSTREAM (HLS done, no Vivado yet)

| # | Config | HLS CSIM | HLS CSYNTH LUT | Vivado | PYNQ Script | NPZ |
|---|--------|----------|----------------|--------|-------------|-----|
| 2 | Ours-Q16-S10-AttnSparse | ✅ PASS | 25,700 | ❌ | ✅ | ✅ |
| 3 | Ours-Q16-S20-AttnSparse | ✅ PASS | 25,700 | ❌ | ✅ | ✅ |
| 4 | Ours-Q16-S30-AttnSparse | ✅ PASS | 25,700 | ❌ | ✅ | ✅ |
| 6 | Ours-Q8-S30-AttnSparse  | ❌ NOT RUN | ❌ | ❌ | ✅ | ✅ |

### Vivado build plan:
For each config:
1. `vitis_hls -f run_hls.tcl` (CSIM + CSYNTH + export IP)
2. Vivado: create block design, add HLS IP, synthesize, implement, write bitstream
3. Copy bit + hwh to pynq_packages/<config>/

---

## Tier 3: KNOWN LIMITATIONS

1. **NPZ reference logits**: S10/S20/S30 use dense (S0) reference logits.
   - Primary metric: HW accuracy vs TRUE LABELS (unaffected)
   - Match rate metric: indicates sparse-HW-to-dense-SW consistency (~99%)
   - We note this clearly in the paper

2. **HLS LUT is flat**: Previous CSYNTH shows LUT=25,700 for ALL sparsity levels.
   - Expected Vivado LUT: ~14,000-14,200 for all (same as dense)
   - Sparse attention does not reduce FPGA resource in this architecture

3. **Q8 S30**: Q8 sparse HLS not yet verified (new code). Needs CSIM+CSYNTH first.

---

## Speedup vs ViT4Mal Reference

| Config | Expected PYNQ Latency | ViT4Mal Fastest (810ms) | Speedup |
|--------|----------------------|------------------------|---------|
| Q16 S0 | ~926 us | 810,000 us | ~875x |
| Q16 S10 | ~776 us (HLS est) | 810,000 us | ~1043x |
| Q16 S20 | ~764 us (HLS est) | 810,000 us | ~1060x |
| Q16 S30 | ~738 us (HLS est) | 810,000 us | ~1098x |
| Q8 S0 | ~758 us (HLS est) | 810,000 us | ~1069x |
| Q8 S30 | TBD | 810,000 us | TBD |

Note: HLS estimated latencies are typically 2-4x lower than PYNQ measured (as seen with Q16 dense: HLS est 756us vs PYNQ measured 926us).
