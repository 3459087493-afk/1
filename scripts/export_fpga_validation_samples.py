#!/usr/bin/env python3
"""Export validation windows and PyTorch outputs for PYNQ-Z2 FPGA checking."""

from __future__ import annotations

import argparse
from pathlib import Path

import numpy as np
import pandas as pd
import torch
import torch.nn as nn

from export_hls_params import find_latest_checkpoint, find_latest_transformer_checkpoint
from src.transformer import LinearTransformerAnomalyDetector, TransformerAnomalyDetector
from src.utils import prepare_dataset_for_evaluation


PROJECT_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_OUTPUT = PROJECT_ROOT / "results" / "fpga_pynq_z2" / "validation_samples.csv"


def display_path(path: Path) -> str:
    try:
        return str(path.resolve().relative_to(PROJECT_ROOT))
    except ValueError:
        return str(path)


def load_model(checkpoint_path: Path, model_type: str) -> TransformerAnomalyDetector | LinearTransformerAnomalyDetector:
    checkpoint = torch.load(checkpoint_path, map_location="cpu")
    hparams = dict(checkpoint["hyper_parameters"])
    hparams["loss_fn"] = nn.BCEWithLogitsLoss(pos_weight=torch.tensor(5))
    if model_type == "transformer":
        model = TransformerAnomalyDetector(**hparams)
    elif model_type == "linear_transformer":
        model = LinearTransformerAnomalyDetector(**hparams)
    else:
        raise ValueError(f"Unsupported model type: {model_type}")
    model.load_state_dict(checkpoint["state_dict"])
    model.eval()
    return model


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dataset", default="KPI", choices=["KPI", "FI2010", "NAB"])
    parser.add_argument("--num-samples", type=int, default=100)
    parser.add_argument(
        "--normal-samples",
        type=int,
        default=None,
        help="Number of label-0 samples to export. Enables balanced/stratified export.",
    )
    parser.add_argument(
        "--anomaly-samples",
        type=int,
        default=None,
        help="Number of label-1 samples to export. Enables balanced/stratified export.",
    )
    parser.add_argument("--window-size", type=int, default=8)
    parser.add_argument("--train-proportion", type=float, default=0.9)
    parser.add_argument("--root-data-dir", type=Path, default=PROJECT_ROOT / "data")
    parser.add_argument("--checkpoint", type=Path, default=None)
    parser.add_argument(
        "--model-type",
        choices=["transformer", "linear_transformer"],
        default="transformer",
        help="Model family used to compute pytorch_score.",
    )
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    if args.checkpoint is not None:
        checkpoint_path = args.checkpoint
    elif args.model_type == "transformer":
        checkpoint_path = find_latest_transformer_checkpoint(PROJECT_ROOT / "notebooks" / "lightning_logs")
    else:
        checkpoint_path = find_latest_checkpoint(PROJECT_ROOT / "notebooks" / "lightning_logs", args.model_type)
    checkpoint_path = checkpoint_path.resolve()

    _, va_dl, _ = prepare_dataset_for_evaluation(
        dataset_name=args.dataset,
        window_size=args.window_size,
        train_proportion=args.train_proportion,
        batch_size=max(args.num_samples, 1),
        root_data_dir=args.root_data_dir,
        seed=1,
    )

    x_batches = []
    y_batches = []
    for x_batch, y_batch in va_dl:
        x_batches.append(x_batch)
        y_batches.append(y_batch)

    x_val = torch.cat(x_batches).float()
    y_val = torch.cat(y_batches).float()

    stratified_export = args.normal_samples is not None or args.anomaly_samples is not None
    if stratified_export:
        normal_samples = args.normal_samples if args.normal_samples is not None else 0
        anomaly_samples = args.anomaly_samples if args.anomaly_samples is not None else 0
        normal_idx = torch.nonzero(y_val == 0, as_tuple=False).reshape(-1)
        anomaly_idx = torch.nonzero(y_val == 1, as_tuple=False).reshape(-1)

        if len(normal_idx) < normal_samples:
            raise ValueError(f"Requested {normal_samples} normal samples, but only {len(normal_idx)} are available")
        if len(anomaly_idx) < anomaly_samples:
            raise ValueError(f"Requested {anomaly_samples} anomaly samples, but only {len(anomaly_idx)} are available")

        selected_idx = torch.cat([normal_idx[:normal_samples], anomaly_idx[:anomaly_samples]])
        x_val = x_val[selected_idx]
        y_val = y_val[selected_idx]
    else:
        x_val = x_val[: args.num_samples]
        y_val = y_val[: args.num_samples]

    model = load_model(checkpoint_path, args.model_type)
    with torch.no_grad():
        pytorch_score = model(x_val).detach().cpu().numpy().astype(np.float32)

    x_np = x_val.detach().cpu().numpy().astype(np.float32)
    y_np = y_val.detach().cpu().numpy().astype(np.int32)

    rows = []
    for idx in range(len(x_np)):
        row = {"sample_id": idx, "label": int(y_np[idx]), "pytorch_score": float(pytorch_score[idx])}
        flat = x_np[idx].reshape(-1)
        for j, value in enumerate(flat):
            row[f"x{j:02d}"] = float(value)
        rows.append(row)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    pd.DataFrame(rows).to_csv(args.output, index=False)
    print(f"checkpoint={checkpoint_path.relative_to(PROJECT_ROOT)}")
    print(f"wrote={display_path(args.output)}")
    print(f"samples={len(rows)}")
    print(f"label_0={int((y_np == 0).sum())}")
    print(f"label_1={int((y_np == 1).sum())}")


if __name__ == "__main__":
    main()
