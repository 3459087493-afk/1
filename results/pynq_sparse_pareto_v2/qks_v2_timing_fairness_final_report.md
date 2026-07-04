# QKS-v2 timing fairness — final audit status

## Executive conclusion

The previous 522×–562× table must not be used as the final thesis result. Its 1.44–1.55 ms values are not kernel-only, but their precise generating runner is absent: the checked-in file with the expected name is byte-for-byte identical to an older runner and cannot generate the recorded component columns. A strict replacement runner now exists, but the PYNQ-Z2 returned `RuntimeError: No Devices Found` before timing under both the normal user and `sudo`. No strict sample was measured and no old result was relabelled.

Until the board environment is restored, the conservative numerical statement is based on the separately measured full-application boundary: 18.53–18.82 ms per sample, corresponding to about 43.1×–43.7× against 0.81 s. This scope includes extra file/decode/preprocessing work and is not the formal Table 13-aligned metric, but it establishes the requested greater-than-30× target without relying on the preliminary 500× result.

## Required audit answers

### 1. Did the previous 1.44–1.55 ms undercount?

Relative to the intended strict prepared-input boundary, the checked-in old runner undercounts PS argmax because argmax occurs after its timer. It does include input copy, cache flush, address programming, FPGA execution and output invalidation/readback/conversion. At the same time, it overcounts steady-state execution by allocating and deleting PYNQ buffers for every sample.

The separate 1.475–1.574 ms component CSV appears to include an argmax/decoder-classifier component, but its generator is missing. Therefore it cannot be proven complete even though its component sums are internally consistent.

### 2. Which items were missing?

The demonstrably missing item in the checked-in runner is argmax. Learned patch projection and classifier are not missing: both execute inside the PL kernel. Runtime weight transfer is not missing because QKS-v2 has no weight input port and embeds weights as `static const` accelerator data. Image read/decode/resize/normalization are deliberately outside the prepared-input aligned boundary.

### 3. What is the corrected strict aligned time?

Not measured. The strict summary intentionally records `NOT_MEASURED`, zero completed samples and zero repeats. Existing 1.475–1.574 ms values remain labelled `preliminary_non_strict_3repeat`.

### 4. Is strict total latency monotonic from S0 to S30?

Unknown until strict measurement succeeds. Preliminary aligned means decrease monotonically: 1573.641, 1538.668, 1519.030 and 1475.227 µs. Kernel means also decrease monotonically. These observations cannot substitute for the required strict 3444×5 run.

### 5. Does the corrected result still exceed 30×?

No corrected strict result exists yet. The independently measured conservative full-application means produce 43.05×–43.71× against 0.81 s, so the greater-than-30× target is supported under a broader and slower boundary.

### 6. Can the metric be compared approximately with Table 13?

The defined strict prepared-input metric can be used as an explicitly qualified approximate comparison: it covers input-buffer delivery through final prediction and excludes deployment initialization and image-file preprocessing. It cannot be described as an exact protocol reproduction because ViT4Mal does not publish an executable timer.

### 7. What cannot be made identical?

ViT4Mal places preprocessing and decoding on PS and its encoder on PL; its description includes moving patches and encoder matrices/biases into BRAM. QKS-v2 places learned input projection through classifier in one PL IP and statically embeds parameters. Consequently, decoder placement, runtime parameter traffic, model depth/heads, accelerator structure, board generation and software stack differ.

### 8. How should the thesis name the metric?

Use **“prepared-input PS–PL FPGA inference latency (ViT4Mal-aligned approximation)”**. Always show the boundary in the caption. Use **“FPGA kernel latency”** only for `ap_start` to `ap_done`, and **“full-application image-to-prediction latency”** for the JPEG-to-prediction path.

### 9. Which speedup belongs in a table?

Before strict remeasurement, the main table should use the conservative full-application-derived 43.05×–43.71× values or leave the aligned-speedup cells pending. The preliminary 514.7×–549.1× values may appear only in an audit/supplementary table labelled non-strict and not as the final headline.

After successful 3444×5 measurement, the table may report the measured strict ratio `810000 / strict_mean_us`, accompanied by kernel and full-application latency columns.

### 10. What should the main prose claim?

Current recommended wording:

> Using a conservative image-to-prediction measurement that includes host decoding and preprocessing, QKS-v2 achieves approximately 43× lower latency than ViT4Mal's 0.81 s reference, exceeding the 30× acceleration target. Prepared-input measurements suggest substantially higher acceleration, but exact timing-boundary equivalence is not claimed and strict five-repeat validation remains pending.

Do not state “fully fair 500× speedup.” If the future strict result remains above 500×, the requested cautious formulation is:

> The measured speedup is >500× under the ViT4Mal-aligned protocol. To avoid over-claiming due to potential timing-boundary differences, we conservatively state that the proposed design exceeds the 30× acceleration target.

## Architectural evidence

The QKS-v2 HLS top accepts a `[16][64]` patch tensor and returns two logits. It implements input projection and position embedding, Q/K/V and attention, LayerNorm, FFN, pooling, output normalization and the learned classifier. The PS performs output conversion and argmax. Weights are statically embedded in the generated FPGA accelerator; therefore, no per-sample runtime weight transfer is required.

## Files that define the audit

- `timing_protocol_audit.md` and `timing_protocol_audit_table.csv`: current-result provenance and 18-component disposition.
- `qks_v2_implementation_timing_boundary.md`: HLS/PS boundary and timing-bug analysis.
- `timing_protocol_definition.md`: the three non-interchangeable protocols.
- `run_qks_v2_vit4mal_aligned_strict.py`: reusable-buffer strict runner.
- `qks_v2_vit4mal_aligned_strict_summary.csv`: explicit blocked/not-measured status.
- `table_vit4mal_aligned_conservative_comparison.csv`: preliminary aligned values plus conservative full-application notes.
