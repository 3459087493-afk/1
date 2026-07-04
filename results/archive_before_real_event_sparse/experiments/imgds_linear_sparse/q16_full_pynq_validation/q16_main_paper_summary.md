# Q16 Main / Ours-Dense-Q16 PYNQ-Z2 Result

| Item | Value |
|---|---:|
| Model name | Ours-Dense-Q16 |
| Code name | Q16 Main |
| d_model | 16 |
| ff_dim | 32 |
| Quantization | 16-bit ap_fixed<16,6> / int16 Q6.10 |
| Test samples | 3444 |
| Software / Ref Accuracy | 94.19% |
| PYNQ HW Accuracy | 94.13% |
| Prediction Match vs Ref | 99.25% |
| NaN samples | 0 |
| Inf samples | 0 |
| Max Abs Error vs Ref | 0.56076181 |
| Mean Abs Error vs Ref | 0.07329194 |
| Vivado LUT | 14004 |
| Vivado DSP | 156 |
| Vivado FF | 12903 |
| Vivado BRAM | 15 |
| 100-run Mean Latency | 931.7774 us |
| 1000-run Mean Latency | 926.3135 us |
| 1000-run P50 Latency | 923.6645 us |
| Throughput | 155.25 samples/s |
| Latency source | PYNQ-Z2 measured |

## Paper sentence

Ours-Dense-Q16 achieves 94.13% hardware accuracy on the full 3,444-sample IMG_DS test set, with 14,004 LUTs and an average PYNQ-Z2 kernel latency of 926.31 us over 1,000 runs.
