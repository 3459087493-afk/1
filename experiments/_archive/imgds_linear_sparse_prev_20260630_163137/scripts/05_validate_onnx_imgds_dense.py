#!/usr/bin/env python3
"""Validate exported ONNX model against PyTorch baseline.

Checks ONNX model structure, runs onnxruntime inference, compares logits,
computes metrics, and records operator histogram.
"""

import csv
import sys
import time
from collections import Counter
from pathlib import Path

import numpy as np
import torch
import yaml

# ---- paths ----
PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

SCRIPTS_DIR = PROJECT_ROOT / "experiments" / "imgds_linear_sparse" / "scripts"
if str(SCRIPTS_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPTS_DIR))
from imgds_model import LinearIMGDSDenseBaseline  # noqa: E402

CONFIG_PATH = PROJECT_ROOT / "experiments/imgds_linear_sparse/configs/stage1_dense_baseline.yaml"
CKPT_PATH = PROJECT_ROOT / "experiments/imgds_linear_sparse/checkpoints/best_linear_imgds_dense_r32_p8.pt"
ONNX_MODEL_PATH = PROJECT_ROOT / "experiments/imgds_linear_sparse/onnx/models/linear_imgds_dense_r32_p8.onnx"
OUTPUTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/outputs"
RESULTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/results"
ONNX_REPORT_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/onnx/reports"

for d in [RESULTS_DIR, ONNX_REPORT_DIR]:
    d.mkdir(parents=True, exist_ok=True)

ONNX_VALIDATION_REPORT = ONNX_REPORT_DIR / "onnx_validation_report.md"
ONNX_GRAPH_STATS = ONNX_REPORT_DIR / "onnx_graph_stats.csv"
ONNX_METRICS_CSV = RESULTS_DIR / "onnx_metrics.csv"
ONNX_PYTORCH_DIFF_CSV = RESULTS_DIR / "onnx_pytorch_diff.csv"


def load_config():
    with open(CONFIG_PATH) as f:
        return yaml.safe_load(f)


def check_onnx_available():
    """Check that onnx and onnxruntime are installed."""
    missing = []
    try:
        import onnx  # noqa: F401
    except ImportError:
        missing.append("onnx")
    try:
        import onnxruntime  # noqa: F401
    except ImportError:
        missing.append("onnxruntime")
    if missing:
        print("=" * 60)
        print("ERROR: Missing required packages!")
        print(f"  Missing: {', '.join(missing)}")
        print("  Install with:")
        print(f"    pip install {' '.join(missing)} onnxscript")
        print("=" * 60)
        sys.exit(1)


def main():
    check_onnx_available()
    import onnx
    import onnxruntime as ort

    cfg = load_config()
    onnx_cfg = cfg["onnx"]
    model_cfg = cfg["model"]
    device = torch.device("cpu")

    print("=" * 60)
    print("ONNX Validation — IMG_DS Linear Transformer Dense Baseline")
    print("=" * 60)

    # ---- 1. Check ONNX model structure ----
    print("\n[1/5] Checking ONNX model...")
    onnx_model = onnx.load(str(ONNX_MODEL_PATH))
    onnx.checker.check_model(onnx_model)
    print("  ✓ ONNX model is valid")

    # ONNX graph stats
    graph = onnx_model.graph
    node_count = len(graph.node)
    initializer_count = len(graph.initializer)
    op_histogram = Counter()
    for node in graph.node:
        op_histogram[node.op_type] += 1

    print(f"  Nodes: {node_count}")
    print(f"  Initializers: {initializer_count}")
    print(f"  Operators: {dict(op_histogram)}")

    # Save graph stats
    with open(ONNX_GRAPH_STATS, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["metric", "value"])
        writer.writerow(["node_count", node_count])
        writer.writerow(["initializer_count", initializer_count])
        for op, count in sorted(op_histogram.items(), key=lambda x: -x[1]):
            writer.writerow([f"op_{op}", count])
    print(f"  Graph stats: {ONNX_GRAPH_STATS}")

    # ---- 2. Load PyTorch model ----
    print("\n[2/5] Loading PyTorch model...")
    if not CKPT_PATH.exists():
        print(f"ERROR: Checkpoint not found: {CKPT_PATH}")
        sys.exit(1)
    ckpt = torch.load(CKPT_PATH, map_location=device, weights_only=False)
    model = LinearIMGDSDenseBaseline(
        input_dim=model_cfg["input_dim"],
        seq_len=model_cfg["seq_len"],
        d_model=model_cfg["d_model"],
        dim_feedforward=model_cfg["dim_feedforward"],
        num_layers=model_cfg["num_layers"],
        dropout=model_cfg["dropout"],
        num_classes=model_cfg["num_classes"],
    )
    model.load_state_dict(ckpt["model_state_dict"])
    model.eval()
    model.to(device)
    print(f"  ✓ PyTorch model loaded (epoch {ckpt.get('epoch', '?')}, val_f1={ckpt.get('val_f1', '?'):.4f})")

    # ---- 3. Load ONNX Runtime session ----
    print("\n[3/5] Loading ONNX Runtime session...")
    ort_session = ort.InferenceSession(str(ONNX_MODEL_PATH))
    input_name_ort = ort_session.get_inputs()[0].name
    output_name_ort = ort_session.get_outputs()[0].name
    print(f"  Input:  {input_name_ort} {ort_session.get_inputs()[0].shape}")
    print(f"  Output: {output_name_ort} {ort_session.get_outputs()[0].shape}")

    # ---- 4. Compare logits on test samples ----
    print("\n[4/5] Comparing PyTorch vs ONNX logits...")
    test_data = np.load(OUTPUTS_DIR / "imgds_r32_p8_test.npz")
    X_test = test_data["X"]
    y_test = test_data["y"]

    n_compare = min(200, len(X_test))
    X_compare = X_test[:n_compare]
    y_compare = y_test[:n_compare]

    # PyTorch inference
    with torch.no_grad():
        pt_logits = model(torch.tensor(X_compare)).cpu().numpy()

    # ONNX inference
    ort_inputs = {input_name_ort: X_compare.astype(np.float32)}
    onnx_logits = ort_session.run([output_name_ort], ort_inputs)[0]

    # Compute differences
    abs_errors = np.abs(pt_logits - onnx_logits)
    max_abs_error = float(np.max(abs_errors))
    mean_abs_error = float(np.mean(abs_errors))
    rmse = float(np.sqrt(np.mean((pt_logits - onnx_logits) ** 2)))

    atol = onnx_cfg["tolerance_atol"]
    rtol = onnx_cfg["tolerance_rtol"]
    allclose = bool(np.allclose(pt_logits, onnx_logits, atol=atol, rtol=rtol))

    print(f"  Max abs error:      {max_abs_error:.8f}")
    print(f"  Mean abs error:     {mean_abs_error:.8f}")
    print(f"  RMSE:               {rmse:.8f}")
    print(f"  Allclose (atol={atol}, rtol={rtol}): {allclose}")

    # Save PyTorch vs ONNX diff
    diff_rows = []
    for i in range(n_compare):
        diff_rows.append({
            "sample": i,
            "true_label": int(y_compare[i]),
            "pt_logit_0": float(pt_logits[i, 0]),
            "pt_logit_1": float(pt_logits[i, 1]),
            "onnx_logit_0": float(onnx_logits[i, 0]),
            "onnx_logit_1": float(onnx_logits[i, 1]),
            "abs_error_0": float(abs_errors[i, 0]),
            "abs_error_1": float(abs_errors[i, 1]),
        })
    with open(ONNX_PYTORCH_DIFF_CSV, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=diff_rows[0].keys())
        writer.writeheader()
        writer.writerows(diff_rows)
    print(f"  Diff CSV: {ONNX_PYTORCH_DIFF_CSV}")

    # ---- 5. ONNX Runtime metrics on test set ----
    print("\n[5/5] Computing ONNX Runtime metrics...")
    from sklearn.metrics import (
        accuracy_score,
        f1_score,
        precision_score,
        recall_score,
        roc_auc_score,
    )

    all_onnx_logits = []
    all_labels = []

    batch_size = 128
    for i in range(0, len(X_test), batch_size):
        batch = X_test[i:i + batch_size].astype(np.float32)
        labels_batch = y_test[i:i + batch_size]
        ort_inputs = {input_name_ort: batch}
        onnx_out = ort_session.run([output_name_ort], ort_inputs)[0]
        all_onnx_logits.append(onnx_out)
        all_labels.append(labels_batch)

    all_onnx_logits = np.concatenate(all_onnx_logits, axis=0)
    all_labels = np.concatenate(all_labels, axis=0)
    onnx_probs = torch.softmax(torch.tensor(all_onnx_logits), dim=1).numpy()
    onnx_preds = np.argmax(all_onnx_logits, axis=1)

    onnx_metrics = {
        "accuracy": float(accuracy_score(all_labels, onnx_preds)),
        "precision": float(precision_score(all_labels, onnx_preds, zero_division=0)),
        "recall": float(recall_score(all_labels, onnx_preds, zero_division=0)),
        "f1": float(f1_score(all_labels, onnx_preds, zero_division=0)),
        "auc": float(roc_auc_score(all_labels, onnx_probs[:, 1])),
    }

    print(f"  ONNX Accuracy:  {onnx_metrics['accuracy']:.4f}")
    print(f"  ONNX F1:        {onnx_metrics['f1']:.4f}")
    print(f"  ONNX AUC:       {onnx_metrics['auc']:.4f}")

    with open(ONNX_METRICS_CSV, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=onnx_metrics.keys())
        writer.writeheader()
        writer.writerow(onnx_metrics)
    print(f"  ONNX metrics: {ONNX_METRICS_CSV}")

    # ---- ONNX validation report ----
    onnx_file_size_mb = ONNX_MODEL_PATH.stat().st_size / (1024 * 1024)
    report = f"""# ONNX Validation Report

## ONNX Model Check

| Metric | Value |
|--------|-------|
| Model path | {ONNX_MODEL_PATH} |
| Valid | ✓ (onnx.checker passed) |
| Nodes | {node_count} |
| Initializers | {initializer_count} |
| File size | {onnx_file_size_mb:.4f} MB |

## Operator Histogram

```
{dict(op_histogram)}
```

## Numerical Comparison (PyTorch vs ONNX)

| Metric | Value |
|--------|-------|
| Samples compared | {n_compare} |
| Max absolute error | {max_abs_error:.8f} |
| Mean absolute error | {mean_abs_error:.8f} |
| RMSE | {rmse:.8f} |
| Allclose (atol={atol}, rtol={rtol}) | {allclose} |

## ONNX Runtime Test Set Metrics

| Metric | Value |
|--------|-------|
| Accuracy | {onnx_metrics['accuracy']:.4f} |
| Precision | {onnx_metrics['precision']:.4f} |
| Recall | {onnx_metrics['recall']:.4f} |
| F1 | {onnx_metrics['f1']:.4f} |
| AUC | {onnx_metrics['auc']:.4f} |

## Conclusion

ONNX export is numerically valid with {'✓ allclose passed' if allclose else '⚠  allclose failed — check tolerance'}. The ONNX model can be used as a reference for future HLS code generation.
"""
    with open(ONNX_VALIDATION_REPORT, "w") as f:
        f.write(report)
    print(f"\nValidation report: {ONNX_VALIDATION_REPORT}")

    print("\n" + "=" * 60)
    print("ONNX Validation complete.")
    print(f"  Allclose: {allclose}")
    print(f"  Max abs error: {max_abs_error:.2e}")
    print("=" * 60)


if __name__ == "__main__":
    main()
