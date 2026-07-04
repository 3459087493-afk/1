# QKS-v3 Phase 1 software feasibility

- Samples: 3444 (unchanged IMG_DS test order)
- Timing repeats: 30
- Selection: raw patch L1 Top-K; compact `[K,64]`; no mask
- Mean monotonic: False
- Median monotonic: False
- Accuracy criterion passed: False
- Phase 1 passed: False

Image decode/resize/normalize/patch measurements are common to all configs by design because these operations are identical and occur before token selection. No sample or repeat was removed. `full_application_proxy` sums those measurements with config-specific selection, compaction and quantization; it is not a PYNQ result.

Phase 1 failed the accuracy gate. Stop before HLS.
