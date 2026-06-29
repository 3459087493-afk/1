# Innovation 1: CSG-HALT

Calibration-guided Sparse Linear Attention Hardware Generation for UNSW-NB15 binary
anomaly detection (`0=normal`, `1=anomaly/attack`).

This experiment transfers ViT4Mal's resource-constrained edge deployment methodology,
not its image model. The optimized object is the softmax-free Linear Attention kernel.
The trained model architecture, input/output shapes, and weight dimensions remain fixed.

Current scope implements Stage 0 through Stage 4 only:

1. Immutable float-baseline snapshot.
2. Float HLS bottleneck profiling and PS/PL partition plan.
3. Dynamic-threshold spike-gate calibration in PyTorch.
4. Calibration-guided static Q/K active-channel selection.

Sparse HLS generation, mixed fixed-point specialization, feature-map approximation,
resource-aware scheduling, CSIM, CSYNTH, Vivado, and PYNQ are intentionally deferred until
Stage 4 demonstrates acceptable F1 and prediction agreement.

## Stage 5-8 Preparation Status

Stage 5 source inspection and generation preparation are now implemented:

- Copied HLS source inspection reports `safe_to_generate_variants=true`.
- Four isolated variants are generated under `hls_variants/`.
- Variant-specific `(256, 2)` PyTorch reference logits are generated.
- `v03` uses a three-segment PWL approximation instead of `exp`; on the calibration samples
  its prediction match is `0.996094` and F1 delta is `+0.001651` versus original PyTorch.
- Standalone CSIM, CSYNTH, candidate selection, and integrity scripts are ready but have not
  been executed in this preparation step.

No CSIM, CSYNTH, export IP, Vivado, or board result is claimed at this stage.
