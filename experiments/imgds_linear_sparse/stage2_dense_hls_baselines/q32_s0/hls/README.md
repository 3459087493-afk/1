# Q32-S0 Float HLS Reference

## Build
```bash
cd q32_s0/hls
vitis_hls -f run_hls.tcl
```

## Architecture
- Float32 (no quantization)
- 1 encoder layer, Linear Attention (kernelized)
- d_model=16, dim_feedforward=32
- PYNQ-Z2 target (xc7z020clg400-1)
- 10ns clock period

## Results
See `solution1/sim/report/` for CSIM results.
