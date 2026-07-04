# ViT4Mal speedup calculation correction

The previous 0.04x / 0.07x values were incorrect because they divided ViT4Mal's single-sample FPGA inference latency by `total_runtime_us`, which is the aggregate runtime of the 3444-sample correctness test.

Correct formulas:

- `speedup_vs_ViT4Mal_fastest_0p81s = 810000.0 / ours_latency_us_1000runs`
- `speedup_vs_ViT4Mal_recommended_1p48s = 1480000.0 / ours_latency_us_1000runs`

ViT4Mal's 0.81 s and 1.48 s values are single-sample FPGA inference times. For a fair comparison, this report uses the per-sample PYNQ-measured mean kernel latency over 1000 runs.

| Config | PYNQ latency (us, 1000-run mean) | Speedup vs 0.81 s | Speedup vs 1.48 s |
|---|---:|---:|---:|
| Q16-S0 | 843.153900 | 960.678709x | 1755.314184x |
| Q16-S10 | 954.773148 | 848.369062x | 1550.106434x |
| Q16-S20 | 939.254582 | 862.385998x | 1575.717626x |
| Q16-S30 | 829.251900 | 976.784015x | 1784.741162x |
| Q8-S0 | 846.791000 | 956.552443x | 1747.774835x |
| Q8-S30 | 933.539608 | 867.665381x | 1585.363907x |

`total_runtime_us` (or `total_runtime_mean_us_correctness`) is retained only for full-dataset correctness-test runtime and throughput accounting. It is not used for speedup.
