# Vivado PARETO2 AXI Build Summary

**Date:** 2026-07-01
**Part:** xc7z020clg400-1
**Board:** tul.com.tw:pynq-z2:part0:1.0
**HLS IP:** xilinx.com:hls:imgds_linear_dense_q16:1.0
**Block Design:** imgds_linear_dense_q16_pareto2_design
**IP Instance:** imgds_linear_dense_q16_0

---

## Build Status ✅

| Step | Status |
|------|--------|
| Create Project | ✅ |
| Block Design + Validation | ✅ |
| Synthesis | ✅ |
| Implementation | ✅ |
| Write Bitstream | ✅ **write_bitstream Complete!** |

---

## Resource Utilization (Vivado Placed)

| Resource | Vivado Actual | HLS Estimate | PYNQ-Z2 Limit | Utilization | Fit? |
|----------|--------------|-------------|---------------|-------------|------|
| Slice LUTs | 14,004 | 25,402 | 53,200 | 26.32% | ✅ |
| Slice Registers (FF) | 12,903 | 11,458 | 106,400 | 12.13% | ✅ |
| DSP48E1 | 156 | 156 | 220 | 70.91% | ✅ |
| BRAM (RAMB18E1) | 15 | 13 | 280 | 5.36% | ✅ |

**Note:** Vivado actual LUT count (14,004) is lower than HLS estimate (25,402) because Vivado does logic optimization during synthesis + implementation, combining LUTs that HLS conservatively estimated separately. All resources well within PYNQ-Z2 limits.

---

## Timing Summary ✅

| Metric | Value |
|--------|-------|
| WNS (Worst Negative Slack) | +0.330 ns |
| WHS (Worst Hold Slack) | +0.022 ns |
| WPWS (Worst Pulse Width Slack) | +3.750 ns |
| Clock | clk_fpga_0 (100 MHz = 10 ns period) |
| **Timing** | **PASS — All user specified timing constraints are met** |

---

## HWH Interface Verification ✅

| Interface | Found in HWH? |
|-----------|--------------|
| imgds_linear_dense_q16 | ✅ YES (166 matches) |
| s_axi_control | ✅ YES |
| m_axi_gmem0 | ✅ YES |
| m_axi_gmem1 | ✅ YES |

Total AXI interface references in HWH: 311

---

## AXI Register Map (s_axi_control)

From `ximgds_linear_dense_q16_hw.h`:

| Offset | Register | Access | Description |
|--------|----------|--------|-------------|
| 0x00 | Control | R/W | bit0=ap_start, bit1=ap_done (RO), bit2=ap_idle (RO), bit3=ap_ready (RO), bit7=auto_restart |
| 0x04 | GIE | R/W | Global Interrupt Enable (bit0) |
| 0x08 | IER | R/W | IP Interrupt Enable (bit0=ap_done, bit1=ap_ready) |
| 0x0C | ISR | R/TOW | IP Interrupt Status (bit0=ap_done, bit1=ap_ready) |
| 0x10 | input_r (low) | R/W | Lower 32 bits of input buffer base address (m_axi_gmem0) |
| 0x14 | input_r (high) | R/W | Upper 32 bits of input buffer base address |
| 0x1C | logits (low) | R/W | Lower 32 bits of logits buffer base address (m_axi_gmem1) |
| 0x20 | logits (high) | R/W | Upper 32 bits of logits buffer base address |

**s_axi_control base address:** 0x4000_0000 (64K range, assigned by Vivado)

---

## Block Design Architecture

```
ZYNQ7 PS (processing_system7_0)
  ├── FCLK_CLK0 (100 MHz) ──────┬── HLS IP ap_clk
  │                              ├── AXI Interconnect (s_axi)
  │                              └── AXI Interconnect (m_axi mem)
  ├── M_AXI_GP0 ──── AXI Interconnect ──── imgds_linear_dense_q16_0 / s_axi_control
  └── S_AXI_HP0 ──── AXI Interconnect (2S:1M) ──┬── imgds_linear_dense_q16_0 / m_axi_gmem0
                                                  └── imgds_linear_dense_q16_0 / m_axi_gmem1
  proc_sys_reset (rst_ps7_0_100M)
    └── peripheral_aresetn ──── ip_rst_n for HLS IP + AXI Interconnects
  
  interrupt: left floating (PYNQ driver polls Control register bit 1)
```

---

## Files Generated

| File | Size | Path |
|------|------|------|
| pareto2.bit | 3.9 MB | `final_paper_experiments/pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/pareto2.bit` |
| pareto2.hwh | 263 KB | `final_paper_experiments/pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/pareto2.hwh` |
| Build log | ~190 KB | `vivado/pareto2_axi_pynq_z2/vivado_pareto2_axi_build.log` |

---

## ⚠️ Critical Notes

1. **PYNQ measured latency is still PENDING_BOARD.** The bitstream and HWH are ready for on-board testing.
2. **HLS estimated latency (756.27 μs @100MHz) is NOT PYNQ measured latency.**
3. **Speedup vs ViT4Mal must be computed as: `810000 / measured_total_runtime_us` after PYNQ-Z2 measurement.**
4. **Do not claim final speedup before running `run_pareto2_pynq_test.py` on actual PYNQ-Z2 hardware.**
5. **Interrupt is unused.** PYNQ driver should poll `Control` register bit 1 (ap_done) for completion.
6. **DDR DQS skew warnings** are from the PYNQ-Z2 board preset and are expected (PS manages DDR, not our IP).

---

## Next Steps

1. Copy the PYNQ test package to PYNQ-Z2:
   ```bash
   scp -r /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/final_paper_experiments/pynq_package/PARETO2_PYNQ_Z2_TEST_PACKAGE/. xilinx@192.168.2.99:/home/xilinx/
   ```
2. SSH into PYNQ-Z2 and run:
   ```bash
   ssh xilinx@192.168.2.99
   cd /home/xilinx/PARETO2_PYNQ_Z2_TEST_PACKAGE
   sudo python3 run_pareto2_pynq_test.py
   ```
3. Copy results back and update Tables 3 and 4 with measured values.

---

*Vivado build completed 2026-07-01. PYNQ measured latency still pending.*
