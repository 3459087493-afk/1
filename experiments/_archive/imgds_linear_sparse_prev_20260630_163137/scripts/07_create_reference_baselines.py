#!/usr/bin/env python3
"""Generate ViT4Mal reference baseline tables for Stage 1 comparison."""

import csv
from pathlib import Path

PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
RESULTS_DIR = PROJECT_ROOT / "experiments" / "imgds_linear_sparse" / "results"
REPORTS_DIR = PROJECT_ROOT / "experiments" / "imgds_linear_sparse" / "reports"
RESULTS_DIR.mkdir(parents=True, exist_ok=True)
REPORTS_DIR.mkdir(parents=True, exist_ok=True)

CSV_PATH = RESULTS_DIR / "reference_baselines.csv"
MD_PATH = REPORTS_DIR / "reference_baselines.md"

# Fixed data from ViT4Mal Table 13
ROWS = [
    {
        "method": "ViT4Mal",
        "dataset": "IMG_DS",
        "board": "PYNQ-Z1",
        "architecture": "4 encoders & 4 heads",
        "accuracy": 92.16, "BRAM": 84, "DSP": 69, "LUT": 16135, "FF": 16364,
        "power_w": 1.89, "inference_time_s": 2.82, "notes": "dense ViT",
    },
    {
        "method": "ViT4Mal",
        "dataset": "IMG_DS",
        "board": "PYNQ-Z1",
        "architecture": "4 encoders & 2 heads",
        "accuracy": 93.16, "BRAM": 92, "DSP": 69, "LUT": 16200, "FF": 16390,
        "power_w": 1.90, "inference_time_s": 2.81, "notes": "dense ViT",
    },
    {
        "method": "ViT4Mal",
        "dataset": "IMG_DS",
        "board": "PYNQ-Z1",
        "architecture": "2 encoders & 4 heads",
        "accuracy": 93.89, "BRAM": 84, "DSP": 69, "LUT": 16079, "FF": 16356,
        "power_w": 1.87, "inference_time_s": 1.48, "notes": "dense ViT recommended",
    },
    {
        "method": "ViT4Mal",
        "dataset": "IMG_DS",
        "board": "PYNQ-Z1",
        "architecture": "2 encoders & 2 heads",
        "accuracy": 93.86, "BRAM": 92, "DSP": 69, "LUT": 16219, "FF": 16393,
        "power_w": 1.88, "inference_time_s": 1.45, "notes": "dense ViT",
    },
    {
        "method": "ViT4Mal",
        "dataset": "IMG_DS",
        "board": "PYNQ-Z1",
        "architecture": "1 encoder & 4 heads",
        "accuracy": 92.47, "BRAM": 84, "DSP": 69, "LUT": 16029, "FF": 16358,
        "power_w": 1.85, "inference_time_s": 0.87, "notes": "dense ViT",
    },
    {
        "method": "ViT4Mal",
        "dataset": "IMG_DS",
        "board": "PYNQ-Z1",
        "architecture": "1 encoder & 2 heads",
        "accuracy": 92.41, "BRAM": 92, "DSP": 69, "LUT": 16545, "FF": 16911,
        "power_w": 1.89, "inference_time_s": 0.81, "notes": "dense ViT fastest",
    },
]

FIELD_NAMES = [
    "method", "dataset", "board", "architecture", "accuracy",
    "BRAM", "DSP", "LUT", "FF", "power_w", "inference_time_s", "notes",
]


def main():
    # Write CSV
    with open(CSV_PATH, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=FIELD_NAMES)
        writer.writeheader()
        writer.writerows(ROWS)
    print(f"Reference baselines CSV: {CSV_PATH}")

    # Write Markdown
    md_lines = [
        "# ViT4Mal Reference Baselines",
        "",
        "From ViT4Mal paper Table 13 — IMG_DS dataset on PYNQ-Z1.",
        "",
        "| Architecture | Acc (%) | BRAM | DSP | LUT | FF | Power (W) | Inf Time (s) | Notes |",
        "|-------------|---------|------|-----|-----|----|-----------|--------------|-------|",
    ]
    for r in ROWS:
        md_lines.append(
            f"| {r['architecture']} | {r['accuracy']:.2f} | {r['BRAM']} | {r['DSP']} | "
            f"{r['LUT']} | {r['FF']} | {r['power_w']:.2f} | {r['inference_time_s']:.2f} | {r['notes']} |"
        )
    md_lines += [
        "",
        "## Notes",
        "",
        "- All ViT4Mal configurations use **dense ViT attention** (quadratic complexity).",
        "- Quantization: **16-bit** fixed-point.",
        "- FPGA techniques: loop pipelining, array partitioning.",
        "- Our Linear Transformer (Stage 1) replaces dense attention with **linear-complexity** kernelized attention.",
        "- Stage 1 does **not** include HLS synthesis or PYNQ deployment — those come in later stages.",
    ]

    with open(MD_PATH, "w") as f:
        f.write("\n".join(md_lines) + "\n")
    print(f"Reference baselines report: {MD_PATH}")


if __name__ == "__main__":
    main()
