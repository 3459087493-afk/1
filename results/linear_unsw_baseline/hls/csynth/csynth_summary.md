# UNSW-NB15 Linear Transformer HLS CSYNTH Summary

- HLS project: `/home/cym/prj2/finn/notebooks/icl_thesis-master/vitis_hls/unsw_linear_transformer_hls`
- Top function: `unsw_linear_transformer`
- Task: binary anomaly detection (`0=normal`, `1=anomaly/attack`)
- Input shape: `[8, 24]`
- Output shape: `[2]`
- CSIM passed: `True`
- csynth executed: `True`
- csynth successful: `True`
- Target part: `xc7z020-clg400-1`
- Target clock period: `10.0` ns
- Estimated clock period: `8.567` ns
- Latency min/max: `7869` / `7869` cycles
- Interval min/max: `7870` / `7870` cycles
- Timing violation: `False`
- Resource over limit: `True`
- DSP or LUT over 80%: `True`

## PYNQ-Z2 Resource Assessment

| Resource | Used | Capacity | Utilization |
|---|---:|---:|---:|
| BRAM_18K | 176 | 280 | 62.857% |
| DSP48E | 258 | 220 | 117.273% |
| FF | 71828 | 106400 | 67.508% |
| LUT | 65546 | 53200 | 123.207% |

## Decision

- Can continue to export IP / Vivado: `False`
- Recommendation: Stop: the float design exceeds PYNQ-Z2 resources. Convert to ap_fixed and/or optimize the structure before board accuracy testing.

## Board-Accuracy Roadmap

The current float design must not proceed directly to board accuracy testing.
First apply `ap_fixed` quantization and/or structural optimization, repeat CSIM and csynth,
and only continue when PYNQ-Z2 resource and timing checks pass. Board accuracy, precision,
recall, F1, and confusion matrix would not be meaningful before a deployable design exists.

After an optimized design passes resource and timing checks, board validation should use:

1. 16 samples to verify FPGA logits and predictions against HLS CSIM and PyTorch.
2. 256 samples to calculate initial binary anomaly-detection accuracy, precision, recall,
   F1, and confusion matrix from `sample_inputs.npy` and `sample_labels.npy`.
3. The full UNSW-NB15 test set only after correctness and throughput are acceptable.

