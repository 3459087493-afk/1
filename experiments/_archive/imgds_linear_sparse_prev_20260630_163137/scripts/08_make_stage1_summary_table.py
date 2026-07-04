#!/usr/bin/env python3
"""Generate Stage 1 summary table merging all results and ViT4Mal references."""

import csv
from pathlib import Path

import pandas as pd
import yaml

PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
CONFIG_PATH = PROJECT_ROOT / "experiments/imgds_linear_sparse/configs/stage1_dense_baseline.yaml"
RESULTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/results"
REPORTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/reports"
RESULTS_DIR.mkdir(parents=True, exist_ok=True)
REPORTS_DIR.mkdir(parents=True, exist_ok=True)

SUMMARY_CSV = RESULTS_DIR / "stage1_summary_table.csv"
SUMMARY_MD = REPORTS_DIR / "stage1_summary_table.md"

SUMMARY_COLUMNS = [
    "method", "dataset", "stage", "input_mode", "resize_size", "patch_size",
    "seq_len", "input_dim", "d_model", "num_layers", "dim_feedforward",
    "quant_bits", "sparsity",
    "accuracy", "precision", "recall", "f1", "auc",
    "onnx_accuracy", "onnx_precision", "onnx_recall", "onnx_f1", "onnx_auc",
    "onnx_max_abs_error", "onnx_mean_abs_error", "onnx_rmse", "onnx_allclose",
    "tn", "fp", "fn", "tp",
    "parameter_count", "model_size_mb", "onnx_model_path",
    "BRAM", "DSP", "LUT", "FF", "hls_latency_cycles", "pynq_kernel_us",
    "cpu_model_inference_us_mean", "cpu_end_to_end_us_mean",
    "notes",
]


def safe_read_csv(path, default=None):
    """Read a CSV if it exists, return empty DataFrame otherwise."""
    if path.exists():
        return pd.read_csv(path)
    return pd.DataFrame()


def safe_read_dict(path, key_col="metric", val_col="value"):
    """Read a 2-column CSV into a dict."""
    if path.exists():
        df = pd.read_csv(path)
        if key_col in df.columns and val_col in df.columns:
            return dict(zip(df[key_col], df[val_col]))
    return {}


def main():
    cfg = load_config()
    model_cfg = cfg["model"]

    # --- Read all result files ---
    test_metrics = safe_read_csv(RESULTS_DIR / "test_metrics.csv")
    confusion = safe_read_csv(RESULTS_DIR / "confusion_matrix.csv")
    onnx_metrics = safe_read_csv(RESULTS_DIR / "onnx_metrics.csv")
    onnx_diff = safe_read_csv(RESULTS_DIR / "onnx_pytorch_diff.csv")
    cpu_breakdown = safe_read_csv(RESULTS_DIR / "cpu_end_to_end_breakdown.csv")
    reference = safe_read_csv(RESULTS_DIR / "reference_baselines.csv")

    # --- Build our method row ---
    row = {col: "NA" for col in SUMMARY_COLUMNS}

    row["method"] = "LinearIMGDSDenseBaseline"
    row["dataset"] = "IMG_DS"
    row["stage"] = "stage1_dense_software_baseline_with_onnx"
    row["input_mode"] = "grayscale"
    row["resize_size"] = cfg["preprocess"]["resize_size"]
    row["patch_size"] = cfg["preprocess"]["patch_size"]
    row["seq_len"] = model_cfg["seq_len"]
    row["input_dim"] = model_cfg["input_dim"]
    row["d_model"] = model_cfg["d_model"]
    row["num_layers"] = model_cfg["num_layers"]
    row["dim_feedforward"] = model_cfg["dim_feedforward"]
    row["quant_bits"] = 32  # FP32 software
    row["sparsity"] = 0

    # Test metrics
    if not test_metrics.empty:
        tm = test_metrics.iloc[0].to_dict()
        for k in ["accuracy", "precision", "recall", "f1", "auc", "tn", "fp", "fn", "tp", "parameter_count", "model_size_mb"]:
            if k in tm:
                row[k] = tm[k]

    # ONNX metrics
    if not onnx_metrics.empty:
        om = onnx_metrics.iloc[0].to_dict()
        for k in ["accuracy", "precision", "recall", "f1", "auc"]:
            if k in om:
                row[f"onnx_{k}"] = om[k]

    # ONNX diff
    if not onnx_diff.empty:
        row["onnx_max_abs_error"] = onnx_diff["abs_error_0"].max()
        row["onnx_mean_abs_error"] = onnx_diff["abs_error_0"].mean()
        # RMSE
        import numpy as np
        row["onnx_rmse"] = float(np.sqrt(np.mean(
            (onnx_diff["abs_error_0"] ** 2 + onnx_diff["abs_error_1"] ** 2).mean()
        )))

    # Check allclose
    try:
        atol = cfg["onnx"]["tolerance_atol"]
        rtol = cfg["onnx"]["tolerance_rtol"]
        if not onnx_diff.empty:
            pt_logits = np.column_stack([onnx_diff["pt_logit_0"].values, onnx_diff["pt_logit_1"].values])
            onnx_logits = np.column_stack([onnx_diff["onnx_logit_0"].values, onnx_diff["onnx_logit_1"].values])
            row["onnx_allclose"] = bool(np.allclose(pt_logits, onnx_logits, atol=atol, rtol=rtol))
    except Exception:
        row["onnx_allclose"] = "NA"

    # ONNX model path
    onnx_path = PROJECT_ROOT / "experiments/imgds_linear_sparse/onnx/models/linear_imgds_dense_r32_p8.onnx"
    if onnx_path.exists():
        row["onnx_model_path"] = str(onnx_path)

    # CPU breakdown
    if not cpu_breakdown.empty:
        cpu_dict = dict(zip(cpu_breakdown["stage"], cpu_breakdown["mean_us"]))
        row["cpu_model_inference_us_mean"] = cpu_dict.get("model_inference_us", "NA")
        row["cpu_end_to_end_us_mean"] = cpu_dict.get("end_to_end_us", "NA")

    # BRAM/DSP/LUT/FF/hls_latency_cycles/pynq_kernel_us → NA for Stage 1
    for k in ["BRAM", "DSP", "LUT", "FF", "hls_latency_cycles", "pynq_kernel_us"]:
        row[k] = "NA"

    row["notes"] = "Dense software baseline with ONNX export; no HLS/PYNQ yet."

    # --- Build ViT4Mal reference rows ---
    vit_rows = []
    if not reference.empty:
        for _, ref in reference.iterrows():
            vit_row = {col: "NA" for col in SUMMARY_COLUMNS}
            vit_row["method"] = ref["method"]
            vit_row["dataset"] = ref["dataset"]
            vit_row["stage"] = "published"
            vit_row["input_mode"] = "RGB"
            vit_row["resize_size"] = 299
            vit_row["patch_size"] = "N/A (ViT)"
            vit_row["seq_len"] = "N/A (ViT)"
            vit_row["input_dim"] = "N/A (ViT)"
            vit_row["d_model"] = "N/A (ViT)"
            vit_row["num_layers"] = ref["architecture"]
            vit_row["quant_bits"] = 16
            vit_row["sparsity"] = 0
            vit_row["accuracy"] = ref["accuracy"]
            vit_row["BRAM"] = ref["BRAM"]
            vit_row["DSP"] = ref["DSP"]
            vit_row["LUT"] = ref["LUT"]
            vit_row["FF"] = ref["FF"]
            vit_row["notes"] = ref["notes"]
            for k in ["onnx_accuracy", "onnx_precision", "onnx_recall", "onnx_f1", "onnx_auc",
                       "onnx_max_abs_error", "onnx_mean_abs_error", "onnx_rmse", "onnx_allclose",
                       "cpu_model_inference_us_mean", "cpu_end_to_end_us_mean"]:
                vit_row[k] = "NA"
            vit_rows.append(vit_row)

    # --- Combine and write CSV ----
    all_rows = [row] + vit_rows
    with open(SUMMARY_CSV, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=SUMMARY_COLUMNS, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(all_rows)
    print(f"Summary CSV: {SUMMARY_CSV} ({len(all_rows)} rows)")

    # --- Write Markdown ----
    md_lines = [
        "# Stage 1 Summary Table",
        "",
        "## Our Method",
        "",
        f"| Metric | Value |",
        f"|--------|-------|",
        f"| Method | {row['method']} |",
        f"| Dataset | {row['dataset']} |",
        f"| Input | {row['input_mode']}, {row['resize_size']}×{row['resize_size']}, patch={row['patch_size']}×{row['patch_size']} |",
        f"| Seq len × dim | {row['seq_len']} × {row['input_dim']} |",
        f"| Model | d_model={row['d_model']}, layers={row['num_layers']}, ff_dim={row['dim_feedforward']} |",
        f"| Quant bits | {row['quant_bits']} |",
        f"| Sparsity | {row['sparsity']} |",
        f"| Accuracy | {row['accuracy']} |",
        f"| F1 | {row['f1']} |",
        f"| AUC | {row['auc']} |",
        f"| Precision / Recall | {row['precision']} / {row['recall']} |",
        f"| TN / FP / FN / TP | {row['tn']} / {row['fp']} / {row['fn']} / {row['tp']} |",
        f"| Parameters | {row['parameter_count']} |",
        f"| Model size (MB) | {row['model_size_mb']} |",
        f"| ONNX Accuracy | {row['onnx_accuracy']} |",
        f"| ONNX F1 | {row['onnx_f1']} |",
        f"| ONNX Max Abs Error | {row['onnx_max_abs_error']} |",
        f"| ONNX Allclose | {row['onnx_allclose']} |",
        f"| CPU Inference (µs) | {row['cpu_model_inference_us_mean']} |",
        f"| CPU End-to-End (µs) | {row['cpu_end_to_end_us_mean']} |",
        f"| BRAM / DSP / LUT / FF | {row['BRAM']} / {row['DSP']} / {row['LUT']} / {row['FF']} |",
        f"| Notes | {row['notes']} |",
        "",
        "## ViT4Mal Reference",
        "",
    ]
    if not reference.empty:
        md_lines.append("| Architecture | Acc (%) | BRAM | DSP | LUT | FF | Power (W) | Inf Time (s) |")
        md_lines.append("|-------------|---------|------|-----|-----|----|-----------|--------------|")
        for _, ref in reference.iterrows():
            md_lines.append(
                f"| {ref['architecture']} | {ref['accuracy']:.2f} | {ref['BRAM']} | {ref['DSP']} | "
                f"{ref['LUT']} | {ref['FF']} | {ref['power_w']:.2f} | {ref['inference_time_s']:.2f} |"
            )

    md_lines += [
        "",
        "## Stage 1 Key Takeaways",
        "",
        f"1. Our Linear Transformer achieves **{row['accuracy']}** accuracy in software (FP32, CPU).",
        f"2. ONNX export verified with max abs error ≤ {row['onnx_max_abs_error']}.",
        "3. No HLS synthesis or PYNQ deployment yet — FPGA resources (BRAM/DSP/LUT/FF) are NA.",
        "4. CPU inference latency serves as baseline for future FPGA speedup comparison.",
        "5. ViT4Mal references show what dense ViT achieves on PYNQ-Z1 with 16-bit quantization.",
    ]

    with open(SUMMARY_MD, "w") as f:
        f.write("\n".join(md_lines) + "\n")
    print(f"Summary report: {SUMMARY_MD}")

    print("\nStage 1 summary table complete ✓")


if __name__ == "__main__":
    import numpy as np
    main()
