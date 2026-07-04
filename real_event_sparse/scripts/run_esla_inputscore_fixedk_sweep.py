#!/usr/bin/env python3
"""Software-only pre-projection input-score fixed-K sweep for Q16-ESLA."""

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
)
from esla_reference import feature_map, select_active_tokens


OUTPUT_CSV = (
    EXPERIMENT_ROOT.parents[1]
    / "real_event_sparse"
    / "results"
    / "esla_inputscore_fixedk_sweep.csv"
)
FIXED_K_VALUES = (14, 13, 12, 11, 10)
SCORE_TYPES = ("input_mean_abs", "input_l2", "input_delta_mean_abs")
FIELDS = (
    "method",
    "score_type",
    "selection_type",
    "fixed_k",
    "mean_active_tokens",
    "effective_sparsity",
    "accuracy",
    "precision",
    "recall",
    "f1",
    "prediction_match_rate_vs_dense",
    "max_abs_error",
    "mean_abs_error",
    "mac_reduction_ratio",
    "memory_read_reduction_ratio",
    "selection_before_input_projection",
)


def input_scores(inputs: torch.Tensor, score_type: str) -> torch.Tensor:
    if score_type == "input_mean_abs":
        return inputs.abs().mean(dim=-1)
    if score_type == "input_l2":
        return inputs.square().mean(dim=-1).sqrt()
    if score_type == "input_delta_mean_abs":
        delta = torch.empty_like(inputs)
        delta[:, 0] = inputs[:, 0]
        delta[:, 1:] = inputs[:, 1:] - inputs[:, :-1]
        return delta.abs().mean(dim=-1)
    raise ValueError(f"Unknown input score type: {score_type}")


@torch.no_grad()
def preprojection_compact_forward(
    model: torch.nn.Module,
    inputs: torch.Tensor,
    active_indices: tuple[torch.Tensor, ...],
    batch_size: int = 256,
) -> torch.Tensor:
    """Gather raw input first; every model stage then operates on fixed K."""

    outputs = []
    attention = model.layers[0].attention
    layer = model.layers[0]
    for start in range(0, inputs.shape[0], batch_size):
        end = min(start + batch_size, inputs.shape[0])
        batch = inputs[start:end]
        index = torch.stack(active_indices[start:end], dim=0).to(batch.device)
        k = index.shape[1]
        input_index = index.unsqueeze(-1).expand(-1, -1, batch.shape[-1])
        compact_input = torch.gather(batch, 1, input_index)
        position = model.position_embedding.expand(batch.shape[0], -1, -1)
        position_index = index.unsqueeze(-1).expand(-1, -1, D_MODEL)
        compact_position = torch.gather(position, 1, position_index)
        if compact_input.shape[1] != k or k >= SEQ_LEN:
            raise AssertionError("Input compaction did not create a reduced token axis")

        x = model.input_projection(compact_input) + compact_position
        query = feature_map(attention.query(x))
        key = feature_map(attention.key(x))
        value = attention.value(x)
        key_value = torch.matmul(key.transpose(-2, -1), value)
        key_sum = key.sum(dim=1).unsqueeze(-1)
        normalizer = torch.matmul(query, key_sum).clamp_min(attention.eps)
        attended = torch.matmul(query, key_value) / normalizer
        x = layer.norm1(x + layer.dropout(attention.output(attended)))
        x = layer.norm2(x + layer.dropout(layer.feedforward(x)))
        pooled = model.output_norm(x.mean(dim=1))
        outputs.append(model.classifier(pooled))
    return torch.cat(outputs, dim=0)


def sparse_mac_per_sample(fixed_k: int, score_type: str) -> int:
    t, i, d, f, c = fixed_k, INPUT_DIM, D_MODEL, FF_DIM, NUM_CLASSES
    score_macs = SEQ_LEN * INPUT_DIM if score_type == "input_l2" else 0
    return (
        score_macs
        + t * d * i
        + 3 * t * d * d
        + t * d * d
        + t * d
        + t * d * d
        + t * d * d
        + 2 * t * d * f
        + c * d
    )


def dense_memory_reads_per_sample() -> int:
    return SEQ_LEN * INPUT_DIM + dense_bram_reads_per_sample()


def sparse_memory_reads_per_sample(fixed_k: int) -> int:
    """Conservative proxy including full score scan and explicit compaction."""

    dense_post_embedding = dense_bram_reads_per_sample()
    compact_post_embedding = dense_post_embedding * fixed_k // SEQ_LEN
    return (
        SEQ_LEN * INPUT_DIM  # score scans every raw input token once
        + fixed_k * INPUT_DIM  # gather reads selected raw tokens
        + fixed_k * INPUT_DIM  # projection reads compacted input buffer
        + compact_post_embedding
    )


def main() -> None:
    torch.set_num_threads(max(1, min(8, torch.get_num_threads())))
    test = np.load(TEST_DATA)
    inputs = torch.from_numpy(test["X"]).float()
    labels = test["y"].astype(np.int64)
    model = load_model()

    with torch.no_grad():
        dense_logits = model(inputs).cpu().numpy()
    dense_predictions = np.argmax(dense_logits, axis=1)
    dense_macs = dense_mac_per_sample()
    dense_reads = dense_memory_reads_per_sample()
    rows: list[dict[str, object]] = []

    for score_type in SCORE_TYPES:
        scores = input_scores(inputs, score_type)
        for fixed_k in FIXED_K_VALUES:
            selection = select_active_tokens(
                scores,
                "topk",
                target_active_ratio=fixed_k / SEQ_LEN,
                min_active_tokens=1,
            )
            if not np.all(selection.active_token_num == fixed_k):
                raise AssertionError(f"Selection did not produce fixed K={fixed_k}")
            logits = preprojection_compact_forward(
                model, inputs, selection.active_indices
            ).cpu().numpy()
            predictions = np.argmax(logits, axis=1)
            metrics = binary_metrics(labels, predictions)
            error = np.abs(logits - dense_logits)
            sparse_macs = sparse_mac_per_sample(fixed_k, score_type)
            sparse_reads = sparse_memory_reads_per_sample(fixed_k)
            row = {
                "method": "Q16-ESLA-input",
                "score_type": score_type,
                "selection_type": "fixed_topk_preprojection",
                "fixed_k": fixed_k,
                "mean_active_tokens": float(fixed_k),
                "effective_sparsity": 1.0 - fixed_k / SEQ_LEN,
                **metrics,
                "prediction_match_rate_vs_dense": float(
                    np.mean(predictions == dense_predictions)
                ),
                "max_abs_error": float(np.max(error)),
                "mean_abs_error": float(np.mean(error)),
                "mac_reduction_ratio": 1.0 - sparse_macs / dense_macs,
                "memory_read_reduction_ratio": 1.0 - sparse_reads / dense_reads,
                "selection_before_input_projection": True,
            }
            rows.append(row)
            print(
                f"{score_type:22s} K={fixed_k:2d} "
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

