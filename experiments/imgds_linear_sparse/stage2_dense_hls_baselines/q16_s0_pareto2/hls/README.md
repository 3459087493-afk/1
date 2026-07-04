# Q16-S0-PARETO2 — DSP-shared Hardware Baseline

## Design Philosophy
ViT4Mal-style hardware reuse: **few DSPs, many iterations, shared multiplication.**
- Serial loops with PIPELINE II=1 on innermost accumulate loops
- ALLOCATION limits DSP/mul instances for each function
- No UNROLL on matrix multiply loops
- Minimal ARRAY_PARTITION
- Direct flat-weight access

## Build
```bash
cd q16_s0_pareto2/hls
vitis_hls -f run_hls.tcl
```

## Target
PYNQ-Z2: DSP<220, LUT<53200, FF<106400, BRAM<280, latency<27ms
