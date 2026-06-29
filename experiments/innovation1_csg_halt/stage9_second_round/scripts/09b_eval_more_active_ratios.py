import json
import sys
from pathlib import Path

import joblib
import numpy as np
import pandas as pd
import torch


STAGE9_ROOT = Path(__file__).resolve().parents[1]
EXP_ROOT = STAGE9_ROOT.parent
PROJECT_ROOT = Path(__file__).resolve().parents[4]
BASELINE_RESULTS = PROJECT_ROOT / "results" / "linear_unsw_baseline"
STAGE4_DIR = EXP_ROOT / "results" / "active_channel_selection"
OUTPUT_DIR = STAGE9_ROOT / "results" / "active_ratio_sweep"
EXP_SCRIPT_DIR = EXP_ROOT / "scripts"
if str(EXP_SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(EXP_SCRIPT_DIR))

from common import (
    compare_to_original,
    extract_linear_attention_tensors,
    finish_forward,
    load_json,
    load_model,
)


CANDIDATES = (
    ("active_87p5", 0.875),
    ("active_75", 0.75),
    ("active_62p5", 0.625),
    ("active_50", 0.5),
    ("active_37p5", 0.375),
)
BATCH_SIZE = 1024


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2), encoding="utf-8")


def resolve_sets():
    document = load_json(STAGE4_DIR / "active_channel_sets.json")
    existing = document.get("sets", {})
    scores = pd.read_csv(STAGE4_DIR / "active_channel_scores.csv")
    q_ranking = scores.sort_values("q_score", ascending=False)["channel"].astype(int).tolist()
    k_ranking = scores.sort_values("k_score", ascending=False)["channel"].astype(int).tolist()
    resolved = {}
    for name, ratio in CANDIDATES:
        if name in existing:
            resolved[name] = existing[name]
            continue
        count = max(1, int(round(16 * ratio)))
        resolved[name] = {
            "requested_active_ratio": ratio,
            "active_count": count,
            "q_channels": sorted(q_ranking[:count]),
            "k_channels": sorted(k_ranking[:count]),
            "generated_from_stage4_scores": True,
        }
    return resolved


def load_official_test():
    preprocess_info = load_json(BASELINE_RESULTS / "preprocess_info.json")
    test_csv = Path(preprocess_info["test_csv"])
    if not test_csv.is_file():
        raise FileNotFoundError(test_csv)
    frame = pd.read_csv(test_csv)
    label_column = preprocess_info["label_column"]
    labels = pd.to_numeric(frame[label_column], errors="raise").astype(np.int64).to_numpy()
    if not set(np.unique(labels)).issubset({0, 1}):
        raise ValueError(f"Official labels are not binary: {np.unique(labels)}")
    features = frame[preprocess_info["feature_columns"]]
    preprocessor = joblib.load(BASELINE_RESULTS / "preprocessor.joblib")
    flat = np.asarray(preprocessor.transform(features), dtype=np.float32)
    expected_dim = int(preprocess_info["one_hot_feature_dim"])
    if flat.shape[1] != expected_dim:
        raise RuntimeError(f"Preprocessor produced {flat.shape[1]}, expected {expected_dim}")
    padding = int(preprocess_info["padding_features"])
    if padding:
        flat = np.pad(flat, ((0, 0), (0, padding)), mode="constant")
    inputs = np.ascontiguousarray(
        flat.reshape(-1, int(preprocess_info["seq_len"]), int(preprocess_info["input_dim"])),
        dtype=np.float32,
    )
    return inputs, labels, preprocess_info, test_csv


def main():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    active_sets = resolve_sets()
    inputs, labels, preprocess_info, test_csv = load_official_test()
    model, model_config, checkpoint_format = load_model()
    original_parts = []
    candidate_parts = {name: [] for name, _ in CANDIDATES}
    denominator = {
        name: {"minimum": float("inf"), "sum": 0.0, "count": 0, "near_zero": 0}
        for name, _ in CANDIDATES
    }

    total_batches = (len(inputs) + BATCH_SIZE - 1) // BATCH_SIZE
    with torch.no_grad():
        for batch_index, start in enumerate(range(0, len(inputs), BATCH_SIZE), start=1):
            batch = torch.from_numpy(inputs[start : start + BATCH_SIZE])
            tensors = extract_linear_attention_tensors(model, batch)
            original_parts.append(model(batch).cpu().numpy())
            for name, _ in CANDIDATES:
                active = active_sets[name]
                q_mask = torch.zeros((1, 1, 16), dtype=torch.bool)
                k_mask = torch.zeros((1, 1, 16), dtype=torch.bool)
                q_mask[:, :, active["q_channels"]] = True
                k_mask[:, :, active["k_channels"]] = True
                output = finish_forward(model, tensors, q_mask=q_mask, k_mask=k_mask)
                candidate_parts[name].append(output["logits"].cpu().numpy())
                values = output["denominator_raw"].cpu().numpy()
                stats = denominator[name]
                stats["minimum"] = min(stats["minimum"], float(values.min()))
                stats["sum"] += float(values.sum(dtype=np.float64))
                stats["count"] += int(values.size)
                stats["near_zero"] += int(np.count_nonzero(values <= 1e-6))
            if batch_index == 1 or batch_index % 20 == 0 or batch_index == total_batches:
                print(f"official-test inference batch {batch_index}/{total_batches}")

    original_logits = np.concatenate(original_parts, axis=0)
    evaluations = []
    for name, ratio in CANDIDATES:
        logits = np.concatenate(candidate_parts[name], axis=0)
        original_metrics, metrics = compare_to_original(labels, original_logits, logits)
        stats = denominator[name]
        active = active_sets[name]
        f1_drop = float(original_metrics["f1"] - metrics["f1"])
        passes = bool(
            metrics["prediction_match_rate_vs_original"] >= 0.99
            and f1_drop <= 0.01
            and stats["near_zero"] == 0
        )
        evaluations.append(
            {
                "candidate": name,
                "dataset": "official UNSW-NB15 testing-set.csv",
                "num_samples": len(labels),
                "accuracy": metrics["accuracy"],
                "precision": metrics["precision"],
                "recall": metrics["recall"],
                "f1": metrics["f1"],
                "f1_delta_vs_original": metrics["f1_delta_vs_original"],
                "f1_drop_vs_original": f1_drop,
                "prediction_match_rate_vs_original": metrics[
                    "prediction_match_rate_vs_original"
                ],
                "max_abs_logits_error_vs_original": metrics[
                    "max_abs_logits_error_vs_original"
                ],
                "mean_abs_logits_error_vs_original": metrics[
                    "mean_abs_logits_error_vs_original"
                ],
                "q_active_channels": active["q_channels"],
                "k_active_channels": active["k_channels"],
                "q_active_ratio": len(active["q_channels"]) / 16.0,
                "k_active_ratio": len(active["k_channels"]) / 16.0,
                "estimated_attention_mac_reduction": 1.0 - ratio,
                "denominator_min": stats["minimum"],
                "denominator_mean": stats["sum"] / stats["count"],
                "denominator_near_zero_count": stats["near_zero"],
                "confusion_matrix": metrics["confusion_matrix"],
                "passes_quality_gate": passes,
            }
        )

    primary_names = {"active_75", "active_62p5", "active_50"}
    passing_primary = [
        row for row in evaluations
        if row["candidate"] in primary_names and row["passes_quality_gate"]
    ]
    passing_primary.sort(key=lambda row: row["q_active_ratio"])
    recommended = passing_primary[0]["candidate"] if passing_primary else None
    result_document = {
        "dataset": {
            "path": str(test_csv),
            "scope": "full official test set",
            "num_samples": len(labels),
            "label_distribution": {
                str(label): int(count)
                for label, count in zip(*np.unique(labels, return_counts=True))
            },
            "not_board_accuracy": True,
        },
        "model_config": model_config,
        "checkpoint_format": checkpoint_format,
        "preprocess_fit_scope": preprocess_info["preprocessing_fit_scope"],
        "quality_gate": {
            "prediction_match_rate_min": 0.99,
            "f1_drop_max": 0.01,
            "denominator_near_zero_count": 0,
        },
        "original_metrics": original_metrics,
        "evaluations": evaluations,
        "recommended_for_second_round_hls": recommended,
    }
    write_json(OUTPUT_DIR / "stage9_active_ratio_eval.json", result_document)
    write_json(
        OUTPUT_DIR / "stage9_active_channel_sets.json",
        {
            "source": str(STAGE4_DIR / "active_channel_sets.json"),
            "sets": active_sets,
            "recommended_for_second_round_hls": recommended,
        },
    )
    csv_rows = []
    for row in evaluations:
        converted = dict(row)
        for key in ("q_active_channels", "k_active_channels", "confusion_matrix"):
            converted[key] = json.dumps(converted[key])
        csv_rows.append(converted)
    pd.DataFrame(csv_rows).to_csv(OUTPUT_DIR / "stage9_active_ratio_eval.csv", index=False)

    table = "\n".join(
        f"| {row['candidate']} | {row['accuracy']:.6f} | {row['f1']:.6f} | "
        f"{row['f1_delta_vs_original']:+.6f} | {row['prediction_match_rate_vs_original']:.6f} | "
        f"{row['denominator_near_zero_count']} | {row['passes_quality_gate']} |"
        for row in evaluations
    )
    summary = f"""# Stage 9 Active-Ratio Sweep

- Dataset: `{test_csv}`
- Scope: full official test set ({len(labels)} samples)
- Preprocessor: saved training-split-only fit, transform only
- Original test F1: {original_metrics['f1']:.6f}
- This is software test-set evaluation, not final PYNQ board accuracy.
- Recommended ratio for second-round HLS: `{recommended}`

| Candidate | Accuracy | F1 | F1 delta | Prediction match | Near-zero denom. | Pass |
|---|---:|---:|---:|---:|---:|---:|
{table}

The quality gate requires prediction match >= 0.99, F1 drop <= 0.01, and no near-zero
denominator. If no candidate below active_87p5 passes, second-round HLS generation must stop.
"""
    (OUTPUT_DIR / "stage9_active_ratio_summary.md").write_text(summary, encoding="utf-8")
    print(pd.DataFrame(csv_rows)[[
        "candidate", "accuracy", "f1", "f1_delta_vs_original",
        "prediction_match_rate_vs_original", "passes_quality_gate"
    ]].to_string(index=False))
    print("Recommended:", recommended)


if __name__ == "__main__":
    main()
