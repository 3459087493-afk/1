# Experiment 1 status

## Verdict: PARTIAL

The Q16 QKS-v2 design line is complete enough for a defensible four-point IMG_DS Pareto subsection: S0/S10/S20/S30 have software and PYNQ classification metrics, HLS synthesis, placed-and-routed resources, bit/hwh, timing PASS, and measured kernel/full-application latency. Every LUT count is below 53,200. The conservative full-application comparison is approximately 43× versus ViT4Mal's 0.81 s point.

The broader experiment definition says “different quantization settings and sparsity.” No Q8-QKS-v2 configuration exists. Existing Q8 results belong to the old dense/mask-sparse path and must not be mixed into the QKS-v2 frontier. Event-sparse results also cannot be inserted as board points. Therefore the full quantization-plus-QKS-v2 Pareto claim is incomplete even though the Q16 physical-pruning line is usable.

Existing figures are not automatically final: several use D16/D14/D13/D11 naming, legacy configurations, or 500× prepared-input speedup. The paper version should use S0/S10/S20/S30 and rebuild captions/data selection from `experiment1_data_matrix.csv`.

No new run is needed to publish a Q16-only experiment. A genuine multi-quantization QKS-v2 claim would require new Q8-QKS-v2 HLS/Vivado/PYNQ work.
