# Q16-S0-PARETO1 — ViT4Mal-style Hardware Baseline

## Design Philosophy

Mimics ViT4Mal's FPGA deployment approach:
- **Bounded parallelism** — cyclic array partitioning (factor=4), not complete unroll
- **Loop pipelining** — II=1 where possible, II=2 only when necessary
- **Direct weight access** — reads from flattened weight arrays, no local 2D copies
- **Pareto trade-off** — targets PYNQ-Z2 fit while keeping latency well below ViT4Mal

## Key Differences from q16_s0 naive

| Aspect           | q16_s0 naive              | q16_s0_pareto1              |
|------------------|---------------------------|------------------------------|
| Array partition  | `complete dim=2`          | `cyclic factor=4 dim=2`     |
| Inner unroll     | `UNROLL` (complete)       | `UNROLL factor=4`           |
| Outer loops      | `UNROLL` (complete)       | `PIPELINE II=1` or `II=2`   |
| Weight access    | local 2D matrix copy      | direct flat-array indexing  |
| Target           | maximum speed             | PYNQ-Z2 resource fit        |

## Build

```bash
cd q16_s0_pareto1/hls
vitis_hls -f run_hls.tcl
```

## Target Platform

- Device: xc7z020clg400-1 (PYNQ-Z2)
- Clock: 10 ns (100 MHz nominal)

## Resource Targets

| Resource | PYNQ-Z2 Limit | Target     |
|----------|---------------|------------|
| DSP      | 220           | < 220      |
| LUT      | 53,200        | < 53,200   |
| FF       | 106,400       | < 106,400  |
| BRAM     | 280           | < 280      |

## Latency Target

Board inference < 27 ms to beat ViT4Mal fastest 0.81 s by ~30×.
