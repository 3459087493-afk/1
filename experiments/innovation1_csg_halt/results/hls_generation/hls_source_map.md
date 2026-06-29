# HLS Linear Attention Source Map

- Baseline copy: `/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/innovation1_csg_halt/copied_baseline/unsw_linear_transformer_hls_float_copy`
- Top function: `unsw_linear_transformer`
- Input shape: `[8, 24]`
- Output shape: `[2]`
- Sequence length: `8`
- Block/input dimension: `24`
- Attention dimension: `16`
- Planned active dimension: `14`
- Safe to generate variants: **true**

## Located Operations

| Operation | Actual source location |
|---|---|
| Q projection | lines 83-100 |
| K projection | lines 84-101 |
| V projection | lines 85-102 |
| ELU+1 feature map | lines 6-8 |
| K^T V accumulation | lines 106-113 |
| denominator | lines 128-133 |
| numerator | lines 136-141 |
| output projection | lines 145-155 |
| classifier | lines 211-216 |

## v01 Safe Scope

The compact dimension may replace the `key_feature`/feature reductions in `key_value`,
`key_sum`, denominator, and numerator. Q/K/V projections remain 16-dimensional in v01,
as do V, attention output, residual, normalization, feed-forward, and classifier paths.

Q and K have different selected index sets. The generated compact loop therefore uses the
K index list as its physical dimension and sets compact Q entries to zero when that same
channel is absent from the Q set. It must not pair unrelated Q and K indices by list position.

## Risk Notes

- Static sparse arithmetic must match independent Q/K masks from Stage 4.
- Projection pruning is deferred because it changes weight addressing and is not required
  to demonstrate sparse attention accumulation.
- Mixed fixed-point and feature-map approximation require variant-specific reference logits.
- HLS resource improvement is unknown until CSIM PASS variants complete CSYNTH.
- Missing required markers: `[]`
