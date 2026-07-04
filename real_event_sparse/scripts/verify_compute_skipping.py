#!/usr/bin/env python3
"""Verify software-level compute skipping for the recommended Q16-ESLA point.

This script compares operation-count models for dense, fake-mask, and genuinely
compacted execution. It does not invoke HLS, Vivado, or PYNQ.
"""

from __future__ import annotations

import csv
from pathlib import Path

import numpy as np


PROJECT_ROOT = Path(__file__).resolve().parents[2]
ESLA_ROOT = PROJECT_ROOT / "real_event_sparse"
SUMMARY_CSV = ESLA_ROOT / "results" / "esla_software_sweep.csv"
PER_SAMPLE_CSV = ESLA_ROOT / "results" / "esla_software_sweep_per_sample.csv"
REFERENCE_PY = ESLA_ROOT / "pytorch" / "esla_reference.py"
OUTPUT_CSV = ESLA_ROOT / "results" / "compute_skipping_verification.csv"
OUTPUT_REPORT = ESLA_ROOT / "docs" / "compute_skipping_verification.md"

METHOD = "Q16-ESLA"
SCORE_TYPE = "phi_k"
SELECTION_TYPE = "threshold"
TARGET_ACTIVE_RATIO = 0.80

SEQ_LEN = 16
INPUT_DIM = 64
D_MODEL = 16
FF_DIM = 32
NUM_CLASSES = 2

FIELDS = (
    "dense_token_iterations",
    "fake_mask_token_iterations",
    "real_esla_token_iterations",
    "dense_mac_estimate",
    "fake_mask_mac_estimate",
    "real_esla_mac_estimate",
    "dense_bram_read_estimate",
    "fake_mask_bram_read_estimate",
    "real_esla_bram_read_estimate",
    "mean_active_tokens",
    "effective_sparsity",
    "mac_reduction_ratio",
    "bram_read_reduction_ratio",
    "accuracy",
    "f1",
    "prediction_match_rate_vs_dense",
)


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="") as handle:
        return list(csv.DictReader(handle))


def choose_summary_row(rows: list[dict[str, str]]) -> dict[str, str]:
    matches = [
        row
        for row in rows
        if row["method"] == METHOD
        and row["score_type"] == SCORE_TYPE
        and row["selection_type"] == SELECTION_TYPE
        and np.isclose(float(row["target_active_ratio"]), TARGET_ACTIVE_RATIO)
    ]
    if len(matches) != 1:
        raise RuntimeError(f"Expected one recommended summary row, found {len(matches)}")
    return matches[0]


def choose_active_counts(rows: list[dict[str, str]]) -> np.ndarray:
    matches = [
        row
        for row in rows
        if row["method"] == METHOD
        and row["score_type"] == SCORE_TYPE
        and row["selection_type"] == SELECTION_TYPE
        and np.isclose(float(row["target_active_ratio"]), TARGET_ACTIVE_RATIO)
    ]
    if not matches:
        raise RuntimeError("No per-sample rows found for the recommended point")
    sample_ids = [int(row["sample_index"]) for row in matches]
    if sample_ids != list(range(len(matches))):
        raise RuntimeError("Per-sample rows are missing or not ordered by sample_index")
    counts = np.asarray([int(row["active_token_num"]) for row in matches], dtype=np.int64)
    if np.any(counts < 1) or np.any(counts > SEQ_LEN):
        raise RuntimeError("active_token_num is outside [1, SEQ_LEN]")
    return counts


def dense_mac_per_sample() -> int:
    """MAC model used by the software sweep for one dense sample."""

    s, i, d, f, c = SEQ_LEN, INPUT_DIM, D_MODEL, FF_DIM, NUM_CLASSES
    return (
        s * d * i  # input projection
        + 3 * s * d * d  # Q, K, V projections
        + s * d * d  # K^T V
        + s * d  # normalizer
        + s * d * d  # Q(K^T V)
        + s * d * d  # output projection
        + 2 * s * d * f  # two FFN projections
        + c * d  # classifier
    )


def real_mac_per_sample(active_tokens: int) -> int:
    """MAC model with dense K scoring and compact post-selection execution."""

    s, t, i, d, f, c = (
        SEQ_LEN,
        active_tokens,
        INPUT_DIM,
        D_MODEL,
        FF_DIM,
        NUM_CLASSES,
    )
    return (
        s * d * i  # all-token embedding required before scoring K
        + s * d * d  # all-token K projection required for K/phi(K) score
        + 2 * t * d * d  # compact Q and V; selected K is reused
        + t * d * d  # compact K^T V
        + t * d  # compact normalizer
        + t * d * d  # compact Q(K^T V)
        + t * d * d  # compact output projection
        + 2 * t * d * f  # compact two-layer FFN
        + c * d  # classifier
    )


def dense_bram_reads_per_sample() -> int:
    """Activation-buffer read proxy for the dense post-embedding data path.

    Weights and external AXI input are excluded because software cannot prove
    their eventual BRAM binding. Each term counts element reads from x/Q/K/V/KV,
    attended, or FFN buffers implied by the current nested-loop data flow.
    """

    s, d, f = SEQ_LEN, D_MODEL, FF_DIM
    return (
        3 * s * d * d  # x reads for Q/K/V projection
        + 2 * s * d * d  # K and V reads for KV accumulation
        + s * d  # K reads for K_sum
        + 2 * s * d  # Q and K_sum reads for normalizer
        + 2 * s * d * d  # Q and KV reads for attended
        + s * d * d  # attended reads for output projection
        + s * d  # x reads for attention residual
        + 2 * s * d * f  # x/hidden reads in the two FFN projections
        + 2 * s * d  # x and ff_out reads for FFN residual
    )


def real_bram_reads_per_sample(active_tokens: int) -> int:
    """Activation-buffer read proxy for dense scoring plus compact execution."""

    s, t, d, f = SEQ_LEN, active_tokens, D_MODEL, FF_DIM
    return (
        s * d * d  # x reads for all-token K scoring
        + s * d  # raw K reads for phi(K) importance score
        + 2 * t * d  # embedding and K reads during gather/compaction
        + 2 * t * d * d  # compact x reads for Q/V projection
        + 2 * t * d * d  # compact K/V reads for KV accumulation
        + t * d  # compact K reads for K_sum
        + 2 * t * d  # compact Q/K_sum reads for normalizer
        + 2 * t * d * d  # compact Q/KV reads for attended
        + t * d * d  # compact attended reads for output projection
        + t * d  # compact x reads for attention residual
        + 2 * t * d * f  # compact FFN activation reads
        + 2 * t * d  # compact FFN residual reads
    )


def verify_reference_structure() -> None:
    """Fail if the audited reference no longer contains the compaction path."""

    source = REFERENCE_PY.read_text()
    required = ("torch.gather", "groups.setdefault", "active_token_num")
    missing = [token for token in required if token not in source]
    if missing:
        raise RuntimeError(f"Reference is missing compaction evidence: {missing}")
    forbidden = ("masked_fill", "mask *", "* mask")
    present = [token for token in forbidden if token in source]
    if present:
        raise RuntimeError(f"Reference contains forbidden dense-mask patterns: {present}")


def format_int(value: int) -> str:
    return f"{value:,}"


def write_report(row: dict[str, object], samples: int, threshold: float) -> None:
    mean_active = float(row["mean_active_tokens"])
    report = f"""# Q16-ESLA Compute-Skipping Verification

## 1. Verification scope

This is a **software-level operation-count verification only**. No HLS source was
modified, and no HLS CSIM/csynth, Vivado, bitstream, or PYNQ run was performed.

Recommended point:

- score: `phi(K)`
- selection: calibration threshold targeting 80% active tokens
- calibrated threshold: `{threshold:.9f}`
- test samples: `{samples}`
- sequence length: `{SEQ_LEN}`

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
| Total token iterations over {samples} samples | {format_int(int(row['dense_token_iterations']))} | {format_int(int(row['fake_mask_token_iterations']))} | {format_int(int(row['real_esla_token_iterations']))} |
| Mean tokens per sample | 16.000 | 16.000 | {mean_active:.6f} |

Fake mask sparse reduces **zero** token-loop iterations. Real ESLA reduces the
executed compact token count from 16 to an average of **{mean_active:.3f}**,
corresponding to {float(row['effective_sparsity']):.2%} effective token sparsity.

## 4. MAC estimates

| Metric | Dense | Fake mask | Real ESLA |
|---|---:|---:|---:|
| Total estimated MACs | {format_int(int(row['dense_mac_estimate']))} | {format_int(int(row['fake_mask_mac_estimate']))} | {format_int(int(row['real_esla_mac_estimate']))} |
| Reduction vs dense | 0% | 0% | {float(row['mac_reduction_ratio']):.2%} |

The MAC model conservatively charges Real ESLA for all-token input projection and
all-token K projection, because K/phi(K) is required to score tokens. Selected K
is reused. Q, V, KV/K_sum, attended, output projection, and both FFN projections
are counted only for the compact T tokens.

Fake mask MAC estimate equals dense exactly. Multiplying a completed dense result
by zero cannot be counted as skipped computation.

## 5. Memory/BRAM-read proxy

| Metric | Dense | Fake mask | Real ESLA |
|---|---:|---:|---:|
| Estimated activation-buffer element reads | {format_int(int(row['dense_bram_read_estimate']))} | {format_int(int(row['fake_mask_bram_read_estimate']))} | {format_int(int(row['real_esla_bram_read_estimate']))} |
| Reduction vs dense | 0% | 0% | {float(row['bram_read_reduction_ratio']):.2%} |

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
| {float(row['accuracy']):.4%} | {float(row['f1']):.4%} | {float(row['prediction_match_rate_vs_dense']):.4%} |

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
"""
    OUTPUT_REPORT.write_text(report)


def main() -> None:
    verify_reference_structure()
    summary = choose_summary_row(read_csv(SUMMARY_CSV))
    active_counts = choose_active_counts(read_csv(PER_SAMPLE_CSV))
    samples = int(active_counts.size)
    mean_active = float(np.mean(active_counts))
    if not np.isclose(mean_active, float(summary["mean_active_tokens"]), atol=1e-12):
        raise RuntimeError("Summary and per-sample mean_active_tokens disagree")

    dense_iterations = samples * SEQ_LEN
    real_iterations = int(np.sum(active_counts))
    dense_macs = samples * dense_mac_per_sample()
    real_macs = int(sum(real_mac_per_sample(int(t)) for t in active_counts))
    dense_reads = samples * dense_bram_reads_per_sample()
    real_reads = int(sum(real_bram_reads_per_sample(int(t)) for t in active_counts))

    row: dict[str, object] = {
        "dense_token_iterations": dense_iterations,
        "fake_mask_token_iterations": dense_iterations,
        "real_esla_token_iterations": real_iterations,
        "dense_mac_estimate": dense_macs,
        "fake_mask_mac_estimate": dense_macs,
        "real_esla_mac_estimate": real_macs,
        "dense_bram_read_estimate": dense_reads,
        "fake_mask_bram_read_estimate": dense_reads,
        "real_esla_bram_read_estimate": real_reads,
        "mean_active_tokens": mean_active,
        "effective_sparsity": 1.0 - mean_active / SEQ_LEN,
        "mac_reduction_ratio": 1.0 - real_macs / dense_macs,
        "bram_read_reduction_ratio": 1.0 - real_reads / dense_reads,
        "accuracy": float(summary["accuracy"]),
        "f1": float(summary["f1"]),
        "prediction_match_rate_vs_dense": float(
            summary["prediction_match_rate_vs_dense"]
        ),
    }

    if row["fake_mask_token_iterations"] != row["dense_token_iterations"]:
        raise AssertionError("Fake mask must not receive token-iteration reduction")
    if row["fake_mask_mac_estimate"] != row["dense_mac_estimate"]:
        raise AssertionError("Fake mask must not receive MAC reduction")
    if row["fake_mask_bram_read_estimate"] != row["dense_bram_read_estimate"]:
        raise AssertionError("Fake mask must not receive memory-read reduction")
    if not (
        real_iterations < dense_iterations
        and real_macs < dense_macs
        and real_reads < dense_reads
    ):
        raise AssertionError("Real ESLA did not demonstrate all three skipping criteria")

    OUTPUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    with OUTPUT_CSV.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerow(row)
    write_report(row, samples, float(summary["threshold"]))

    print(f"Dense/Fake token iterations: {dense_iterations}")
    print(f"Real ESLA token iterations:  {real_iterations}")
    print(f"Mean active tokens:          {mean_active:.9f}")
    print(f"MAC reduction estimate:      {row['mac_reduction_ratio']:.4%}")
    print(f"BRAM-read proxy reduction:   {row['bram_read_reduction_ratio']:.4%}")
    print(f"Wrote {OUTPUT_CSV}")
    print(f"Wrote {OUTPUT_REPORT}")


if __name__ == "__main__":
    main()

