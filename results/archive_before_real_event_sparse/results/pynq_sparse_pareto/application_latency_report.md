# Application-level single-sample inference latency

## Measurement scope

The primary inference-speedup metric is application-level single-sample latency. Each timed inference includes in-memory sample extraction, host quantization, PYNQ input-buffer copy and flush, FPGA kernel start and completion wait, output invalidation/read, output dequantization, and argmax.

Overlay/bitstream loading, NPZ loading, buffer allocation, SSH/Jupyter startup, and the first 20 warm-up runs are excluded.

Kernel latency is reported only as a hardware-core performance measurement and is not used as the primary ViT4Mal speedup claim.

## Results

| Config | Application mean (us) | P50 (us) | P95 (us) | Kernel latency (us) | vs ViT4Mal 0.81 s | vs ViT4Mal 1.48 s | Throughput (samples/s) |
|---|---:|---:|---:|---:|---:|---:|---:|
| Q16-S0 | 2078.307 | 2058.052 | 2178.345 | 843.154 | 389.740x | 712.118x | 481.161 |
| Q16-S10 | 2088.052 | 2069.677 | 2171.707 | 954.773 | 387.921x | 708.795x | 478.915 |
| Q16-S20 | 2085.917 | 2068.551 | 2167.191 | 939.255 | 388.318x | 709.520x | 479.405 |
| Q16-S30 | 2059.450 | 2037.394 | 2169.063 | 829.252 | 393.309x | 718.639x | 485.567 |
| Q8-S0 | 2191.348 | 2072.858 | 2772.846 | 846.791 | 369.635x | 675.383x | 456.340 |
| Q8-S30 | 2103.805 | 2074.465 | 2169.080 | 933.540 | 385.017x | 703.487x | 475.329 |

## Interpretation

An application latency below 27 ms supports the statement: **over 30x speedup compared with ViT4Mal fastest 0.81 s configuration**.

An application latency below approximately 49.3 ms supports the statement: **over 30x speedup compared with ViT4Mal selected 1.48 s configuration**.

All six configurations are below 27 ms: **yes**.

All six configurations are below 49.3 ms: **yes**.

`total_runtime_us` and full correctness-test runtime are not used to calculate speedup.
