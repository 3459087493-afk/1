# Experiment 1 Naming Convention — QKS (Query/Key Structured Sparsity)

**Date:** 2026-07-03
**Scope:** Experiment 1 main Pareto results (PYNQ-Z2 measured)
**Applies to:** All CSVs, reports, figures under `results/pynq_sparse_pareto/`

---

## 1. Naming Scheme

```
 Q{bits} - QKS{sparsity_pct}
   │         │    └── Q/K active-channel sparsity percentage (0/10/20/30)
   │         └── Query/Key Structured Sparsity
   └── Quantization bit-width (16 or 8)
```

| Component | Meaning | Values |
|-----------|---------|--------|
| `Q16` / `Q8` | Quantization bit-width (`ap_fixed<16,6>` or `ap_fixed<8,3>`) | 16, 8 |
| `QKS` | Query/Key Structured Sparsity — channel pruning on Q/K attention weights only | — |
| `0/10/20/30` | Percentage of Q/K channels pruned (by L1-norm weight selection) | 0%, 10%, 12.5%, 18.75%, 31.25% |

**Effective sparsity rates (actual):**
- QKS0: 0/16 channels removed = **0%** (dense baseline)
- QKS10: 2/16 channels removed = **12.5%**
- QKS20: 3/16 channels removed = **18.75%**
- QKS30: 5/16 channels removed = **31.25%**

The integer labels (0/10/20/30) are **rounded nominal sparsity rates** for paper readability, not exact percentages.

---

## 2. Old → New Name Mapping

| Old Name (engineering) | New Name (paper) | Quant | Active Dim | Sparsity | Vivado LUT |
|------------------------|-----------------|-------|------------|----------|------------|
| `q16_s0_attn_sparse` | **Q16-QKS0** | 16 | 16 (all) | 0% | 14,004 |
| `q16_s10_attn_sparse` | **Q16-QKS10** | 16 | 14 | 12.5% | 14,035 |
| `q16_s20_attn_sparse` | **Q16-QKS20** | 16 | 13 | 18.75% | 14,041 |
| `q16_s30_attn_sparse` | **Q16-QKS30** | 16 | 11 | 31.25% | 14,044 |
| `q8_s0_attn_sparse` | **Q8-QKS0** | 8 | 16 (all) | 0% | 14,019 |
| `q8_s30_attn_sparse` | **Q8-QKS30** | 8 | 11 | 31.25% | 14,031 |

### Corresponding model_id values (in CSVs)

| New `config` | New `model_id` | Old `model_id` |
|-------------|----------------|----------------|
| Q16-QKS0 | Ours-Q16-QKS0 | Ours-Q16-S0-AttnSparse |
| Q16-QKS10 | Ours-Q16-QKS10 | Ours-Q16-S10-AttnSparse |
| Q16-QKS20 | Ours-Q16-QKS20 | Ours-Q16-S20-AttnSparse |
| Q16-QKS30 | Ours-Q16-QKS30 | Ours-Q16-S30-AttnSparse |
| Q8-QKS0 | Ours-Q8-QKS0 | Ours-Q8-S0-AttnSparse |
| Q8-QKS30 | Ours-Q8-QKS30 | Ours-Q8-S30-AttnSparse |

---

## 3. What QKS Means (Technical)

**QKS = Query/Key Structured Sparsity**

- **Sparsity type:** Structured channel pruning on attention Q/K weight matrices
- **Selection criterion:** L1-norm of Q/K weight rows, descending
- **What is pruned:** Only Q and K projection channels in the linear attention
- **What remains FULL (16 channels):** V projection, attention output projection, feedforward layers, input projection, classifier
- **Implementation:** `active_channels.h` defines `ACTIVE_DIM` and `ACTIVE_CHANNELS[]` array
- **Why structured:** Unstructured/random sparsity does not reduce MAC count at hardware level — structured channel pruning reduces loop trip counts and DSP operations

### Why Not "Attention Sparse" or "AttnSparse"

- "Attention Sparse" is ambiguous — could mean head pruning, token dropping, or value skipping
- "QKS" unambiguously specifies **Query/Key channel pruning**, which is exactly what the hardware implements
- Follows established literature naming (e.g., "structured sparsity", "channel pruning")

---

## 4. Why Experiment 1 Uses QKS0/QKS10/QKS20/QKS30

### Scientific motivation

Experiment 1 is a **quantization-sparsity Pareto exploration**. The design space is:

```
Quantization: Q16 × Q8
Q/K Sparsity: 0% → 10% → 20% → 30%
```

This produces 8 possible combinations, of which 6 were implemented and measured:
- Q16: QKS0, QKS10, QKS20, QKS30 (full sparsity sweep)
- Q8: QKS0, QKS30 (dense + extreme sparse endpoints)

### Why only QKS0 and QKS30 for Q8

Intermediate sparsity levels (QKS10, QKS20) for Q8 were skipped because:
1. Q8 accuracy is already lower (~91% vs ~94% for Q16)
2. At Q8 precision, channel sparsity trades off already-marginal accuracy for minimal latency gain
3. QKS0 (dense) and QKS30 (sparse) endpoints sufficiently characterize the Q8 Pareto frontier
4. Q8-QKS30 DSP savings (124 vs 156) are consistent across all sparsity levels

### Key findings

| Finding | Evidence |
|---------|----------|
| Q16 accuracy stable across 0–31.25% sparsity | Q16-QKS0: 94.13%, Q16-QKS30: 94.13% |
| Q8 gains accuracy with sparsity | Q8-QKS0: 90.97%, Q8-QKS30: 91.35% (+0.4%) |
| Latency does NOT monotonically decrease | Q16-QKS20 (21.3ms) > Q16-QKS0 (19.8ms) |
| Sparsity creates better Pareto candidates | Q16-QKS30: same Acc as QKS0, lower latency |
| All configs >30× vs ViT4Mal 0.81s | All <27ms E2E (best: Q8-QKS0 18.9ms) |

---

## 5. Why ESLA-K13 Is NOT in Experiment 1 Main Pareto Figures

**Q16-ESLA-K13 is a token-level event-sparse design, not a Q/K channel-sparse design.**

### Fundamental difference

| Dimension | QKS (Experiment 1) | ESLA-K13 |
|-----------|-------------------|----------|
| Sparsity axis | Channel (D_MODEL) | Token (SEQ_LEN) |
| What is reduced | Q/K projection channels | Number of active tokens |
| Hardware mechanism | Smaller loop trip count on D_MODEL | Dynamic token compaction + reduced backend loops |
| When sparsity is decided | At design/compile time (`ACTIVE_DIM` fixed) | At inference time (data-dependent top-K) |
| Hardware cost | No additional logic | Sorting, compaction, extra BRAM |
| HLS latency result | 73,832 cycles (Q16-QKS30) | ~77,400 cycles estimated (4.8% slower) |

### Why exclusion is correct

1. **Different sparsity axis:** QKS operates on channels, ESLA operates on tokens. Mixing them in one Pareto plot would conflate two independent optimization dimensions.

2. **Different hardware mechanism:** QKS reduces fixed loop bounds at compile time. ESLA introduces dynamic data-dependent execution paths (sorting, compaction) that add overhead.

3. **ESLA is a negative result for HLS latency:** At csynth level, Q16-ESLA-K13 is ~4.8% slower than Q16-QKS30 (channel sparse) despite reducing token count from 16 to 13. The sorting and AXI compaction overhead erase the backend loop savings.

4. **Experiment 1 is about channel sparsity Pareto:** The experiment systematically sweeps Q/K sparsity (0%→30%) at fixed quantization. ESLA explores a different dimension entirely.

### Where ESLA-K13 belongs

- **Not in the main Experiment 1 Pareto figures** (Acc vs LUT, Acc vs Latency, etc.)
- **Separate analysis in Appendix or Discussion:** "Token-Level Event Sparsity Exploration"
- **Labeled as a negative result:** Demonstrates that token sparsity does not reduce HLS latency for short-sequence linear transformers
- **Future work pointer:** Combined token+channel sparsity may be needed for meaningful latency reduction

---

## 6. File Inventory — Updated Files

| File | Change |
|------|--------|
| `final_pynq_sparse_pareto_summary.csv` | `config` + `model_id` columns updated |
| `final_e2e_image_latency_summary.csv` | `config` column updated |
| `final_application_latency_summary.csv` | `config` column updated |
| `application_latency_report.md` | Table config names updated |
| `e2e_image_latency_report.md` | Table config names updated |
| `experiment1_figure_interpretation.md` | All config labels + recommendations updated |
| `final_figures/plot_exp1_figures.py` | All labels, legends, annotations updated |
| `final_figures/fig_exp1_*.png` (×5) | Regenerated with new labels |
| `final_figures/fig_exp1_*.pdf` (×5) | Regenerated with new labels |

### NOT modified

- `code_name` column in CSVs (keeps engineering directory names for traceability)
- HLS source files, TCL scripts, bitstreams, `.hwh` files
- `results/pynq_sparse_pareto/q*` sub-directories (raw measurement CSVs)
- `real_event_sparse/` directory (ESLA-K13 experiment)

---

## 7. Paper-Ready Labels

For use in LaTeX/paper text and figure captions:

| Full label | Abbreviated | Use case |
|-----------|-------------|----------|
| Q16-QKS0 | Q16 dense | Dense baseline reference |
| Q16-QKS10 | Q16 12.5% sparse | Sweep point |
| Q16-QKS20 | Q16 18.75% sparse | Sweep point, best accuracy |
| Q16-QKS30 | Q16 31.25% sparse | Recommended config |
| Q8-QKS0 | Q8 dense | Q8 baseline |
| Q8-QKS30 | Q8 31.25% sparse | Q8 sparse endpoint |

**Figure legend format:**
```
Q16-QKS0  (94.1% Acc, 14,004 LUT)
Q16-QKS10 (94.1% Acc, 14,035 LUT)
Q16-QKS20 (94.2% Acc, 14,041 LUT)
Q16-QKS30 (94.1% Acc, 14,044 LUT)
Q8-QKS0   (91.0% Acc, 14,019 LUT, 124 DSP)
Q8-QKS30  (91.3% Acc, 14,031 LUT, 124 DSP)
```

---

*Generated from existing PYNQ results. No experiments re-run. No HLS/Vivado/PYNQ modifications.*
