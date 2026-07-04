# Q16-ESLA Compute-Skipping Verification

## 1. Verification scope

This is a **software-level operation-count verification only**. No HLS source was
modified, and no HLS CSIM/csynth, Vivado, bitstream, or PYNQ run was performed.

Recommended point:

- score: `phi(K)`
- selection: calibration threshold targeting 80% active tokens
- calibrated threshold: `0.759333658`
- test samples: `3444`
- sequence length: `16`

The “80% threshold” label means an 80% target active ratio; the threshold itself
was calibrated from the lower 20th percentile of the independent eval200 score
distribution.

## 2. Three execution models

| Implementation | Token execution |
|---|---|
| Dense Q16-S0 | All 16 tokens enter the full Linear Attention path. |
| Fake mask sparse | All 16 tokens still enter the same loops/MACs/memory reads; inactive results are only multiplied or masked to zero. |
| Real Q16-ESLA | `active_token_indices` are gathered into compact tensors and downstream computation runs with actual token dimension T. |

The audited reference groups samples by exact T and uses `torch.gather` to build
`[batch_T, T, D]` tensors. It does not pad them back to 16 and does not use an
inactive-token mask in Q/V, attention, output projection, FFN, or pooling.

## 3. Measured token-iteration counts

| Metric | Dense | Fake mask | Real ESLA |
|---|---:|---:|---:|
| Total token iterations over 3444 samples | 55,104 | 55,104 | 43,999 |
| Mean tokens per sample | 16.000 | 16.000 | 12.775552 |

Fake mask sparse reduces **zero** token-loop iterations. Real ESLA reduces the
executed compact token count from 16 to an average of **12.776**,
corresponding to 20.15% effective token sparsity.

## 4. MAC estimates

| Metric | Dense | Fake mask | Real ESLA |
|---|---:|---:|---:|
| Total estimated MACs | 198,484,608 | 198,484,608 | 172,721,008 |
| Reduction vs dense | 0% | 0% | 12.98% |

The MAC model conservatively charges Real ESLA for all-token input projection and
all-token K projection, because K/phi(K) is required to score tokens. Selected K
is reused. Q, V, KV/K_sum, attended, output projection, and both FFN projections
are counted only for the compact T tokens.

Fake mask MAC estimate equals dense exactly. Multiplying a completed dense result
by zero cannot be counted as skipped computation.

## 5. Memory/BRAM-read proxy

| Metric | Dense | Fake mask | Real ESLA |
|---|---:|---:|---:|
| Estimated activation-buffer element reads | 174,569,472 | 174,569,472 | 144,521,344 |
| Reduction vs dense | 0% | 0% | 17.21% |

This is a software data-flow proxy, not a physical BRAM transaction measurement.
It counts reads implied for x/Q/K/V/KV/attended/FFN activation buffers and includes
K scoring plus gather reads for Real ESLA. Weight reads and external AXI input are
excluded because their eventual RAM/ROM/AXI binding can only be established by HLS.

Fake mask receives no reduction: it addresses the same dense buffers through the
same 16-token loops. Real compaction reduces accesses after selection because
inactive tokens have no compact buffer entry.

## 6. Accuracy retained at the recommended point

| Accuracy | F1 | Prediction match vs dense |
|---:|---:|---:|
| 95.0058% | 97.0867% | 97.2706% |

These values are copied from the completed 3444-sample software sweep and matched
to the same per-sample active-token records used for operation counting.

## 7. Pass/fail judgment

- **Dense Q16-S0:** reference baseline; 16-token execution.
- **Fake mask sparse:** **FAIL as effective sparsity**. Token iterations, MAC
  estimate, and activation-buffer read estimate are identical to dense.
- **Real Q16-ESLA:** **PASS at software-reference level**. Active Token List,
  gather/compaction, and reduced T-dimensional execution produce fewer token
  iterations, estimated MACs, and estimated activation-buffer reads.

Real ESLA is not a dense mask: the inactive tokens are absent from the compacted
Linear Attention tensor. However, this result is still a software-level estimate.
It does **not** prove FPGA latency reduction and must not be described as already
implemented or measured on board.

The next hardware proof, when authorized, must use HLS CSIM/csynth to demonstrate
variable/reduced loop trip counts and scheduled latency, followed separately by
hardware measurement. None of those steps was performed here.

## 8. Output

Machine-readable values: `real_event_sparse/results/compute_skipping_verification.csv`.
