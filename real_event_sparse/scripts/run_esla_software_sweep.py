#!/usr/bin/env python3
"""Run the Q16-ESLA software sweep on IMG_DS test_3444."""

from __future__ import annotations

import csv
import sys
from collections import OrderedDict
from pathlib import Path

import numpy as np
import torch


PROJECT_ROOT = Path(__file__).resolve().parents[2]
ESLA_ROOT = PROJECT_ROOT / "real_event_sparse"
EXPERIMENT_ROOT = PROJECT_ROOT / "experiments" / "imgds_linear_sparse"
sys.path.insert(0, str(PROJECT_ROOT))
sys.path.insert(0, str(ESLA_ROOT / "pytorch"))

from src.transformer import LinearUNSWAnomalyDetector  # noqa: E402
from esla_reference import (  # noqa: E402
    ESLASoftwareReference,
    calibrate_threshold,
    compute_token_scores,
    estimated_mac_reduction,
    select_active_tokens,
)


CHECKPOINT = EXPERIMENT_ROOT / "checkpoints" / "best_linear_imgds_dense_r32_p8.pt"
TEST_DATA = EXPERIMENT_ROOT / "q16_full_pynq_validation" / "q16_main_test_3444.npz"
CALIBRATION_DATA = (
    EXPERIMENT_ROOT / "q16_full_pynq_validation" / "q16_main_eval200.npz"
)
OUTPUT_CSV = ESLA_ROOT / "results" / "esla_software_sweep.csv"
PER_SAMPLE_CSV = ESLA_ROOT / "results" / "esla_software_sweep_per_sample.csv"

SEQ_LEN = 16
INPUT_DIM = 64
D_MODEL = 16
FF_DIM = 32
NUM_CLASSES = 2
TARGET_RATIOS = (0.70, 0.80, 0.90)
SCORE_TYPES = ("k", "phi_k")
FIELDNAMES = (
    "method",
    "score_type",
    "selection_type",
    "target_active_ratio",
    "threshold",
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
    "estimated_mac_reduction",
)


def load_model() -> LinearUNSWAnomalyDetector:
    checkpoint = torch.load(CHECKPOINT, map_location="cpu", weights_only=False)
    state = checkpoint.get("model_state_dict", checkpoint.get("state_dict", checkpoint))
    if any(key.startswith("backbone.") for key in state):
        state = OrderedDict(
            (key.replace("backbone.", "", 1), value.clone())
            for key, value in state.items()
            if isinstance(value, torch.Tensor)
        )
    else:
        state = OrderedDict(
            (key, value) for key, value in state.items() if isinstance(value, torch.Tensor)
        )
    model = LinearUNSWAnomalyDetector(
        input_dim=INPUT_DIM,
        seq_len=SEQ_LEN,
        d_model=D_MODEL,
        dim_feedforward=FF_DIM,
        num_layers=1,
        dropout=0.0,
        num_classes=NUM_CLASSES,
    )
    model.load_state_dict(state, strict=True)
    return model.eval()


def binary_metrics(labels: np.ndarray, predictions: np.ndarray) -> dict[str, float]:
    tp = int(np.sum((labels == 1) & (predictions == 1)))
    fp = int(np.sum((labels == 0) & (predictions == 1)))
    fn = int(np.sum((labels == 1) & (predictions == 0)))
    precision = tp / (tp + fp) if tp + fp else 0.0
    recall = tp / (tp + fn) if tp + fn else 0.0
    f1 = 2.0 * precision * recall / (precision + recall) if precision + recall else 0.0
    return {
        "accuracy": float(np.mean(labels == predictions)),
        "precision": float(precision),
        "recall": float(recall),
        "f1": float(f1),
    }


def result_row(
    *,
    score_type: str,
    selection_type: str,
    target_ratio: float,
    threshold: float | None,
    active_counts: np.ndarray,
    logits: np.ndarray,
    dense_logits: np.ndarray,
    labels: np.ndarray,
) -> dict[str, object]:
    predictions = np.argmax(logits, axis=1)
    dense_predictions = np.argmax(dense_logits, axis=1)
    metrics = binary_metrics(labels, predictions)
    mean_active = float(np.mean(active_counts))
    skipped_ratio = float(1.0 - mean_active / SEQ_LEN)
    abs_error = np.abs(logits - dense_logits)
    return {
        "method": "Q16-ESLA",
        "score_type": score_type,
        "selection_type": selection_type,
        "target_active_ratio": target_ratio,
        "threshold": "" if threshold is None else threshold,
        "mean_active_tokens": mean_active,
        "effective_sparsity": skipped_ratio,
        **metrics,
        "prediction_match_rate_vs_dense": float(np.mean(predictions == dense_predictions)),
        "max_abs_error": float(np.max(abs_error)),
        "mean_abs_error": float(np.mean(abs_error)),
        "skipped_token_ratio": skipped_ratio,
        "estimated_mac_reduction": estimated_mac_reduction(
            mean_active,
            seq_len=SEQ_LEN,
            input_dim=INPUT_DIM,
            d_model=D_MODEL,
            ff_dim=FF_DIM,
            num_classes=NUM_CLASSES,
        ),
    }


def main() -> None:
    torch.set_num_threads(max(1, min(8, torch.get_num_threads())))
    test = np.load(TEST_DATA)
    calibration = np.load(CALIBRATION_DATA)
    inputs = torch.from_numpy(test["X"]).float()
    labels = test["y"].astype(np.int64)
    calibration_inputs = torch.from_numpy(calibration["X"]).float()

    model = load_model()
    reference = ESLASoftwareReference(model)
    dense_logits_tensor = reference.dense_forward(inputs)
    dense_logits = dense_logits_tensor.cpu().numpy()
    dense_predictions = np.argmax(dense_logits, axis=1)
    dense_metrics = binary_metrics(labels, dense_predictions)
    if "ref_logits" in test.files:
        saved_error = float(np.max(np.abs(dense_logits - test["ref_logits"])))
        print(f"Dense model vs saved reference max_abs_error={saved_error:.9g}")

    embeddings, raw_keys = reference.prepare_scoring_state(inputs)
    _, calibration_keys = reference.prepare_scoring_state(calibration_inputs)

    rows: list[dict[str, object]] = [
        {
            "method": "Q16-Dense",
            "score_type": "none",
            "selection_type": "dense",
            "target_active_ratio": 1.0,
            "threshold": "",
            "mean_active_tokens": float(SEQ_LEN),
            "effective_sparsity": 0.0,
            **dense_metrics,
            "prediction_match_rate_vs_dense": 1.0,
            "max_abs_error": 0.0,
            "mean_abs_error": 0.0,
            "skipped_token_ratio": 0.0,
            "estimated_mac_reduction": 0.0,
        }
    ]
    per_sample_rows: list[dict[str, object]] = []

    for score_type in SCORE_TYPES:
        scores = compute_token_scores(raw_keys, score_type)
        calibration_scores = compute_token_scores(calibration_keys, score_type)
        for selection_type in ("topk", "threshold"):
            for target_ratio in TARGET_RATIOS:
                threshold = (
                    calibrate_threshold(calibration_scores, target_ratio)
                    if selection_type == "threshold"
                    else None
                )
                selection = select_active_tokens(
                    scores,
                    selection_type,
                    target_active_ratio=target_ratio,
                    threshold=threshold,
                    min_active_tokens=1,
                )
                sparse_logits = reference.compact_forward(
                    embeddings, raw_keys, selection
                ).cpu().numpy()
                row = result_row(
                    score_type=score_type,
                    selection_type=selection_type,
                    target_ratio=target_ratio,
                    threshold=threshold,
                    active_counts=selection.active_token_num,
                    logits=sparse_logits,
                    dense_logits=dense_logits,
                    labels=labels,
                )
                if not row["mean_active_tokens"] < SEQ_LEN:
                    raise AssertionError("Sparse configuration did not reduce active tokens")
                rows.append(row)
                sparse_predictions = np.argmax(sparse_logits, axis=1)
                for sample_index, active_token_num in enumerate(
                    selection.active_token_num.tolist()
                ):
                    per_sample_rows.append(
                        {
                            "method": "Q16-ESLA",
                            "score_type": score_type,
                            "selection_type": selection_type,
                            "target_active_ratio": target_ratio,
                            "sample_index": sample_index,
                            "active_token_num": active_token_num,
                            "skipped_token_num": SEQ_LEN - active_token_num,
                            "prediction": int(sparse_predictions[sample_index]),
                            "dense_prediction": int(dense_predictions[sample_index]),
                            "label": int(labels[sample_index]),
                        }
                    )
                print(
                    f"{score_type:5s} {selection_type:9s} target={target_ratio:.0%} "
                    f"active={row['mean_active_tokens']:.3f}/{SEQ_LEN} "
                    f"acc={row['accuracy']:.4%} f1={row['f1']:.4%} "
                    f"match={row['prediction_match_rate_vs_dense']:.4%}"
                )

    OUTPUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    with OUTPUT_CSV.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)
    with PER_SAMPLE_CSV.open("w", newline="") as handle:
        writer = csv.DictWriter(
            handle,
            fieldnames=(
                "method",
                "score_type",
                "selection_type",
                "target_active_ratio",
                "sample_index",
                "active_token_num",
                "skipped_token_num",
                "prediction",
                "dense_prediction",
                "label",
            ),
        )
        writer.writeheader()
        writer.writerows(per_sample_rows)
    print(f"Wrote {len(rows)} rows to {OUTPUT_CSV}")
    print(f"Wrote {len(per_sample_rows)} rows to {PER_SAMPLE_CSV}")


if __name__ == "__main__":
    main()
