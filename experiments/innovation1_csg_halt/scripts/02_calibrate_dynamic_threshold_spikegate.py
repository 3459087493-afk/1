import json
import sys
from pathlib import Path

import numpy as np
import pandas as pd


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
    load_model,
    load_samples,
    passes_quality_gate,
    write_json,
)


OUTPUT_DIR = RESULTS_DIR / "pytorch_calibration"


def evaluate_configuration(
    config_id,
    method,
    threshold_param,
    model,
    tensors,
    labels,
    original_logits,
    threshold_record=None,
):
    q_mask, k_mask, generated_thresholds = build_gate_masks(
        tensors, method, threshold_param, threshold_record
    )
    output = finish_forward(model, tensors, q_mask=q_mask, k_mask=k_mask)
    candidate_logits = output["logits"].cpu().numpy()
    _, candidate_metrics = compare_to_original(labels, original_logits, candidate_logits)
    q_ratio = float(output["q_mask"].float().mean().item())
    k_ratio = float(output["k_mask"].float().mean().item())
    row = {
        "config_id": config_id,
        "method": method,
        "threshold_param": float(threshold_param),
        **candidate_metrics,
        "q_active_ratio": q_ratio,
        "k_active_ratio": k_ratio,
        "estimated_attention_mac_reduction": max(0.0, 1.0 - (q_ratio + k_ratio) / 2.0),
        **denominator_statistics(output["denominator_raw"]),
    }
    row["passes_quality_gate"] = passes_quality_gate(row) and (
        row["q_active_ratio"] < 0.999 or row["k_active_ratio"] < 0.999
    )
    return row, generated_thresholds, candidate_logits


def main():
    ensure_dir(OUTPUT_DIR)
    model, model_config, checkpoint_format = load_model()
    inputs, labels = load_samples(limit=256)
    tensors = extract_linear_attention_tensors(model, inputs)
    original_logits = model(inputs).detach().cpu().numpy()
    manual_logits = finish_forward(model, tensors)["logits"].cpu().numpy()
    no_gate_error = float(np.max(np.abs(original_logits - manual_logits)))
    if no_gate_error > 2e-6:
        raise RuntimeError(f"Local analyzer does not match the original model: {no_gate_error}")

    original_metrics = classification_metrics(labels, original_logits)
    original_metrics.pop("predictions")
    configurations = []
    thresholds = {}
    reference_dir = ensure_dir(OUTPUT_DIR / "reference_logits")
    for stale_reference in reference_dir.glob("*.npy"):
        stale_reference.unlink()

    experiments = []
    experiments.extend(
        ("percentile", value)
        for value in (0, 0.1, 0.25, 0.5, 1, 2, 3, 5, 10, 20, 30, 40, 50)
    )
    experiments.extend(
        ("dynamic_mad", value) for value in (-0.5, 0, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5)
    )
    experiments.extend(
        ("homeostatic", value) for value in (0.99, 0.98, 0.95, 0.9, 0.8, 0.7, 0.6, 0.5)
    )

    for index, (method, parameter) in enumerate(experiments):
        config_id = f"dt_{index:02d}_{method}_{str(parameter).replace('.', 'p').replace('-', 'm')}"
        row, threshold_record, logits = evaluate_configuration(
            config_id=config_id,
            method=method,
            threshold_param=parameter,
            model=model,
            tensors=tensors,
            labels=labels,
            original_logits=original_logits,
        )
        configurations.append(row)
        thresholds[config_id] = {
            "method": method,
            "threshold_param": float(parameter),
            **threshold_record,
        }
        np.save(reference_dir / f"{config_id}.npy", logits.astype(np.float32))

    passing = [row for row in configurations if row["passes_quality_gate"]]
    passing.sort(
        key=lambda row: (
            (row["q_active_ratio"] + row["k_active_ratio"]) / 2.0,
            -row["prediction_match_rate_vs_original"],
            -row["f1"],
        )
    )
    best = passing[0] if passing else None

    csv_rows = []
    for row in configurations:
        csv_row = dict(row)
        csv_row["confusion_matrix"] = json.dumps(row["confusion_matrix"])
        csv_rows.append(csv_row)
    pd.DataFrame(csv_rows).to_csv(OUTPUT_DIR / "dynamic_threshold_results.csv", index=False)
    write_json(
        OUTPUT_DIR / "dynamic_threshold_results.json",
        {
            "model_config": model_config,
            "checkpoint_format": checkpoint_format,
            "samples": len(labels),
            "label_distribution": dict(
                zip(*[array.tolist() for array in np.unique(labels, return_counts=True)])
            ),
            "no_gate_max_abs_error": no_gate_error,
            "original_metrics": original_metrics,
            "passing_config_count": len(passing),
            "best_config": best,
            "configurations": configurations,
        },
    )
    write_json(
        OUTPUT_DIR / "thresholds.json",
        {
            "best_config_id": best["config_id"] if best else None,
            "thresholds": thresholds,
        },
    )

    top_rows = sorted(
        configurations,
        key=lambda row: (
            not row["passes_quality_gate"],
            (row["q_active_ratio"] + row["k_active_ratio"]) / 2.0,
        ),
    )[:10]
    table = "\n".join(
        f"| {row['config_id']} | {row['f1']:.6f} | {row['f1_delta_vs_original']:.6f} | "
        f"{row['prediction_match_rate_vs_original']:.6f} | {row['q_active_ratio']:.4f} | "
        f"{row['k_active_ratio']:.4f} | {row['passes_quality_gate']} |"
        for row in top_rows
    )
    summary = f"""# Dynamic-Threshold Spike-Gate Calibration

- Samples: {len(labels)}
- Task: UNSW-NB15 binary anomaly detection (`0=normal`, `1=anomaly/attack`)
- Original F1 on calibration samples: {original_metrics['f1']:.6f}
- No-gate wrapper maximum error: {no_gate_error:.12g}
- Tested configurations: {len(configurations)}
- Passing configurations: {len(passing)}
- Best configuration: `{best['config_id'] if best else None}`

| Config | F1 | F1 delta | Prediction match | Q active | K active | Pass |
|---|---:|---:|---:|---:|---:|---:|
{table}

The spike-inspired gate is a calibration instrument, not the final HLS implementation.
Only a passing configuration may be used to derive static active-channel sets. The gate
does not remove softmax because this Linear Attention model has no softmax.
"""
    if best is None:
        summary += "\nNo configuration passed; stop before active-channel HLS generation.\n"
    (OUTPUT_DIR / "dynamic_threshold_summary.md").write_text(summary, encoding="utf-8")
    print("Original metrics:", json.dumps(original_metrics, indent=2))
    print("Passing configurations:", len(passing))
    print("Best configuration:", json.dumps(best, indent=2))
    print("Results:", OUTPUT_DIR / "dynamic_threshold_results.csv")


if __name__ == "__main__":
    main()
