import json
import sys
from pathlib import Path

import numpy as np
import pandas as pd
import torch


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import (
    RESULTS_DIR,
    build_gate_masks,
    classification_metrics,
    compare_to_original,
    denominator_statistics,
    ensure_dir,
    extract_linear_attention_tensors,
    finish_forward,
    load_json,
    load_model,
    load_samples,
    minmax_normalize,
    passes_quality_gate,
    write_json,
)


CALIBRATION_DIR = RESULTS_DIR / "pytorch_calibration"
OUTPUT_DIR = RESULTS_DIR / "active_channel_selection"
# d_model is 16, so 15/16 is the smallest real static pruning step.
ACTIVE_RATIOS = (1.0, 0.9375, 0.875, 0.8125, 0.75, 0.625, 0.5, 0.375, 0.25)


def sensitivity_by_channel(model, tensors, labels, original_logits, original_f1, target):
    d_model = tensors["phi_q"].shape[-1]
    logit_sensitivity = []
    f1_sensitivity = []
    ones_q = torch.ones_like(tensors["phi_q"], dtype=torch.bool)
    ones_k = torch.ones_like(tensors["phi_k"], dtype=torch.bool)
    for channel in range(d_model):
        q_mask = ones_q.clone()
        k_mask = ones_k.clone()
        if target == "q":
            q_mask[:, :, channel] = False
        else:
            k_mask[:, :, channel] = False
        logits = finish_forward(model, tensors, q_mask=q_mask, k_mask=k_mask)["logits"].cpu().numpy()
        metrics = classification_metrics(labels, logits)
        logit_sensitivity.append(float(np.mean(np.abs(logits - original_logits))))
        f1_sensitivity.append(max(0.0, float(original_f1 - metrics["f1"])))
    return np.asarray(logit_sensitivity), np.asarray(f1_sensitivity)


def channel_scores(model, tensors, labels, original_logits, dynamic_q_mask, dynamic_k_mask):
    original = classification_metrics(labels, original_logits)
    phi_q = tensors["phi_q"]
    phi_k = tensors["phi_k"]
    gated_q = phi_q * dynamic_q_mask.float()
    gated_k = phi_k * dynamic_k_mask.float()

    q_active_frequency = dynamic_q_mask.float().mean(dim=(0, 1)).cpu().numpy()
    k_active_frequency = dynamic_k_mask.float().mean(dim=(0, 1)).cpu().numpy()
    q_mean_activation = phi_q.mean(dim=(0, 1)).cpu().numpy()
    k_mean_activation = phi_k.mean(dim=(0, 1)).cpu().numpy()
    key_sum = gated_k.sum(dim=1)
    query_sum = gated_q.sum(dim=1)
    q_denominator_contribution = (
        gated_q * key_sum.unsqueeze(1)
    ).mean(dim=(0, 1)).cpu().numpy()
    k_denominator_contribution = (
        gated_k * query_sum.unsqueeze(1)
    ).mean(dim=(0, 1)).cpu().numpy()

    q_logit_sensitivity, q_f1_sensitivity = sensitivity_by_channel(
        model, tensors, labels, original_logits, original["f1"], "q"
    )
    k_logit_sensitivity, k_f1_sensitivity = sensitivity_by_channel(
        model, tensors, labels, original_logits, original["f1"], "k"
    )

    q_score = (
        minmax_normalize(q_active_frequency)
        + minmax_normalize(q_mean_activation)
        + minmax_normalize(q_denominator_contribution)
        + minmax_normalize(q_logit_sensitivity)
        + minmax_normalize(q_f1_sensitivity)
    )
    k_score = (
        minmax_normalize(k_active_frequency)
        + minmax_normalize(k_mean_activation)
        + minmax_normalize(k_denominator_contribution)
        + minmax_normalize(k_logit_sensitivity)
        + minmax_normalize(k_f1_sensitivity)
    )
    rows = []
    for channel in range(phi_q.shape[-1]):
        rows.append(
            {
                "channel": channel,
                "q_active_frequency": q_active_frequency[channel],
                "k_active_frequency": k_active_frequency[channel],
                "q_mean_phi_activation": q_mean_activation[channel],
                "k_mean_phi_activation": k_mean_activation[channel],
                "q_denominator_contribution": q_denominator_contribution[channel],
                "k_denominator_contribution": k_denominator_contribution[channel],
                "q_logit_sensitivity": q_logit_sensitivity[channel],
                "k_logit_sensitivity": k_logit_sensitivity[channel],
                "q_f1_sensitivity": q_f1_sensitivity[channel],
                "k_f1_sensitivity": k_f1_sensitivity[channel],
                "q_score": q_score[channel],
                "k_score": k_score[channel],
                "combined_score": (q_score[channel] + k_score[channel]) / 2.0,
            }
        )
    return rows


def main():
    ensure_dir(OUTPUT_DIR)
    threshold_document = load_json(CALIBRATION_DIR / "thresholds.json")
    best_config_id = threshold_document.get("best_config_id")
    if best_config_id is None:
        raise RuntimeError("No dynamic-threshold configuration passed; active-channel selection stopped")
    best_threshold = threshold_document["thresholds"][best_config_id]

    model, model_config, checkpoint_format = load_model()
    inputs, labels = load_samples(limit=256)
    tensors = extract_linear_attention_tensors(model, inputs)
    original_logits = model(inputs).detach().cpu().numpy()
    dynamic_q_mask, dynamic_k_mask, _ = build_gate_masks(
        tensors,
        best_threshold["method"],
        best_threshold["threshold_param"],
        best_threshold,
    )
    dynamic_output = finish_forward(
        model, tensors, q_mask=dynamic_q_mask, k_mask=dynamic_k_mask
    )
    dynamic_q_mask = dynamic_output["q_mask"]
    dynamic_k_mask = dynamic_output["k_mask"]

    score_rows = channel_scores(
        model, tensors, labels, original_logits, dynamic_q_mask, dynamic_k_mask
    )
    score_frame = pd.DataFrame(score_rows).sort_values("combined_score", ascending=False)
    score_frame.to_csv(OUTPUT_DIR / "active_channel_scores.csv", index=False)
    q_ranking = score_frame.sort_values("q_score", ascending=False)["channel"].astype(int).tolist()
    k_ranking = score_frame.sort_values("k_score", ascending=False)["channel"].astype(int).tolist()

    d_model = tensors["phi_q"].shape[-1]
    active_sets = {}
    evaluations = []
    reference_dir = ensure_dir(OUTPUT_DIR / "reference_logits")
    for stale_reference in reference_dir.glob("*.npy"):
        stale_reference.unlink()
    for ratio in ACTIVE_RATIOS:
        count = max(1, int(round(d_model * ratio)))
        name = f"active_{str(ratio * 100).rstrip('0').rstrip('.').replace('.', 'p')}"
        q_channels = sorted(q_ranking[:count])
        k_channels = sorted(k_ranking[:count])
        q_mask = torch.zeros_like(tensors["phi_q"], dtype=torch.bool)
        k_mask = torch.zeros_like(tensors["phi_k"], dtype=torch.bool)
        q_mask[:, :, q_channels] = True
        k_mask[:, :, k_channels] = True
        output = finish_forward(model, tensors, q_mask=q_mask, k_mask=k_mask)
        logits = output["logits"].cpu().numpy()
        _, candidate = compare_to_original(labels, original_logits, logits)
        row = {
            "candidate": name,
            "requested_active_ratio": ratio,
            **candidate,
            "q_active_ratio": float(output["q_mask"].float().mean().item()),
            "k_active_ratio": float(output["k_mask"].float().mean().item()),
            **denominator_statistics(output["denominator_raw"]),
        }
        row["passes_quality_gate"] = passes_quality_gate(row)
        evaluations.append(row)
        active_sets[name] = {
            "requested_active_ratio": ratio,
            "active_count": count,
            "q_channels": q_channels,
            "k_channels": k_channels,
        }
        np.save(reference_dir / f"{name}.npy", logits.astype(np.float32))

    passing = [row for row in evaluations if row["passes_quality_gate"]]
    passing.sort(
        key=lambda row: (
            row["q_active_ratio"] + row["k_active_ratio"],
            -row["prediction_match_rate_vs_original"],
            -row["f1"],
        )
    )
    sparse_passing = [row for row in passing if row["q_active_ratio"] < 1.0 or row["k_active_ratio"] < 1.0]
    selected = sparse_passing[0] if sparse_passing else None

    csv_rows = []
    for row in evaluations:
        csv_row = dict(row)
        csv_row["confusion_matrix"] = json.dumps(row["confusion_matrix"])
        csv_rows.append(csv_row)
    pd.DataFrame(csv_rows).to_csv(OUTPUT_DIR / "active_channel_eval.csv", index=False)
    write_json(
        OUTPUT_DIR / "active_channel_sets.json",
        {
            "source_dynamic_config": best_config_id,
            "source_threshold": best_threshold,
            "q_channel_ranking": q_ranking,
            "k_channel_ranking": k_ranking,
            "sets": active_sets,
            "selected_candidate": selected,
            "model_config": model_config,
            "checkpoint_format": checkpoint_format,
        },
    )

    table = "\n".join(
        f"| {row['candidate']} | {row['accuracy']:.6f} | {row['precision']:.6f} | "
        f"{row['recall']:.6f} | {row['f1']:.6f} | {row['f1_delta_vs_original']:.6f} | "
        f"{row['prediction_match_rate_vs_original']:.6f} | {row['q_active_ratio']:.3f} | "
        f"{row['k_active_ratio']:.3f} | {row['passes_quality_gate']} |"
        for row in evaluations
    )
    summary = f"""# Calibration-Guided Active-Channel Selection

- Dynamic calibration source: `{best_config_id}`
- Evaluated samples: {len(labels)}
- Passing static sets: {len(passing)}
- Passing sparse static sets: {len(sparse_passing)}
- Selected HLS candidate: `{selected['candidate'] if selected else None}`

| Candidate | Accuracy | Precision | Recall | F1 | F1 delta | Pred. match | Q active | K active | Pass |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
{table}

The selected Q/K indices are static hardware-generation metadata. A future sparse HLS
variant must reduce active loop bounds; multiplying a full 16-channel loop by a mask would
not count as sparse hardware generation.
"""
    if selected is None:
        summary += "\nNo static set passed. Stop before generating any HLS variants.\n"
    else:
        selected_set = active_sets[selected["candidate"]]
        summary += (
            f"\nSelected Q channels: `{selected_set['q_channels']}`\n\n"
            f"Selected K channels: `{selected_set['k_channels']}`\n"
        )
    (OUTPUT_DIR / "active_channel_summary.md").write_text(summary, encoding="utf-8")
    print("Source dynamic config:", best_config_id)
    print("Passing static sets:", len(passing))
    print("Selected candidate:", json.dumps(selected, indent=2))
    print("Evaluation:", OUTPUT_DIR / "active_channel_eval.csv")
    if selected is None:
        raise SystemExit(2)


if __name__ == "__main__":
    main()
