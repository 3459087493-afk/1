#!/usr/bin/env python3
"""Train LinearIMGDSDenseBaseline on IMG_DS patches.

Reads config, loads .npz splits, trains with class weights,
saves best checkpoint (by val F1), evaluates on test set.
"""

import json
import os
import sys
import time
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import torch
import torch.nn as nn
import yaml
from sklearn.metrics import (
    accuracy_score,
    confusion_matrix,
    f1_score,
    precision_score,
    recall_score,
    roc_auc_score,
)
from torch.utils.data import DataLoader, TensorDataset

# Ensure project root on path
PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

# Import model wrapper
SCRIPTS_DIR = PROJECT_ROOT / "experiments" / "imgds_linear_sparse" / "scripts"
if str(SCRIPTS_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPTS_DIR))
from imgds_model import LinearIMGDSDenseBaseline  # noqa: E402

# ---- paths ----
CONFIG_PATH = PROJECT_ROOT / "experiments/imgds_linear_sparse/configs/stage1_dense_baseline.yaml"
OUTPUTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/outputs"
RESULTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/results"
REPORTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/reports"
FIGURES_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/figures"
CKPT_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/checkpoints"

for d in [RESULTS_DIR, REPORTS_DIR, FIGURES_DIR, CKPT_DIR]:
    d.mkdir(parents=True, exist_ok=True)

CKPT_PATH = CKPT_DIR / "best_linear_imgds_dense_r32_p8.pt"
TRAIN_METRICS_CSV = RESULTS_DIR / "train_metrics.csv"
TEST_METRICS_CSV = RESULTS_DIR / "test_metrics.csv"
CONFUSION_CSV = RESULTS_DIR / "confusion_matrix.csv"
TRAINING_CURVES_PNG = FIGURES_DIR / "training_curves.png"
REPORT_PATH = REPORTS_DIR / "linear_imgds_dense_baseline_report.md"


def set_seed(seed: int):
    import random
    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    if torch.cuda.is_available():
        torch.cuda.manual_seed_all(seed)


def load_config():
    with open(CONFIG_PATH) as f:
        return yaml.safe_load(f)


def compute_class_weights(y_train):
    """Compute inverse-frequency class weights."""
    classes, counts = np.unique(y_train, return_counts=True)
    weights = 1.0 / counts.astype(np.float32)
    weights = weights / weights.sum() * len(classes)  # normalize so sum = n_classes
    return torch.tensor(weights, dtype=torch.float32)


def evaluate_model(model, dataloader, device, criterion=None):
    """Return dict of metrics for a dataloader."""
    model.eval()
    all_logits = []
    all_labels = []
    total_loss = 0.0
    n_batches = 0

    with torch.no_grad():
        for x_batch, y_batch in dataloader:
            x_batch = x_batch.to(device)
            y_batch = y_batch.to(device)
            logits = model(x_batch)
            if criterion is not None:
                loss = criterion(logits, y_batch)
                total_loss += loss.item()
                n_batches += 1
            all_logits.append(logits.cpu())
            all_labels.append(y_batch.cpu())

    logits = torch.cat(all_logits, dim=0)
    labels = torch.cat(all_labels, dim=0)
    probs = torch.softmax(logits, dim=1)
    preds = torch.argmax(logits, dim=1)

    labels_np = labels.numpy()
    preds_np = preds.numpy()
    probs_np = probs[:, 1].numpy()  # probability of class 1 (Malware)

    metrics = {
        "accuracy": float(accuracy_score(labels_np, preds_np)),
        "precision": float(precision_score(labels_np, preds_np, zero_division=0)),
        "recall": float(recall_score(labels_np, preds_np, zero_division=0)),
        "f1": float(f1_score(labels_np, preds_np, zero_division=0)),
        "auc": float(roc_auc_score(labels_np, probs_np)),
    }
    if criterion is not None and n_batches > 0:
        metrics["loss"] = total_loss / n_batches

    # Confusion matrix
    cm = confusion_matrix(labels_np, preds_np, labels=[0, 1])
    if cm.shape == (2, 2):
        tn, fp, fn, tp = cm.ravel()
    else:
        tn = fp = fn = tp = 0
    metrics["tn"] = int(tn)
    metrics["fp"] = int(fp)
    metrics["fn"] = int(fn)
    metrics["tp"] = int(tp)

    return metrics


def main():
    cfg = load_config()
    seed = cfg["training"]["seed"]
    set_seed(seed)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Device: {device}")

    # ---- Load data ----
    train_data = np.load(OUTPUTS_DIR / "imgds_r32_p8_train.npz")
    val_data = np.load(OUTPUTS_DIR / "imgds_r32_p8_val.npz")
    test_data = np.load(OUTPUTS_DIR / "imgds_r32_p8_test.npz")

    X_train, y_train = train_data["X"], train_data["y"]
    X_val, y_val = val_data["X"], val_data["y"]
    X_test, y_test = test_data["X"], test_data["y"]

    print(f"Train: X={X_train.shape}, y={y_train.shape}")
    print(f"Val:   X={X_val.shape}, y={y_val.shape}")
    print(f"Test:  X={X_test.shape}, y={y_test.shape}")

    # ---- Compute class weights ----
    use_class_weight = cfg["training"].get("use_class_weight", True)
    class_weights = None
    if use_class_weight:
        class_weights = compute_class_weights(y_train).to(device)
        print(f"Class weights: {class_weights.cpu().numpy()}")

    # ---- DataLoaders ----
    batch_size = cfg["training"]["batch_size"]
    train_ds = TensorDataset(torch.tensor(X_train), torch.tensor(y_train))
    val_ds = TensorDataset(torch.tensor(X_val), torch.tensor(y_val))
    test_ds = TensorDataset(torch.tensor(X_test), torch.tensor(y_test))
    train_dl = DataLoader(train_ds, batch_size=batch_size, shuffle=True)
    val_dl = DataLoader(val_ds, batch_size=batch_size, shuffle=False)
    test_dl = DataLoader(test_ds, batch_size=batch_size, shuffle=False)

    # ---- Build model ----
    model_cfg = cfg["model"]
    model = LinearIMGDSDenseBaseline(
        input_dim=model_cfg["input_dim"],
        seq_len=model_cfg["seq_len"],
        d_model=model_cfg["d_model"],
        dim_feedforward=model_cfg["dim_feedforward"],
        num_layers=model_cfg["num_layers"],
        dropout=model_cfg["dropout"],
        num_classes=model_cfg["num_classes"],
    ).to(device)

    param_count = sum(p.numel() for p in model.parameters())
    print(f"\nModel: {model_cfg['name']}")
    print(f"Parameters: {param_count:,}")

    # ---- Loss & Optimizer ----
    criterion = nn.CrossEntropyLoss(weight=class_weights)
    optimizer = torch.optim.AdamW(
        model.parameters(),
        lr=cfg["training"]["learning_rate"],
        weight_decay=cfg["training"]["weight_decay"],
    )

    epochs = cfg["training"]["epochs"]
    train_history = []

    best_val_f1 = -1.0
    best_epoch = 0

    print(f"\nTraining {epochs} epochs...")
    t_train_start = time.time()

    for epoch in range(1, epochs + 1):
        model.train()
        epoch_loss = 0.0
        n_batches = 0

        for x_batch, y_batch in train_dl:
            x_batch = x_batch.to(device)
            y_batch = y_batch.to(device)
            optimizer.zero_grad()
            logits = model(x_batch)
            loss = criterion(logits, y_batch)
            loss.backward()
            optimizer.step()
            epoch_loss += loss.item()
            n_batches += 1

        train_loss = epoch_loss / max(n_batches, 1)
        val_metrics = evaluate_model(model, val_dl, device, criterion)
        val_loss = val_metrics["loss"]

        train_history.append({
            "epoch": epoch,
            "train_loss": train_loss,
            "val_loss": val_loss,
            "val_accuracy": val_metrics["accuracy"],
            "val_precision": val_metrics["precision"],
            "val_recall": val_metrics["recall"],
            "val_f1": val_metrics["f1"],
            "val_auc": val_metrics["auc"],
        })

        # Save best by val F1
        if val_metrics["f1"] > best_val_f1:
            best_val_f1 = val_metrics["f1"]
            best_epoch = epoch
            torch.save(
                {
                    "epoch": epoch,
                    "model_state_dict": model.state_dict(),
                    "optimizer_state_dict": optimizer.state_dict(),
                    "val_f1": best_val_f1,
                    "config": cfg,
                },
                CKPT_PATH,
            )

        print(
            f"Epoch {epoch:3d}/{epochs} | "
            f"train_loss: {train_loss:.4f} | "
            f"val_loss: {val_loss:.4f} | "
            f"val_acc: {val_metrics['accuracy']:.4f} | "
            f"val_f1: {val_metrics['f1']:.4f} | "
            f"val_auc: {val_metrics['auc']:.4f}"
        )

    t_train_end = time.time()
    print(f"\nTraining complete in {t_train_end - t_train_start:.1f}s")
    print(f"Best val F1: {best_val_f1:.4f} at epoch {best_epoch}")

    # ---- Save training metrics ----
    df_train = pd.DataFrame(train_history)
    df_train.to_csv(TRAIN_METRICS_CSV, index=False)
    print(f"Training metrics: {TRAIN_METRICS_CSV}")

    # ---- Load best checkpoint and evaluate on test ----
    ckpt = torch.load(CKPT_PATH, map_location=device, weights_only=False)
    model.load_state_dict(ckpt["model_state_dict"])
    model.eval()

    test_metrics = evaluate_model(model, test_dl, device)
    test_metrics["parameter_count"] = param_count
    test_metrics["model_size_mb"] = model.model_size_mb

    df_test = pd.DataFrame([test_metrics])
    df_test.to_csv(TEST_METRICS_CSV, index=False)
    print(f"Test metrics: {TEST_METRICS_CSV}")

    # ---- Confusion matrix CSV ----
    df_cm = pd.DataFrame({
        "label": ["Benign", "Malware"],
        "pred_benign": [test_metrics["tn"], test_metrics["fn"]],
        "pred_malware": [test_metrics["fp"], test_metrics["tp"]],
        "tn": [test_metrics["tn"], ""],
        "fp": [test_metrics["fp"], ""],
        "fn": [test_metrics["fn"], ""],
        "tp": [test_metrics["tp"], ""],
    })
    df_cm.to_csv(CONFUSION_CSV, index=False)
    print(f"Confusion matrix: {CONFUSION_CSV}")

    # ---- Training curves plot ----
    fig, axes = plt.subplots(2, 3, figsize=(16, 10))
    fig.suptitle("IMG_DS Linear Transformer Dense Baseline — Training Curves", fontsize=14)

    epochs_arr = df_train["epoch"].values
    axes[0, 0].plot(epochs_arr, df_train["train_loss"], label="Train")
    axes[0, 0].plot(epochs_arr, df_train["val_loss"], label="Val")
    axes[0, 0].set_title("Loss")
    axes[0, 0].set_xlabel("Epoch")
    axes[0, 0].legend()
    axes[0, 0].grid(True)

    axes[0, 1].plot(epochs_arr, df_train["val_accuracy"], color="green")
    axes[0, 1].set_title("Val Accuracy")
    axes[0, 1].set_xlabel("Epoch")
    axes[0, 1].grid(True)

    axes[0, 2].plot(epochs_arr, df_train["val_f1"], color="orange")
    axes[0, 2].set_title("Val F1")
    axes[0, 2].set_xlabel("Epoch")
    axes[0, 2].grid(True)

    axes[1, 0].plot(epochs_arr, df_train["val_precision"], color="red")
    axes[1, 0].set_title("Val Precision")
    axes[1, 0].set_xlabel("Epoch")
    axes[1, 0].grid(True)

    axes[1, 1].plot(epochs_arr, df_train["val_recall"], color="purple")
    axes[1, 1].set_title("Val Recall")
    axes[1, 1].set_xlabel("Epoch")
    axes[1, 1].grid(True)

    axes[1, 2].plot(epochs_arr, df_train["val_auc"], color="brown")
    axes[1, 2].set_title("Val AUC")
    axes[1, 2].set_xlabel("Epoch")
    axes[1, 2].grid(True)

    plt.tight_layout()
    plt.savefig(TRAINING_CURVES_PNG, dpi=150)
    plt.close()
    print(f"Training curves: {TRAINING_CURVES_PNG}")

    # ---- Generate report ----
    report = f"""# IMG_DS Linear Transformer Dense Baseline — Training Report

## Model Configuration

| Parameter | Value |
|-----------|-------|
| Model | {model_cfg['name']} |
| Base | LinearUNSWAnomalyDetector |
| input_dim | {model_cfg['input_dim']} |
| seq_len | {model_cfg['seq_len']} |
| d_model | {model_cfg['d_model']} |
| dim_feedforward | {model_cfg['dim_feedforward']} |
| num_layers | {model_cfg['num_layers']} |
| dropout | {model_cfg['dropout']} |
| num_classes | {model_cfg['num_classes']} |
| Trainable params | {param_count:,} |
| Model size | {model.model_size_mb:.4f} MB |

## Training Configuration

| Parameter | Value |
|-----------|-------|
| Epochs | {epochs} |
| Batch size | {batch_size} |
| Optimizer | {cfg['training']['optimizer']} |
| Learning rate | {cfg['training']['learning_rate']} |
| Weight decay | {cfg['training']['weight_decay']} |
| Loss | {cfg['training']['loss']} |
| Class weight | {use_class_weight} |
| Seed | {seed} |

## Test Set Results

| Metric | Value |
|--------|-------|
| Accuracy | {test_metrics['accuracy']:.4f} |
| Precision | {test_metrics['precision']:.4f} |
| Recall | {test_metrics['recall']:.4f} |
| F1 | {test_metrics['f1']:.4f} |
| AUC | {test_metrics['auc']:.4f} |
| TN | {test_metrics['tn']} |
| FP | {test_metrics['fp']} |
| FN | {test_metrics['fn']} |
| TP | {test_metrics['tp']} |
| Best epoch | {best_epoch} |

## Stage 1 Status

- **Quantization**: NOT performed (Stage 3).
- **Sparsity**: NOT applied (Stage 4).
- **HLS synthesis**: NOT run (Stage 5).
- **PYNQ deployment**: NOT done (Stage 6).
- **This is a pure software dense baseline with ONNX export.**

## Checkpoint

- Path: {CKPT_PATH}
"""
    with open(REPORT_PATH, "w") as f:
        f.write(report)
    print(f"Report: {REPORT_PATH}")

    print("\n" + "=" * 60)
    print("Training pipeline complete.")
    print(f"Test Accuracy:  {test_metrics['accuracy']:.4f}")
    print(f"Test F1:        {test_metrics['f1']:.4f}")
    print(f"Test AUC:       {test_metrics['auc']:.4f}")
    print("=" * 60)


if __name__ == "__main__":
    main()
