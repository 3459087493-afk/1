#!/usr/bin/env python3
"""Export trained LinearIMGDSDenseBaseline to ONNX format.

Reads config, loads best checkpoint, exports ONNX model with dynamic batch.
"""

import logging
import os
import sys
import time
from pathlib import Path

import numpy as np
import torch
import yaml

# Ensure project root on path
PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

SCRIPTS_DIR = PROJECT_ROOT / "experiments" / "imgds_linear_sparse" / "scripts"
if str(SCRIPTS_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPTS_DIR))
from imgds_model import LinearIMGDSDenseBaseline  # noqa: E402

# ---- paths ----
CONFIG_PATH = PROJECT_ROOT / "experiments/imgds_linear_sparse/configs/stage1_dense_baseline.yaml"
CKPT_PATH = PROJECT_ROOT / "experiments/imgds_linear_sparse/checkpoints/best_linear_imgds_dense_r32_p8.pt"
ONNX_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/onnx"
ONNX_MODEL_DIR = ONNX_DIR / "models"
ONNX_LOG_DIR = ONNX_DIR / "logs"
ONNX_REPORT_DIR = ONNX_DIR / "reports"

for d in [ONNX_MODEL_DIR, ONNX_LOG_DIR, ONNX_REPORT_DIR]:
    d.mkdir(parents=True, exist_ok=True)

ONNX_MODEL_PATH = ONNX_MODEL_DIR / "linear_imgds_dense_r32_p8.onnx"
ONNX_LOG_PATH = ONNX_LOG_DIR / "onnx_export.log"
ONNX_REPORT_PATH = ONNX_REPORT_DIR / "onnx_export_report.md"


def setup_logging(log_path: Path):
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(message)s",
        handlers=[
            logging.FileHandler(log_path),
            logging.StreamHandler(sys.stdout),
        ],
    )
    return logging.getLogger(__name__)


def load_config():
    with open(CONFIG_PATH) as f:
        return yaml.safe_load(f)


def main():
    logger = setup_logging(ONNX_LOG_PATH)
    logger.info("=" * 60)
    logger.info("ONNX Export — IMG_DS Linear Transformer Dense Baseline")
    logger.info("=" * 60)

    cfg = load_config()
    onnx_cfg = cfg["onnx"]
    model_cfg = cfg["model"]

    device = torch.device("cpu")  # ONNX export always on CPU

    # ---- Load checkpoint ----
    logger.info(f"Loading checkpoint: {CKPT_PATH}")
    if not CKPT_PATH.exists():
        logger.error(f"Checkpoint not found: {CKPT_PATH}")
        sys.exit(1)

    ckpt = torch.load(CKPT_PATH, map_location=device, weights_only=False)
    logger.info(f"Checkpoint epoch: {ckpt.get('epoch', 'unknown')}")
    logger.info(f"Checkpoint val_f1: {ckpt.get('val_f1', 'unknown')}")

    # ---- Build model ----
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

    param_count = sum(p.numel() for p in model.parameters())
    model_size = model.model_size_mb
    logger.info(f"Parameters: {param_count:,}")
    logger.info(f"Model size: {model_size:.4f} MB")

    # ---- Dummy input ----
    seq_len = model_cfg["seq_len"]
    input_dim = model_cfg["input_dim"]
    dummy_input = torch.randn(1, seq_len, input_dim, device=device, dtype=torch.float32)
    logger.info(f"Dummy input shape: {tuple(dummy_input.shape)}, dtype: {dummy_input.dtype}")

    # Verify forward pass
    with torch.no_grad():
        output = model(dummy_input)
    logger.info(f"Output shape: {tuple(output.shape)}")

    # ---- Export ONNX ----
    opset_version = onnx_cfg["opset_version"]
    input_name = onnx_cfg["input_name"]
    output_name = onnx_cfg["output_name"]
    dynamic_batch = onnx_cfg["dynamic_batch"]

    dynamic_axes = None
    if dynamic_batch:
        dynamic_axes = {
            input_name: {0: "batch"},
            output_name: {0: "batch"},
        }

    logger.info(f"Exporting ONNX with opset_version={opset_version}, dynamic_batch={dynamic_batch}...")
    t_start = time.time()

    torch.onnx.export(
        model,
        dummy_input,
        str(ONNX_MODEL_PATH),
        opset_version=opset_version,
        input_names=[input_name],
        output_names=[output_name],
        dynamic_axes=dynamic_axes,
        export_params=True,
        do_constant_folding=True,
    )

    t_elapsed = time.time() - t_start
    logger.info(f"ONNX exported in {t_elapsed:.1f}s")
    logger.info(f"ONNX model: {ONNX_MODEL_PATH}")

    onnx_file_size_mb = ONNX_MODEL_PATH.stat().st_size / (1024 * 1024)
    logger.info(f"ONNX file size: {onnx_file_size_mb:.4f} MB")

    # ---- Generate report ----
    report = f"""# ONNX Export Report

## Configuration

| Parameter | Value |
|-----------|-------|
| Checkpoint | {CKPT_PATH} |
| ONNX model | {ONNX_MODEL_PATH} |
| opset_version | {opset_version} |
| Input name | {input_name} |
| Output name | {output_name} |
| Dynamic batch | {dynamic_batch} |

## Model Info

| Metric | Value |
|--------|-------|
| Input shape | (batch, {seq_len}, {input_dim}) |
| Output shape | (batch, {model_cfg['num_classes']}) |
| Parameter count | {param_count:,} |
| PyTorch model size | {model_size:.4f} MB |
| ONNX file size | {onnx_file_size_mb:.4f} MB |
| Export time | {t_elapsed:.1f}s |
| Export status | ✓ SUCCESS |

## Notes

- Model exported in evaluation mode.
- Constant folding applied during export.
- Dynamic batch axis enabled for variable batch size inference.
- Dummy input dtype: float32.
"""
    with open(ONNX_REPORT_PATH, "w") as f:
        f.write(report)
    logger.info(f"Report: {ONNX_REPORT_PATH}")

    logger.info("ONNX export complete ✓")


if __name__ == "__main__":
    main()
