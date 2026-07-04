# Table 4: CPU / GPU / FPGA Single-Sample Inference Latency
> Units: microseconds (μs). 1 ms = 1,000 μs.
| Model | Device | Latency Mean (μs) | Latency Std (μs) | N Runs | Source | Notes ||-------|--------|-------------------|-------------------|--------|--------|-------|| Ours-LinearTransformer-Dense | PyTorch-CPU | 284.4373 | 185.8501 | 10000 | DOCKER_MEASURED | PyTorch fp32 single-sample inference (model only, no data IO) || Ours-LinearTransformer-Dense | ONNXRuntime-CPU | 43.1636 | 11.9492 | 10000 | DOCKER_MEASURED | ONNX single-sample inference || Ours-LinearTransformer-Dense | GPU | N/A | N/A | N/A | N/A | GPU not available in Docker environment || Ours-Q16-S0-PARETO2 | FPGA-HLS-Estimated | 740.84 | N/A | 1 | HLS_ESTIMATED | 74,084 cycles / 100 MHz = 740.84 us (0.741 ms); NOT board-validated || Ours-Q16-S0-PARETO2 | FPGA-PYNQ-Z2 | PENDING_BOARD | PENDING_BOARD | PENDING_BOARD | PENDING_BOARD | Awaiting Vivado bitstream generation + PYNQ-Z2 on-board measurement || ViT4Mal-1enc2head-fastest | PYNQ-Z1 | 810000 | N/A | 1 | PYNQ_MEASURED | Published 0.81 s = 810,000 us; reference for speedup comparison || ViT4Mal-2enc4head-recommended | PYNQ-Z1 | 1480000 | N/A | 1 | PYNQ_MEASURED | Published 1.48 s = 1,480,000 us; reference |
## Speedup Estimates (for reference, NOT board-validated)
| Ours FPGA HLS est. vs Ours PyTorch CPU | 0.4× | ⚠️ FPGA is HLS estimate only |
| Ours FPGA HLS est. vs Ours ONNX CPU | 0.1× | ⚠️ FPGA is HLS estimate only |
| Ours FPGA HLS est. vs ViT4Mal fastest (0.81 s) | 1093× | ⚠️ HLS estimate, NOT board-validated |
| Ours FPGA HLS est. vs ViT4Mal recommended (1.48 s) | 1998× | ⚠️ HLS estimate, NOT board-validated |
| Ours FPGA PYNQ vs ViT4Mal fastest | PENDING_BOARD | Awaiting PYNQ deployment |

## Critical Warnings
1. ⚠️ **Do not cite HLS estimated latency as FPGA measured latency.**
2. ⚠️ The 1,093× speedup vs ViT4Mal is an HLS estimate — must be validated on PYNQ-Z2.
3. ⚠️ CPU benchmarks are single-sample model-only inference; real end-to-end includes data loading.
4. ⚠️ Units are microseconds (μs). ViT4Mal is 810,000 μs (810 ms). Ours HLS est. is 740.84 μs (0.741 ms).
