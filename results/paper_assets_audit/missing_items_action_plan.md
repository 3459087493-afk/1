# Missing-items action plan

## P0 — must address for a coherent thesis

### Write the formal Experiment 2 package

- **Missing:** dedicated mechanism table, MAC table, summary, figures and report.
- **Why:** the evidence exists but is scattered; the thesis cannot ask readers to infer the hardware-sparsity argument from source trees.
- **Alternative evidence now:** QKS-v2 HLS source, `qks_v2_csynth_summary.csv`, `qks_v2_pynq_summary.csv` and Vivado summary.
- **New experiment:** no.
- **Board required:** no.
- **Next:** generate the five requested Experiment 2 assets from existing evidence.

### Remove 500× figures/tables from the main result path

- **Missing:** one consistent main comparison using the conservative 18.5–18.8 ms boundary or explicitly pending strict timing.
- **Why:** the 1.48–1.57 ms aligned generator is missing and strict 3444×5 is not measured.
- **Alternative evidence now:** full-application breakdown supports about 43×.
- **New experiment:** no for the conservative claim; yes only if strict aligned timing is desired.
- **Board required:** only for strict timing.
- **Next:** label old 500× assets preliminary/non-strict and keep them out of the main thesis table.

### Produce the system and dense-versus-QKS-v2 architecture figures

- **Missing:** publication-ready Figures 1 and 2.
- **Why:** they explain PS/PL timing boundary and why QKS-v2 is not mask sparsity.
- **Alternative evidence now:** flow documents and HLS source.
- **New experiment / board:** no.
- **Next:** draw source-backed diagrams and include loop-bound pseudocode.

## P1 — strongly recommended

### Module-level resource decomposition

- **Missing:** per-module attention/projection/FFN/interface resources.
- **Why:** whole-design LUT is nearly flat and does not visually explain the scoped pruning.
- **Alternative evidence now:** total placed resources and HLS function hierarchy.
- **New experiment:** probably no; first inspect existing HLS/Vivado hierarchy reports.
- **Board required:** no.
- **Next:** extract existing hierarchy utilization where reliable. If synthesis flattened hierarchy beyond attribution, report that limitation instead of inventing numbers.

### Rebuild the final Pareto and latency figures from audited data

- **Missing:** clean S0/S10/S20/S30 naming and exclusion of unsupported Q8-QKS-v2/event-board points.
- **Why:** several existing figures use D16/D14/D13/D11 or old/non-strict speedups.
- **Alternative evidence now:** `experiment1_data_matrix.csv`.
- **New experiment / board:** no for Q16-only plots.

### Clarify Linear Transformer reference

- **Missing:** a qualitative table that records 29.86 microseconds correctly and states the cross-task limitation.
- **Why:** 29.86 µs is not 29.86 ms and is not IMG_DS image-to-prediction latency.
- **New experiment / board:** no.

## P2 — optional enhancement

### Q8-QKS-v2 design line

- **Missing:** genuine Q8 versions of the physical Q/K-pruned QKS-v2 architecture.
- **Why:** it would make “different quantization settings” literally complete.
- **Alternative evidence now:** old Q8 dense/mask-sparse results, which cannot be used as QKS-v2.
- **New experiment:** yes—software export, HLS, Vivado and PYNQ.
- **Board required:** yes for final evidence.
- **Next:** only undertake if multi-quantization QKS-v2 is a hard thesis requirement. Otherwise narrow Experiment 1 to the Q16 QKS-v2 sparsity frontier and mark Q8 as future work.

### Strict ViT4Mal-aligned 3444×5 timing

- **Missing:** successful strict board run.
- **Why:** needed only if a prepared-input aligned speedup is retained.
- **Alternative evidence now:** conservative full-application 43×.
- **New experiment:** timing rerun only; no HLS/Vivado.
- **Board required:** yes; current PYNQ environment reports `No Devices Found`.

## P3 — do not present as completed experimental evidence

### Event-sparse board result

- **Missing:** completed Vivado/PYNQ validation for real event sparsity.
- **Why risky:** current software/HLS-stage evidence must not be promoted to measured FPGA acceleration.
- **Alternative evidence:** software compute-skipping and implementation-design documents.
- **New experiment / board:** substantial work required.
- **Recommendation:** use as design discussion or future work unless independently completed and validated.

### Reusing old QKS-v1 or mask-sparse Q8 points

- **Recommendation:** do not do this. It would invalidate the QKS-v2 Pareto and sparse-mechanism claims.
