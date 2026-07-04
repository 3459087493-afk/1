# Experiment 1 freeze archive manifest

- Archive date: 2026-07-03 (Asia/Shanghai)
- Project root: `/home/cym/prj2/finn/notebooks/icl_thesis-master`
- Archive root: `results/archive_before_real_event_sparse`
- Operation: file-only archival copy; no HLS, Vivado, bitstream generation, or PYNQ execution was performed.
- Source policy: existing source code, PYNQ results, CSV files, bitstreams, and HWH files were not modified.

## Archived trees

The archive preserves each source path beneath the archive root:

1. `results/pynq_sparse_pareto`
   - Complete six-configuration PYNQ result tree.
   - Kernel, application-level, and raw-image end-to-end latency CSV/log outputs.
   - Final summary tables, reports, original test-image subset, manifests, scripts, bit/HWH copies, and pre-fix CSV backups.
2. `experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board`
   - Experiment 1 Q16/Q8 attention-sparse HLS projects and generated HLS artifacts.
   - Vivado projects, implementation outputs, reports, Tcl scripts, bitstreams, and HWH files.
   - PYNQ packages for Q16-S0/S10/S20/S30 and Q8-S0/S30.
3. `experiments/imgds_linear_sparse/final_paper_experiments/pynq_package`
   - Final-paper PYNQ packaging scripts and artifacts.
4. `experiments/imgds_linear_sparse/final_paper_experiments/notebooks`
   - Experiment-generation and quantization/sparsity notebooks.
5. `experiments/imgds_linear_sparse/final_paper_experiments/reports`
6. `experiments/imgds_linear_sparse/final_paper_experiments/tables`
7. `experiments/imgds_linear_sparse/stage3_attention_only_sparse_hls`
   - Q16-S10/S20/S30 attention-only sparse source and HLS project trees.
8. `experiments/imgds_linear_sparse/stage3_quant_sparsity_hls`
   - Q8 quantization/sparsity and related HLS/Vivado code trees.
9. `experiments/imgds_linear_sparse/q16_full_pynq_validation`
10. `experiments/imgds_linear_sparse/q8_dense_pynq_validation`

## Archive inventory and verification

- Files copied before creation of this manifest: **17,990**
- Directories copied/created: **1,681**
- Archive size before creation of this manifest: approximately **2.5 GiB**
- Relevant archived bit/HWH and HLS/Vivado/PYNQ run/measurement scripts found: **72**
- Every archived source tree above was checked with recursive `diff -qr`; all checks returned identical.

## Frozen Experiment 1 conclusions

The following statements describe the archived results as they existed at freeze time:

1. All six configurations have completed PYNQ-Z2 measurements:
   - Q16-S0, Q16-S10, Q16-S20, Q16-S30, Q8-S0, and Q8-S30.
2. Full-test hardware label accuracy:
   - Q16 configurations: **94.11%–94.22%**.
   - Q8 configurations: **90.97%–91.35%**.
3. Measured 1000-run FPGA kernel latency is approximately **0.829–0.955 ms**. This is retained for accelerator-core analysis, not as the main deployment-level speedup metric.
4. The in-memory/preprocessed-input application latency is approximately **2.059–2.191 ms** and is treated as an idealized application measurement.
5. The primary deployment-oriented result is warm raw-image end-to-end latency, measured over all **3,444** IMG_DS test JPEGs per configuration:
   - Mean latency: **18.897–21.333 ms**.
   - The timed path includes image file I/O, JPEG decoding, grayscale conversion, resize, normalization, patch transformation, quantization, PS–PL transfer, FPGA execution, output readback/dequantization, and argmax.
   - Overlay loading is excluded from warm latency and reported separately as cold start (**3.393–4.484 s**).
6. Board-side image preprocessing reproduced the stored NPZ features exactly for every measured image: **zero feature mismatches**.
7. Every configuration has mean warm end-to-end latency below the **27 ms** threshold corresponding to 30× versus the ViT4Mal fastest 0.81 s point. The frozen conservative headline is therefore:

   > over 30× speedup compared with the ViT4Mal fastest 0.81 s configuration

8. The conservative claim is based on mean warm end-to-end latency; it is not extended to P99 tail latency.
9. `total_runtime_us` is not used for the speedup conclusion.
10. In the archived `final_pynq_sparse_pareto_summary_speedup_fixed.csv`, Q16-S10/S20/S30 and Q8-S30 Vivado resource cells remain `TBD`; this archive intentionally preserves the current snapshot without altering those records.

## Restore note

To inspect or restore a tree, use the matching relative path below `results/archive_before_real_event_sparse/`. The archive is a regular directory copy rather than a transformed or compressed export, so filenames, timestamps, permissions, generated artifacts, and directory structure are retained.
