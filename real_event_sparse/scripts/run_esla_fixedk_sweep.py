#!/usr/bin/env python3
"""Run the software-only fixed-K sweep used for Q16-ESLA HLS selection."""

from __future__ import annotations

import csv

import numpy as np
import torch

from run_esla_software_sweep import (
    D_MODEL,
    EXPERIMENT_ROOT,
    FF_DIM,
    INPUT_DIM,
    NUM_CLASSES,
    SEQ_LEN,
    TEST_DATA,
    binary_metrics,
    load_model,
)
from verify_compute_skipping import (
    dense_bram_reads_per_sample,
    dense_mac_per_sample,
    real_bram_reads_per_sample,
    real_mac_per_sample,
)
from esla_reference import (
    ESLASoftwareReference,
    compute_token_scores,
    select_active_tokens,
)


OUTPUT_CSV = (
    EXPERIMENT_ROOT.parents[1]
    / "real_event_sparse"
    / "results"
    / "esla_fixedk_software_sweep.csv"
)
FIXED_K_VALUES = (14, 13, 12, 11, 10)
SCORE_TYPES = ("phi_k", "k")
FIELDS = (
    "method",
    "score_type",
    "selection_type",
    "fixed_k",
    "target_active_ratio",
    "mean_active_tokens",
    "effective_sparsity",
    "accuracy",
    "precision",
    "recall",
    "f1",
    "prediction_match_rate_vs_dense",
    "max_abs_error",
    "mean_abs_error",
    "skipped_token_ratio",
    "mac_reduction_ratio",
    "bram_read_reduction_ratio",
)


def main() -> None:
    torch.set_num_threads(max(1, min(8, torch.get_num_threads())))
    test = np.load(TEST_DATA)
    inputs = torch.from_numpy(test["X"]).float()
    labels = test["y"].astype(np.int64)

    reference = ESLASoftwareReference(load_model())
    dense_logits = reference.dense_forward(inputs).cpu().numpy()
    dense_predictions = np.argmax(dense_logits, axis=1)
    embeddings, raw_keys = reference.prepare_scoring_state(inputs)
    samples = inputs.shape[0]
    dense_macs = samples * dense_mac_per_sample()
    dense_reads = samples * dense_bram_reads_per_sample()

    rows: list[dict[str, object]] = []
    for score_type in SCORE_TYPES:
        scores = compute_token_scores(raw_keys, score_type)
        for fixed_k in FIXED_K_VALUES:
            selection = select_active_tokens(
                scores,
                "topk",
                target_active_ratio=fixed_k / SEQ_LEN,
                min_active_tokens=1,
            )
            if not np.all(selection.active_token_num == fixed_k):
                raise AssertionError(f"Top-k did not produce fixed K={fixed_k}")
            logits = reference.compact_forward(
                embeddings, raw_keys, selection
            ).cpu().numpy()
            predictions = np.argmax(logits, axis=1)
            metrics = binary_metrics(labels, predictions)
            error = np.abs(logits - dense_logits)
            real_macs = samples * real_mac_per_sample(fixed_k)
            real_reads = samples * real_bram_reads_per_sample(fixed_k)
            row = {
                "method": "Q16-ESLA",
                "score_type": score_type,
                "selection_type": "fixed_topk",
                "fixed_k": fixed_k,
                "target_active_ratio": fixed_k / SEQ_LEN,
                "mean_active_tokens": float(fixed_k),
                "effective_sparsity": 1.0 - fixed_k / SEQ_LEN,
                **metrics,
                "prediction_match_rate_vs_dense": float(
                    np.mean(predictions == dense_predictions)
                ),
                "max_abs_error": float(np.max(error)),
                "mean_abs_error": float(np.mean(error)),
                "skipped_token_ratio": 1.0 - fixed_k / SEQ_LEN,
                "mac_reduction_ratio": 1.0 - real_macs / dense_macs,
                "bram_read_reduction_ratio": 1.0 - real_reads / dense_reads,
            }
            rows.append(row)
            print(
                f"{score_type:5s} K={fixed_k:2d} "
                f"acc={row['accuracy']:.4%} f1={row['f1']:.4%} "
                f"match={row['prediction_match_rate_vs_dense']:.4%} "
                f"mac_red={row['mac_reduction_ratio']:.4%}"
            )

    OUTPUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    with OUTPUT_CSV.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(rows)
    print(f"Wrote {len(rows)} rows to {OUTPUT_CSV}")


if __name__ == "__main__":
    main()

