# Stage 9 Resource Failure Diagnosis

## Total Resource Comparison

| Variant | Latency max | BRAM | DSP | FF | LUT | PYNQ-Z2 fit |
|---|---:|---:|---:|---:|---:|---:|
| v00_float_reference | 7869 | 176 | 258 | 71828 | 65546 | False |
| v01_static_sparse_87p5_float | 7784 | 174 | 258 | 71771 | 65992 | False |
| v02_sparse_87p5_mixed_fixed | 6948 | 166 | 281 | 78386 | 76567 | False |
| v03_full_csg_halt | 7059 | 166 | 283 | 78705 | 76988 | False |

PYNQ-Z2 limits are BRAM=280, DSP=220,
FF=106400, and LUT=53200. No current variant fits.

## v00 to v01: Static Sparse 87.5%

- Delta: latency -85, BRAM -2, DSP
  +0, FF -57, LUT +446.
- Latency, BRAM, and FF decrease slightly; DSP is unchanged and LUT increases.
- Likely causes: active_87p5 is conservative, Q/K/V projections remain dense, and active
  channel index/control staging adds LUT muxing. This is an evidence-based hypothesis, not a
  post-route attribution.

## v01 to v02: Mixed Fixed Point

- Delta: latency -836, BRAM -8, DSP
  +23, FF +6615, LUT +10575.
- Latency and BRAM decrease, but DSP, LUT, and FF increase substantially.
- Likely causes: repeated float/ap_fixed conversion boundaries, 24-bit fixed multipliers and
  accumulators, operator replication, and pipeline scheduling. Merely introducing ap_fixed
  does not guarantee fewer DSPs.

## v02 to v03: Current Full Method

- Delta: latency +111, BRAM +0, DSP
  +2, FF +319, LUT +421.
- The current full method does not save resources. PWL feature-map approximation does not
  address dense projection/output bottlenecks, and scheduling pragmas may retain or create
  more parallel hardware.

## Source Locations to Inspect

1. Q projection and K projection: dense `UNSW_D_MODEL x UNSW_D_MODEL` products.
2. V projection: remains full-dimensional by design.
3. `elu_plus_one` / PWL feature map.
4. `key_value`, numerator, and denominator active reductions.
5. Attention output projection and classifier.
6. Float/fixed conversion at sparse arrays and attention output.
7. ARRAY_PARTITION, PIPELINE, UNROLL, and multiplier ALLOCATION pragmas.

## Second-Round Priorities

- Evaluate active_75, active_62p5, active_50 (and exploratory active_37p5) before HLS.
- Generate compile-time compact arrays instead of runtime ACTIVE_IDX selection.
- Keep inner arithmetic consistently fixed; pre-convert weights and convert only at top I/O.
- Limit multiplier allocation and schedule for DSP/LUT constraints rather than maximum unroll.
- Generate second-round HLS only when the official-test PyTorch quality gate passes.
