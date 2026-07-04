# QKS-v2 implementation and timing boundary audit

## Hardware boundary

The QKS-v2 top function accepts `data_t input[16][64]` and returns two logits through two `m_axi` ports. The input is therefore a 16-token tensor of flattened 8×8 normalized image patches—not a complete encoded image and not an already projected 16-dimensional feature tensor.

The PL implements input projection plus position embedding, Q/K/V, linear attention, both LayerNorms, FFN, mean pooling, output norm and the two-class linear classifier. Evidence is in `q16_qksv2_d16.cpp`, lines 202–275. The PS-side operation after readback is fixed-point conversion plus argmax; calling this whole step “decoder/classifier” is imprecise because the learned classifier itself is in PL.

All parameters, including input-projection and classifier weights, are `static const data_t` arrays in `qks_v2_params_q16_qksv2_d*.h`. The top has no weight AXI port. Thus weights are statically embedded in the generated FPGA accelerator; therefore, no per-sample runtime weight transfer is required.

## Existing runner audit

`run_qks_v2_pynq.py` preprocesses all selected images before loading the overlay (lines 139–164), so file read/decode/resize/normalize/patch construction/quantization are outside its model timer. The timer at lines 177–181 surrounds `run_pynq_inference`, which allocates and deletes buffers per sample (55–60, 88), copies and flushes input (62–65), writes addresses (67–75), starts/waits (77–81), and invalidates/converts output (83–86). Argmax occurs after the timer (185–186). Overlay is loaded once, not per image.

Consequently, that checked-in runner's interval is an overcount for reusable-buffer steady-state inference (allocation/deallocation included) and an undercount for prediction completion (argmax excluded). Its hard-coded `ol.q16_qksv2_d11_0` also makes it unsafe as a four-configuration runner.

The checked-in `run_qks_v2_vit4mal_aligned_inference.py` is byte-for-byte identical to the above generic runner and contains none of the component-timing field names found in `vit4mal_aligned_per_sample.csv`. The exact script that generated the existing 1.475–1.574 ms component results is therefore absent or was overwritten. The CSV has 10,332 records per configuration (3444×3), but source-level reproduction of its timing boundary is not possible from the current repository. This is a provenance defect; those values must be treated as preliminary rather than strict final measurements.

Sample order in the existing aligned CSV repeats indices 0–3443 for each pass and its summary accuracy agrees with the board accuracy summaries, but the missing generator prevents proving how prepared tensors and labels were constructed. The strict runner instead consumes one NPZ for both arrays and preserves its order for every repeat.

## Timing-bug classification

- Per-sample allocation in the checked-in runner: steady-state overcount, not undercount.
- Argmax outside its timer: small undercount.
- `register_setup_us=0` in existing aligned CSV: suspicious/undocumented; strict runner measures address writes explicitly.
- No per-sample overlay load: correct.
- No runtime weight transfer: architectural fact, not an omission.
- Patch projection reported as zero PS time: correct only because learned projection is inside PL; raw image-to-patch preparation is deliberately outside the aligned boundary.
- Missing exact aligned-result generator: reproducibility failure and the main reason a strict 5-repeat remeasurement is required.
