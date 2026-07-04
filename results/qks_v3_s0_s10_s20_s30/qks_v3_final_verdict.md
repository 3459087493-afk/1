# QKS-v3 S0/S10/S20/S30 final verdict

## Final status

**final_status: FAILED_ACCURACY_DROP_TOO_LARGE**

This experiment is stopped after Phase 1. It is not eligible for HLS, Vivado, PYNQ, or inclusion in the thesis main results.

## Gate results

| Config | Active tokens | ATTN_DIM | Accuracy | Drop vs S0 | Full-app proxy mean (ms) | Median (ms) |
|---|---:|---:|---:|---:|---:|---:|
| Q16-QKSv3-S0 | 16 | 16 | 94.1928% | 0.0000 pp | 1.337186 | 1.289787 |
| Q16-QKSv3-S10 | 14 | 14 | 93.5830% | 0.6098 pp | 1.338824 | 1.290966 |
| Q16-QKSv3-S20 | 13 | 13 | 93.3508% | 0.8420 pp | 1.337787 | 1.291082 |
| Q16-QKSv3-S30 | 11 | 11 | 85.2787% | 8.9141 pp | 1.337996 | 1.290500 |

- `is_mask_based = false` for every configuration.
- `is_true_token_compaction = true` for every configuration.
- Compact tensors have shapes `[3444,16,64]`, `[3444,14,64]`, `[3444,13,64]`, and `[3444,11,64]`; inactive rows are not retained or zeroed.
- S10 and S20 remain within the 1 percentage-point accuracy gate; S30 does not.
- Full-application proxy mean is not strictly monotonic.
- Full-application proxy median is not strictly monotonic.

The primary failure code is the accuracy failure because the permitted final-status enumeration has no combined “accuracy and software monotonicity” state. Independently, the software monotonicity gate also failed, so Phase 2 would remain prohibited even if accuracy were ignored.

## Measurement integrity

All 3444 IMG_DS test samples were processed in their existing order. Each configuration has 30 timing repeats, producing 413,280 per-sample/config/repeat records plus the CSV header. No sample, repeat, outlier, or unfavorable configuration was removed.

Raw-patch L1 importance was computed over all 16 tokens. Top-K indices were selected and then sorted into original positional order; the model used the matching positional embeddings. Q/K channels were independently physically selected according to the existing QKS-v2 L1 ranking. This is genuine software compaction, not dense execution followed by masking.

Image decode, resize, normalization and construction of the original 16 patches occur before token selection and are invariant across configurations. They were measured once for every sample/repeat and shared across configurations as a common-random-numbers software proxy. Configuration-dependent token selection, compact tensor generation and quantization were measured separately. This is not a PYNQ measurement.

The fixed image pipeline dominates the proxy. Meanwhile Top-K selection/compaction overhead does not decrease proportionally with K, so reducing the compact payload from 16 to 11 tokens is insufficient to force total software time to decrease monotonically.

## Required stop

No QKS-v3 HLS directories were generated, and csim/csynth were not run. Vivado and PYNQ were not run. Per the predefined gate, this method must not enter the paper main results.

No alternative sparsity values, sample filtering, timing-boundary substitution, or post-hoc method changes are proposed here.
