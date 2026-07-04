# Q16-S0 ap_fixed<16,6> HLS Baseline

## Build
```bash
cd q16_s0/hls
vitis_hls -f run_hls.tcl
```

## Architecture
- ap_fixed<16,6> data, ap_fixed<24,10> accumulators
- 1 encoder layer, Linear Attention (kernelized)
- d_model=16, dim_feedforward=32
- PYNQ-Z2 target (xc7z020clg400-1)
- 10ns clock period

## Results
See `solution1/sim/report/` for CSIM results.
See `solution1/syn/report/` for CSYNTH results.
