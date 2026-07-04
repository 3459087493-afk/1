# End-to-end IMG_DS image-level latency

## Primary latency scope

Warm end-to-end image-level latency is the primary inference-latency and speedup metric. It starts when one raw IMG_DS JPEG path is opened and ends after the final benign/malware class prediction is produced.

The timed scope includes image file I/O, JPEG decode, grayscale conversion, 32×32 bilinear resize, `/255` normalization, row-major 8×8 patch transformation to `[16,64]`, host Q6.10 quantization, PS-to-PL buffer transfer, FPGA kernel execution and wait, output readback/dequantization, and argmax.

Overlay loading and buffer initialization are excluded from warm latency because they are one-time deployment initialization. They are included in the separately reported cold-start latency.

Kernel latency is retained only for hardware-core analysis. The earlier application-level latency beginning from an in-memory NPZ tensor remains an idealized preprocessed-input measurement and is not the main deployment speedup result.

All 3,444 test images were measured for every configuration. Board-side preprocessing reproduced the corresponding NPZ feature tensor exactly for every image (zero feature mismatches).

## Results

| Config | Accuracy | F1 | Warm mean (ms) | P50 (ms) | P95 (ms) | P99 (ms) | Cold start (s) | Speedup vs 0.81 s | >30x target |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| Q16-QKS0 | 94.13% | 96.53% | 19.761 | 19.724 | 24.837 | 27.313 | 3.471 | 40.99x | True |
| Q16-QKS10 | 94.11% | 96.51% | 20.288 | 19.986 | 26.487 | 27.415 | 3.998 | 39.92x | True |
| Q16-QKS20 | 94.22% | 96.59% | 21.333 | 21.143 | 24.596 | 35.979 | 3.949 | 37.97x | True |
| Q16-QKS30 | 94.13% | 96.53% | 19.012 | 18.498 | 22.935 | 27.208 | 3.657 | 42.60x | True |
| Q8-QKS0 | 90.97% | 94.50% | 18.897 | 18.559 | 21.791 | 26.634 | 4.484 | 42.86x | True |
| Q8-QKS30 | 91.35% | 94.76% | 19.250 | 19.013 | 23.126 | 26.987 | 3.393 | 42.08x | True |

## Interpretation

ViT4Mal fastest latency is 0.81 s, so the 30× threshold is 27 ms. Every measured warm E2E mean is below 27 ms.

The conservative paper headline should therefore be **over 30× speedup compared with the ViT4Mal fastest 0.81 s configuration**. Although the raw ratios are higher, the headline deliberately avoids emphasizing tens or hundreds of times beyond this conservative threshold.

Cold-start latency is reported separately and is not used for the primary speedup claim.

`total_runtime_us` is not used in any speedup calculation.
