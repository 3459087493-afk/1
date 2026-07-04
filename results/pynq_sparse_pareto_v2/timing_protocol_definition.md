# QKS-v2 timing protocol definition

## Protocol 1 — FPGA Kernel Latency

The interval is the `ap_start` write through observation of `ap_done`. It measures PL execution only. It excludes input-buffer write, cache flush, address-register setup, output invalidation/readback, PS argmax, preprocessing, allocation and overlay loading. This metric is used only to quantify the hardware effect of physical Q/K pruning.

## Protocol 2 — ViT4Mal-aligned FPGA Inference Time

Overlay loading, buffer allocation, NPZ loading and warm-up finish before timing. One prepared Q6.10 patch tensor is already resident in PS memory. Timing starts immediately before copying that sample into the reusable PYNQ input buffer and ends after output invalidation/readback, Q6.10-to-float conversion and PS argmax.

Included:

1. Input-buffer write.
2. Cache flush.
3. Input/output address-register writes.
4. IP start and completion wait.
5. Output invalidation/readback.
6. Output conversion and argmax.

`patch_embedding_us=0` as a separate PS component because the learned input projection and position embedding execute inside the PL IP and are already included in kernel time. `weight_transfer_us=0` because all parameters are `static const` arrays compiled into the accelerator; the top interface has no weight port.

Excluded:

1. Bitstream/overlay loading.
2. Python, Jupyter and SSH startup.
3. NPZ or image-file I/O.
4. Image decode, resize and normalization.
5. Raw patch construction and prepared-input quantization.
6. Buffer allocation and warm-up.
7. Per-sample logging.

This is an approximation, not proof of an identical boundary to ViT4Mal Table 13. ViT4Mal describes runtime movement of patches and layer matrices into BRAM, whereas QKS-v2 has static parameters and an end-to-end PL model from learned input projection through classifier. Nonexistent QKS-v2 weight traffic must not be synthesized as an artificial delay.

## Protocol 3 — Full Application Latency

This starts before opening/decoding one image and includes decode, resize, normalization, patch construction, quantization, input transfer, PL execution, output readback/conversion and prediction. Overlay loading remains deployment initialization. This metric explains deployed host overhead but is not the primary Table 13 comparison and is not evidence of sparse-kernel acceleration.

## Reporting rule

The three metrics must always be named and tabulated separately. A result is “strict ViT4Mal-aligned” only if it was produced by the checked-in strict runner over all 3444 samples for at least five complete repeats. Smoke tests and older three-repeat CSVs cannot be relabelled.
