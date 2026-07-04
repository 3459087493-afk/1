# Resource Completion Report — PYNQ Sparse Pareto

**Generated:** 2026-07-02
**Purpose:** Fill TBD Vivado resource data for Q16-S10, Q16-S20, Q16-S30, Q8-S30

---

## 1. Why Were Resources TBD?

PYNQ 上板脚本 (`run_*_pynq_full_test.py`) 只测量 **accuracy / latency / error**，不解析 Vivado utilization report。Bitstream 是通过 `build_all_sparse_configs.py` 生成的 Vivado 项目 build 出的，但 utilization 数据从未被写回 CSV。**Bit/HWH 存在且 PYNQ 上板成功，但资源列一直标记为 TBD。**

---

## 2. Resource Source

所有 6 个配置的资源数据均来自 **Vivado 2022.2 implementation (placed) utilization report**：

```
<vivado_project_dir>/<project>.runs/impl_1/<design>_wrapper_utilization_placed.rpt
```

状态：`resource_source = vivado_implementation`

所有设计 routing 完成，0 routing errors，timing 全部通过。

---

## 3. How Resources Were Recovered

**步骤：**
1. 确认 4 个 TBD 配置的 Vivado 项目存在于：
   `experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board/hls_projects/<config>_attn_sparse/vivado/`
2. 在 `impl_1/` 中找到 `*_utilization_placed.rpt`
3. 从报告中提取 Slice LUTs、DSPs、Slice Registers、Block RAM Tile 数据
4. 在 `*_timing_summary_routed.rpt` 中确认 timing closure

**未进行的操作：** 没有重新跑 Vivado，没有重新跑 PYNQ，没有改动 accuracy/latency。

---

## 4. Final Resource Table (All 6 Configs)

| Config | Quant | Sparsity | LUT | DSP | FF | BRAM_18K | WNS | Timing |
|--------|-------|----------|-----|-----|-----|----------|-----|--------|
| Q16-S0 | 16bit | 0% | 14,004 | 156 | 12,903 | 15 | +0.330 | PASS |
| Q16-S10 | 16bit | 12.5% | 14,035 | 156 | 12,945 | 15 | +0.389 | PASS |
| Q16-S20 | 16bit | 18.75% | 14,041 | 156 | 12,945 | 15 | +0.421 | PASS |
| Q16-S30 | 16bit | 31.25% | 14,044 | 156 | 12,945 | 15 | +0.370 | PASS |
| Q8-S0 | 8bit | 0% | 14,019 | 124 | 13,373 | 15 | +0.330 | PASS |
| Q8-S30 | 8bit | 31.25% | 14,031 | 124 | 13,395 | 15 | +0.539 | PASS |

**PYNQ-Z2 Limits:** LUT=53,200 | DSP=220 | FF=106,400 | BRAM=280

---

## 5. PYNQ-Z2 Fit Check

| Config | LUT (26-27%) | DSP (56-71%) | FF (12-13%) | BRAM (5%) | Overall |
|--------|:--:|:--:|:--:|:--:|:--:|
| Q16-S0 | ✅ | ✅ | ✅ | ✅ | ✅ **FITS** |
| Q16-S10 | ✅ | ✅ | ✅ | ✅ | ✅ **FITS** |
| Q16-S20 | ✅ | ✅ | ✅ | ✅ | ✅ **FITS** |
| Q16-S30 | ✅ | ✅ | ✅ | ✅ | ✅ **FITS** |
| Q8-S0 | ✅ | ✅ | ✅ | ✅ | ✅ **FITS** |
| Q8-S30 | ✅ | ✅ | ✅ | ✅ | ✅ **FITS** |

**All 6 configurations fit PYNQ-Z2 with positive timing slack.**

---

## 6. Key Observations

1. **Sparsity has negligible impact on FPGA resources.** Q16-S0→S30: LUT varies only 14,004→14,044 (-). This is expected because the HLS IP uses DSP-shared sequential MACs — channel count reduction just skips loop iterations within the same datapath, not removing physical multipliers.

2. **Q8 saves DSP but not LUT.** Q8 uses ap_fixed<8,4> = 124 DSP vs 156 for Q16 (ap_fixed<16,6>). LUT and FF are nearly identical because the control/datapath logic is the same regardless of bitwidth.

3. **BRAM is constant at 15 BRAM_18K (7.5 tiles)** across all configs — weight storage dominates, and weights share the same dimensions.

4. **Timing margin is healthy** for all configs (WNS +0.330 to +0.539 ns), well above the 0 ns threshold.

---

## 7. Files Updated

| File | Action |
|------|--------|
| `results/pynq_sparse_pareto/final_pynq_sparse_pareto_summary.csv` | ✅ TBD replaced with actual values, added `wns_ns`, `timing_status`, `resource_source` columns |
| `results/pynq_sparse_pareto/q16_s10_attn_sparse/vivado_resource.csv` | ✅ Created |
| `results/pynq_sparse_pareto/q16_s20_attn_sparse/vivado_resource.csv` | ✅ Created |
| `results/pynq_sparse_pareto/q16_s30_attn_sparse/vivado_resource.csv` | ✅ Created |
| `results/pynq_sparse_pareto/q8_s30_attn_sparse/vivado_resource.csv` | ✅ Created |
| `results/pynq_sparse_pareto/q16_s0_attn_sparse/vivado_resource.csv` | ✅ Created (reference completeness) |
| `results/pynq_sparse_pareto/q8_s0_attn_sparse/vivado_resource.csv` | ✅ Created (reference completeness) |

---

## 8. No Actions Needed

- ❌ No Vivado re-run required (all impl_1 reports exist)
- ❌ No PYNQ re-run required (accuracy/latency unchanged)
- ❌ No data fabricated (all extracted from Vivado placed reports)

---

## 9. Updated Pareto Data for Paper Figures

### Accuracy vs LUT (图四)

| Config | LUT | Accuracy | F1 |
|--------|-----|----------|-----|
| Q16-S0 | 14,004 | 94.13% | 96.53% |
| Q16-S10 | 14,035 | 94.11% | 96.61% |
| Q16-S20 | 14,041 | 94.22% | 96.61% |
| Q16-S30 | 14,044 | 94.13% | 96.53% |
| Q8-S0 | 14,019 | 90.97% | 94.50% |
| Q8-S30 | 14,031 | 91.35% | 94.91% |

### Accuracy vs Latency (图五)

| Config | App Latency (µs) | Accuracy | Throughput (samples/s) |
|--------|-----------------|----------|------------------------|
| Q16-S0 | 2,078 | 94.13% | 481 |
| Q16-S10 | 2,088 | 94.11% | 479 |
| Q16-S20 | 2,086 | 94.22% | 479 |
| Q16-S30 | 2,059 | 94.13% | 486 |
| Q8-S0 | 2,191 | 90.97% | 456 |
| Q8-S30 | 2,104 | 91.35% | 475 |

---

*Report generated from Vivado 2022.2 impl_1 placed utilization reports. No Vivado or PYNQ re-runs needed.*
