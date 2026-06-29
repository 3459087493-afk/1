# CSG-HALT Final Candidate Selection

- Selection status: **no_candidate_meets_all_constraints**
- Selected candidate: `None`
- Float baseline: The copied float reference remains above PYNQ-Z2 limits.
- Lowest aggregate resource usage: `v00_float_reference`
- Lowest latency: `v02_sparse_87p5_mixed_fixed`

## Measured Results

- `v00_float_reference`: latency=7869, BRAM=176, DSP=258, FF=71828, LUT=65546, resource_fit=False
- `v01_static_sparse_87p5_float`: latency=7784, BRAM=174, DSP=258, FF=71771, LUT=65992, resource_fit=False
- `v02_sparse_87p5_mixed_fixed`: latency=6948, BRAM=166, DSP=281, FF=78386, LUT=76567, resource_fit=False
- `v03_full_csg_halt`: latency=7059, BRAM=166, DSP=283, FF=78705, LUT=76988, resource_fit=False

## Incremental Effects

- `v00_float_reference` -> `v01_static_sparse_87p5_float`: latency -85, BRAM -2, DSP +0, FF -57, LUT +446.
- `v01_static_sparse_87p5_float` -> `v02_sparse_87p5_mixed_fixed`: latency -836, BRAM -8, DSP +23, FF +6615, LUT +10575.
- `v02_sparse_87p5_mixed_fixed` -> `v03_full_csg_halt`: latency +111, BRAM +0, DSP +2, FF +319, LUT +421.

## Interpretation

- `v00` is the copied float reference and cannot be deployed if it exceeds PYNQ-Z2 limits.
- `v01` isolates the hardware effect of active_87p5 static sparse Linear Attention.
- `v02` adds mixed fixed-point specialization. Its CSIM difference is fixed-point numerical
  error, with prediction flip count zero.
- `v03` is the full current CSG-HALT path: static sparse attention, mixed fixed-point,
  feature-map approximation, and resource-aware scheduling. Its prediction flip count is zero.
- `active_87p5` resource benefit is accepted only when its CSYNTH report shows an actual
  reduction; loop-bound source changes alone are not counted as a hardware result.
- v01 lowers latency, BRAM, and FF slightly, but leaves DSP unchanged and increases LUT. Thus
  active_87p5 alone is functionally valid but insufficient for PYNQ-Z2 resource fit.
- v02 has the lowest latency and lower BRAM, but current mixed fixed-point increases DSP, FF,
  and LUT substantially. It is not a resource reduction in this implementation.
- v03 increases latency, DSP, FF, and LUT relative to v02 while BRAM remains unchanged. The
  current full scheduling/PWL combination therefore does not improve hardware cost.

If no candidate meets every constraint, the next iteration should test `active_75` or
`active_62p5`, use more aggressive mixed fixed-point, simplify the feature-map approximation,
limit multiplier allocation, remove unnecessary array partitioning, and optimize numerator,
denominator, and output-projection loops. Export IP / Vivado is recommended only when
`recommended_for_export_ip` is true; neither step is run here.
