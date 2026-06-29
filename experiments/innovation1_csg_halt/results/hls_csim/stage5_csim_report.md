# Stage 5 HLS CSIM Report

## 1. Goal

This stage validates C simulation functional correctness for four CSG-HALT HLS variants.
It does not run synthesis, C/RTL cosimulation, Vivado, export IP, or board deployment.

## 2. Variants

- `v00_float_reference`: copied full-dimensional float reference.
- `v01_static_sparse_87p5_float`: float implementation with a real 14-channel attention reduction.
- `v02_sparse_87p5_mixed_fixed`: v01 plus mixed `ap_fixed` types in the sparse attention kernel.
- `v03_full_csg_halt`: v02 plus three-segment PWL ELU+1 and resource-aware scheduling pragmas.

## 3. CSIM Results

| Variant | Status | Prediction flip | Max abs error | Mean abs error | Log |
|---|---|---|---:|---:|---|
| `v00_float_reference` | PASS | No | 1.907348633e-06 | 4.973262548e-07 | `results/hls_csim/logs/v00_float_reference_csim.log` |
| `v01_static_sparse_87p5_float` | PASS | No | 1.907348633e-06 | 6.137415767e-07 | `results/hls_csim/logs/v01_static_sparse_87p5_float_csim.log` |
| `v02_sparse_87p5_mixed_fixed` | PASS | No | 2.935886383e-03 | 1.298206858e-03 | `results/hls_csim/logs/v02_sparse_87p5_mixed_fixed_csim.log` |
| `v03_full_csg_halt` | PASS | No | 2.457857132e-03 | 1.217367128e-03 | `results/hls_csim/logs/v03_full_csg_halt_csim.log` |

All variants have HLS-to-reference prediction match rate 1.0. The fixed variants retain the
original, unchanged 1e-2 tolerance; the float variants retain the unchanged 1e-3 tolerance.

## 4. Key Observation

- v00 passes, confirming the copied float generation chain.
- v01 passes, showing that the 87.5% static sparse float attention implementation preserves
  functional correctness on the CSIM vectors.
- v02 now compiles and executes all samples. Mixed fixed-point introduces bounded logit error
  but no prediction flip.
- v03 now compiles and executes all samples. Its fixed-point plus PWL path remains within the
  original tolerance and has no prediction flip.
- No HALT early-exit exists in the current v03 source; this report does not claim an early-exit
  result.

## 5. Failure Analysis and Repair

Before repair, v02 and v03 failed at C++ compilation with:

```text
error: ambiguous overload for 'operator*'
(operand types are 'data_t' {aka 'ap_fixed<16,6>'} and 'float')
```

The root cause was implicit mixed arithmetic inside sparse attention: float Q/K/V values were
assigned to fixed arrays and then combined across `data_t`, `attn_acc_t`, float literals, and
float V values without an unambiguous common type.

The repair made type boundaries explicit without changing arithmetic structure:

- float Q/K values are explicitly converted to `data_t`;
- ternary branches both return `data_t`;
- attention accumulators and epsilon use explicit `attn_acc_t` values;
- key-value, denominator, and numerator products convert both operands to `attn_acc_t`;
- the final attention quotient is explicitly converted back to float at the existing boundary.

The sparse dimension remains 14, fixed-point widths are unchanged, reference logits are
unchanged, and no tolerance or testbench check was removed. Testbench logging now names
`pred_ref`, `pred_hls`, and `prediction_flipped` explicitly.

## 6. Decision

**Stage 6 CSYNTH is allowed, but was not executed in this task.**

All four variants compile, execute C simulation, satisfy their original numerical tolerance,
and preserve predictions against their corresponding references. Resource and timing claims
must wait for a separate Stage 6 run.
