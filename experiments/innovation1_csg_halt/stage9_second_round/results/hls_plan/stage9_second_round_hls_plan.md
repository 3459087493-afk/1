# Stage 9 Second-Round HLS Plan

## PyTorch Gate Decision

- `active_75`: pass=False, prediction_match=0.987550, F1_delta=+0.004965
- `active_62p5`: pass=False, prediction_match=0.979765, F1_delta=+0.007225
- `active_50`: pass=False, prediction_match=0.966416, F1_delta=+0.010364

- Recommended active ratio: `None`
- Selected channels: `None`
- Decision: **Do not generate second-round HLS: no more aggressive primary ratio passed.**

This script generates a plan only. It does not create HLS, run CSIM/CSYNTH, invoke Vivado,
export IP, or access a board.

## Compile-Time Compact Attention

The second round must not implement runtime `ACTIVE_IDX` selection inside arithmetic loops.
Generate variant-specific source arrays and fixed loop bounds at code-generation time:

```cpp
phi_q_active[ACTIVE_DIM]
phi_k_active[ACTIVE_DIM]
sum_k_active[ACTIVE_DIM]
```

Numerator and denominator loops iterate only over `ACTIVE_DIM`. Channel mapping should be
resolved by generation, so no per-iteration index mux is needed.

## Projection Scope

Q/K projection pruning is safe only when generated compact weights preserve each selected
output channel and its original input dimension. V and output dimensions remain full. The
first second-round version should retain dense Q/K projections if compact weight export has
not been independently verified; in that case, prune only after feature mapping in K^T V,
key sum, numerator, denominator, and attention accumulation. This isolates correctness risk.

## Fixed-Point Redesign

1. Avoid float/ap_fixed mixing inside all inner loops.
2. Convert selected weights to fixed constants before synthesis.
3. Keep feature maps, products, and accumulators consistently fixed internally.
4. Keep top-function input/output float and convert only at those boundaries.
5. Evaluate lower data/product/accumulator widths than 16/18/24.
6. Every width configuration must pass variant-specific CSIM before CSYNTH.

## Resource-Aware Scheduling

- Do not maximize unroll or blindly partition arrays.
- Treat DSP <= 220 and LUT <= 53200 as hard constraints.
- Limit multiplier allocation explicitly and inspect whether operators are actually shared.
- Pipeline only where the resource increase is justified by measured latency.
- Keep estimated clock <= 10 ns.

## Conditional Variant Set

No second-round HLS variant is authorized by the current official-test gate.

If a future calibrated ratio passes the same software gate, generate a minimal sequence such as:

- `v10_static_sparse_75_compact_float`
- `v11_static_sparse_62p5_compact_float`
- `v12_sparse_75_compact_resource_scheduled`
- `v13_sparse_75_compact_fixed_lowbit`
- `v14_full_csg_halt_v2`

Names must be adjusted to the actual passing ratio. Non-passing ratios must not receive HLS
variants. Each step isolates one change so compact sparsity, scheduling, low-bit fixed point,
and the full method can be attributed separately.
