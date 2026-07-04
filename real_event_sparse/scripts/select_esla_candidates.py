#!/usr/bin/env python3
"""Select software-optimal and hardware-friendly Q16-ESLA candidates."""

from __future__ import annotations

import csv
from pathlib import Path

import numpy as np


PROJECT_ROOT = Path(__file__).resolve().parents[2]
RESULTS = PROJECT_ROOT / "real_event_sparse" / "results"
SWEEP_CSV = RESULTS / "esla_software_sweep.csv"
FIXEDK_CSV = RESULTS / "esla_fixedk_software_sweep.csv"
SKIPPING_CSV = RESULTS / "compute_skipping_verification.csv"
OUTPUT_CSV = RESULTS / "esla_candidate_selection.csv"

FIELDS = (
    "candidate_name",
    "score_type",
    "selection_type",
    "threshold_percentile",
    "fixed_k",
    "mean_active_tokens",
    "effective_sparsity",
    "accuracy",
    "precision",
    "recall",
    "f1",
    "prediction_match_rate_vs_dense",
    "mac_reduction_ratio",
    "bram_read_reduction_ratio",
    "hardware_friendliness",
    "expected_hls_difficulty",
    "recommended_for_hls",
    "reason",
)


def read_rows(path: Path) -> list[dict[str, str]]:
    with path.open(newline="") as handle:
        return list(csv.DictReader(handle))


def one(rows: list[dict[str, str]], predicate, description: str) -> dict[str, str]:
    matches = [row for row in rows if predicate(row)]
    if len(matches) != 1:
        raise RuntimeError(f"Expected one {description} row, found {len(matches)}")
    return matches[0]


def main() -> None:
    sweep = read_rows(SWEEP_CSV)
    fixed = read_rows(FIXEDK_CSV)
    skipping = read_rows(SKIPPING_CSV)
    if len(skipping) != 1:
        raise RuntimeError("compute_skipping_verification.csv must contain one row")

    dense = one(sweep, lambda r: r["method"] == "Q16-Dense", "dense")
    t80 = one(
        sweep,
        lambda r: r["score_type"] == "phi_k"
        and r["selection_type"] == "threshold"
        and np.isclose(float(r["target_active_ratio"]), 0.8),
        "phi(K) T80",
    )
    k13 = one(
        fixed,
        lambda r: r["score_type"] == "phi_k" and int(r["fixed_k"]) == 13,
        "phi(K) K13",
    )

    min_accuracy = float(dense["accuracy"]) - 0.003
    for name, row, mac_key in (
        ("Q16-ESLA-T80", t80, "estimated_mac_reduction"),
        ("Q16-ESLA-K13", k13, "mac_reduction_ratio"),
    ):
        if float(row["accuracy"]) < min_accuracy:
            raise RuntimeError(f"{name} violates the accuracy criterion")
        if float(row["effective_sparsity"]) < 0.15:
            raise RuntimeError(f"{name} violates the sparsity criterion")
        if float(row[mac_key]) < 0.10:
            raise RuntimeError(f"{name} violates the MAC-reduction criterion")

    selected = [
        {
            "candidate_name": "Q16-ESLA-T80",
            "score_type": "phi_k",
            "selection_type": "dynamic_threshold",
            "threshold_percentile": 80,
            "fixed_k": "",
            "mean_active_tokens": t80["mean_active_tokens"],
            "effective_sparsity": t80["effective_sparsity"],
            "accuracy": t80["accuracy"],
            "precision": t80["precision"],
            "recall": t80["recall"],
            "f1": t80["f1"],
            "prediction_match_rate_vs_dense": t80[
                "prediction_match_rate_vs_dense"
            ],
            "mac_reduction_ratio": skipping[0]["mac_reduction_ratio"],
            "bram_read_reduction_ratio": skipping[0][
                "bram_read_reduction_ratio"
            ],
            "hardware_friendliness": "medium",
            "expected_hls_difficulty": "high",
            "recommended_for_hls": "no_first_version",
            "reason": (
                "Software-optimal accuracy/F1 tradeoff with dynamic T; use as "
                "algorithm-validity reference, but variable loop bounds and "
                "per-sample compaction complicate first HLS scheduling."
            ),
        },
        {
            "candidate_name": "Q16-ESLA-K13",
            "score_type": "phi_k",
            "selection_type": "fixed_topk",
            "threshold_percentile": "",
            "fixed_k": 13,
            "mean_active_tokens": k13["mean_active_tokens"],
            "effective_sparsity": k13["effective_sparsity"],
            "accuracy": k13["accuracy"],
            "precision": k13["precision"],
            "recall": k13["recall"],
            "f1": k13["f1"],
            "prediction_match_rate_vs_dense": k13[
                "prediction_match_rate_vs_dense"
            ],
            "mac_reduction_ratio": k13["mac_reduction_ratio"],
            "bram_read_reduction_ratio": k13["bram_read_reduction_ratio"],
            "hardware_friendliness": "high",
            "expected_hls_difficulty": "medium",
            "recommended_for_hls": "yes_first_version",
            "reason": (
                "Fixed K=13 is closest to T80 mean T=12.776, meets all gates, "
                "and has better accuracy, F1, and dense prediction match than "
                "K12 while giving a compile-time-stable reduced loop bound."
            ),
        },
    ]

    OUTPUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    with OUTPUT_CSV.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(selected)
    print(f"Wrote {len(selected)} candidates to {OUTPUT_CSV}")


if __name__ == "__main__":
    main()

