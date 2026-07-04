# Pending PYNQ Runs — QKS-v2 Physically Pruned Configs

**Date:** 2026-07-03
**Status:** ⏳ PENDING — board not connected. All bits/hwhs ready.

---

## Bit/HWH Paths

| Config | Bitstream | HWH | Size |
|--------|-----------|-----|------|
| Q16-QKSv2-D16 | `hls_projects/q16_qksv2_d16/vivado/q16_qksv2_d16.bit` | `.../q16_qksv2_d16.hwh` | 3.9M / 261K |
| Q16-QKSv2-D14 | `hls_projects/q16_qksv2_d14/vivado/q16_qksv2_d14.bit` | `.../q16_qksv2_d14.hwh` | 3.9M / 261K |
| Q16-QKSv2-D13 | `hls_projects/q16_qksv2_d13/vivado/q16_qksv2_d13.bit` | `.../q16_qksv2_d13.hwh` | 3.9M / 261K |
| Q16-QKSv2-D11 | `hls_projects/q16_qksv2_d11/vivado/q16_qksv2_d11.bit` | `.../q16_qksv2_d11.hwh` | 3.9M / 261K |

Full base: `experiments/imgds_linear_sparse/final_paper_experiments/experiment1_qks_v2_physical_prune/hls_projects/`

---

## PYNQ Deployment Steps (per config)

### 1. Q16-QKSv2-D11 (highest priority — best results)

```
scp hls_projects/q16_qksv2_d11/vivado/q16_qksv2_d11.bit \
    hls_projects/q16_qksv2_d11/vivado/q16_qksv2_d11.hwh \
    xilinx@192.168.2.99:/home/xilinx/jupyter_notebooks/sy1/qks_v2_d11/

ssh xilinx@192.168.2.99
cd /home/xilinx/jupyter_notebooks/sy1/qks_v2_d11
sudo /usr/local/share/pynq-venv/bin/python3 run_qks_v2_pynq_test.py 2>&1 | tee qks_v2_d11_pynq_log.txt
```

Output targets:
- `results/pynq_sparse_pareto_v2/q16_qksv2_d11/qks_v2_d11_pynq_result.csv`
- `results/pynq_sparse_pareto_v2/q16_qksv2_d11/qks_v2_d11_e2e_latency.csv`

### 2. Q16-QKSv2-D13

```
scp hls_projects/q16_qksv2_d13/vivado/q16_qksv2_d13.bit \
    hls_projects/q16_qksv2_d13/vivado/q16_qksv2_d13.hwh \
    xilinx@192.168.2.99:/home/xilinx/jupyter_notebooks/sy1/qks_v2_d13/
```

Output: `results/pynq_sparse_pareto_v2/q16_qksv2_d13/`

### 3. Q16-QKSv2-D14

```
scp hls_projects/q16_qksv2_d14/vivado/q16_qksv2_d14.bit \
    hls_projects/q16_qksv2_d14/vivado/q16_qksv2_d14.hwh \
    xilinx@192.168.2.99:/home/xilinx/jupyter_notebooks/sy1/qks_v2_d14/
```

Output: `results/pynq_sparse_pareto_v2/q16_qksv2_d14/`

### 4. Q16-QKSv2-D16 (baseline)

```
scp hls_projects/q16_qksv2_d16/vivado/q16_qksv2_d16.bit \
    hls_projects/q16_qksv2_d16/vivado/q16_qksv2_d16.hwh \
    xilinx@192.168.2.99:/home/xilinx/jupyter_notebooks/sy1/qks_v2_d16/
```

Output: `results/pynq_sparse_pareto_v2/q16_qksv2_d16/`

---

## IMG_DS Test Data Path

`data/IMG_DS/images/` — 3,444 JPEG test images

Software reference NPZ: `experiments/imgds_linear_sparse/q16_full_pynq_validation/q16_main_test_3444.npz` (X, y, ref_logits)

---

## Per-Config PYNQ Result Schema

Each config must output:

### PYNQ result CSV (per-sample)
```
config,accuracy,precision,recall,f1,prediction_match_rate_vs_sw,max_abs_error,mean_abs_error,nan_samples,inf_samples,kernel_latency_us_1000runs
```

### E2E latency CSV (per-image)
```
metric,value
model_id,Q16-QKSv2-D{attn_dim}
quant_bits,16
nominal_sparsity,{0/10/20/30}%
actual_sparsity,{0/12.5/18.75/31.25}%
n_test_images,3444
n_warmup,20
accuracy,{from pynq_result}
f1,{from pynq_result}
warm_e2e_mean_us,{measured}
warm_e2e_p50_us,{measured}
warm_e2e_p95_us,{measured}
warm_e2e_p99_us,{measured}
cold_start_latency_us,{measured}
kernel_latency_us_1000runs,{measured}
throughput_samples_per_sec,{calculated}
speedup_vs_vit4mal_fastest,{calculated}
meets_30x_target,{warm_e2e_mean < 27000}
```

---

## Expected Results (from csynth + Vivado)

| Config | LUT | DSP | FF | BRAM | HLS Latency | Est. Kernel (µs) |
|--------|-----|-----|-----|------|-------------|-------------------|
| Q16-QKSv2-D16 | 13,322 | 147 | 12,733 | 15 | 90,650 | ~907 |
| Q16-QKSv2-D14 | 13,344 | 147 | 12,735 | 15 | 86,812 | ~868 |
| Q16-QKSv2-D13 | 13,349 | 148 | 12,779 | 15 | 84,874 | ~849 |
| Q16-QKSv2-D11 | 13,347 | 148 | 12,779 | 15 | 81,022 | ~810 |

---

## Board Connection Checklist

- [ ] PYNQ-Z2 powered on and Ethernet connected
- [ ] SSH accessible at 192.168.2.99
- [ ] `/home/xilinx/jupyter_notebooks/sy1/` directory exists
- [ ] IMG_DS images accessible at board path
- [ ] `sudo /usr/local/share/pynq-venv/bin/python3` works
- [ ] Scp all 4 bit/hwh pairs + test script

---

*Board not connected. No PYNQ latency yet. All bit/hwh files ready.*
