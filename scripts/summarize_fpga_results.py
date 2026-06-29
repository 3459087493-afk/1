#!/usr/bin/env python3
"""Summarize PYNQ-Z2 FPGA scores against PyTorch scores and labels."""

from __future__ import annotations

import argparse
from pathlib import Path

import numpy as np
import pandas as pd
from sklearn.metrics import accuracy_score, classification_report, f1_score, precision_score, recall_score


PROJECT_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_RESULTS_DIR = PROJECT_ROOT / "results" / "fpga_pynq_z2"


def display_path(path: Path) -> str:
    try:
        return str(path.resolve().relative_to(PROJECT_ROOT))
    except ValueError:
        return str(path)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--samples", type=Path, default=DEFAULT_RESULTS_DIR / "validation_samples.csv")
    parser.add_argument("--fpga-results", type=Path, default=DEFAULT_RESULTS_DIR / "fpga_results.csv")
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_RESULTS_DIR)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    samples = pd.read_csv(args.samples)
    fpga = pd.read_csv(args.fpga_results)
    df = samples.merge(fpga, on="sample_id", validate="one_to_one")

    df["abs_error"] = (df["fpga_score"] - df["pytorch_score"]).abs()
    df["rel_error"] = df["abs_error"] / np.maximum(df["pytorch_score"].abs(), 1e-6)
    df["pytorch_pred"] = (df["pytorch_score"] > 0).astype(int)
    df["fpga_pred"] = (df["fpga_score"] > 0).astype(int)
    df["pred_match"] = df["pytorch_pred"] == df["fpga_pred"]

    args.output_dir.mkdir(parents=True, exist_ok=True)
    merged_path = args.output_dir / "comparison.csv"
    report_path = args.output_dir / "summary.txt"
    df.to_csv(merged_path, index=False)

    lines = []
    lines.append(f"samples: {len(df)}")
    lines.append(f"score abs_error mean: {df['abs_error'].mean():.8f}")
    lines.append(f"score abs_error max : {df['abs_error'].max():.8f}")
    lines.append(f"score rel_error mean: {df['rel_error'].mean():.8f}")
    lines.append(f"prediction match rate PyTorch vs FPGA: {df['pred_match'].mean():.6f}")
    lines.append("")
    lines.append(f"latency_us mean: {df['latency_us'].mean():.3f}")
    lines.append(f"latency_us p50 : {df['latency_us'].quantile(0.50):.3f}")
    lines.append(f"latency_us p95 : {df['latency_us'].quantile(0.95):.3f}")
    lines.append(f"latency_us min : {df['latency_us'].min():.3f}")
    lines.append(f"latency_us max : {df['latency_us'].max():.3f}")
    lines.append("")
    lines.append("FPGA metrics vs ground-truth label:")
    lines.append(f"accuracy : {accuracy_score(df['label'], df['fpga_pred']):.6f}")
    lines.append(f"precision: {precision_score(df['label'], df['fpga_pred'], zero_division=0):.6f}")
    lines.append(f"recall   : {recall_score(df['label'], df['fpga_pred'], zero_division=0):.6f}")
    lines.append(f"f1       : {f1_score(df['label'], df['fpga_pred'], zero_division=0):.6f}")
    lines.append("")
    lines.append(classification_report(df["label"], df["fpga_pred"], zero_division=0))

    report_path.write_text("\n".join(lines), encoding="utf-8")
    print("\n".join(lines))
    print(f"wrote {display_path(merged_path)}")
    print(f"wrote {display_path(report_path)}")


if __name__ == "__main__":
    main()
