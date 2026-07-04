#!/usr/bin/env python3
"""Prepare IMG_DS patches: grayscale → resize → patchify → stratified split → save.

Reads stage1_dense_baseline.yaml for configuration.
Outputs train/val/test .npz files and a hold-out FPGA eval subset.
"""

import os
import sys
import time
from pathlib import Path

import numpy as np
import yaml
from PIL import Image, UnidentifiedImageError
from sklearn.model_selection import StratifiedShuffleSplit

# ---- paths ----
PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
CONFIG_PATH = PROJECT_ROOT / "experiments/imgds_linear_sparse/configs/stage1_dense_baseline.yaml"
OUTPUTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/outputs"
REPORTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/reports"
OUTPUTS_DIR.mkdir(parents=True, exist_ok=True)
REPORTS_DIR.mkdir(parents=True, exist_ok=True)

OUTPUT_PATHS = {
    "train": OUTPUTS_DIR / "imgds_r32_p8_train.npz",
    "val": OUTPUTS_DIR / "imgds_r32_p8_val.npz",
    "test": OUTPUTS_DIR / "imgds_r32_p8_test.npz",
    "fpga_eval": OUTPUTS_DIR / "imgds_r32_p8_fpga_eval_200.npz",
}
REPORT_PATH = REPORTS_DIR / "imgds_patch_split_report.md"


def load_config():
    with open(CONFIG_PATH) as f:
        return yaml.safe_load(f)


def image_to_patches(img: Image.Image, resize_size: int, patch_size: int) -> np.ndarray:
    """Convert a PIL image to a sequence of flattened patches.

    Returns:
        np.ndarray of shape (seq_len, patch_size * patch_size).
    """
    img_gray = img.convert("L")
    img_resized = img_gray.resize((resize_size, resize_size), Image.BILINEAR)
    arr = np.array(img_resized, dtype=np.float32) / 255.0  # normalize to [0, 1]

    seq_len_side = resize_size // patch_size
    seq_len = seq_len_side * seq_len_side
    patch_dim = patch_size * patch_size

    patches = np.zeros((seq_len, patch_dim), dtype=np.float32)
    idx = 0
    for i in range(seq_len_side):
        for j in range(seq_len_side):
            patch = arr[
                i * patch_size:(i + 1) * patch_size,
                j * patch_size:(j + 1) * patch_size,
            ]
            patches[idx] = patch.flatten()
            idx += 1
    return patches


def load_dataset(data_dir: Path, cfg: dict):
    """Load all images from Benign (label=0) and Malware (label=1) directories.

    Returns:
        X: np.ndarray [N, seq_len, input_dim]
        y: np.ndarray [N]
        file_paths: list of str
    """
    resize_size = cfg["preprocess"]["resize_size"]
    patch_size = cfg["preprocess"]["patch_size"]
    expected_seq_len = cfg["preprocess"]["expected_seq_len"]
    expected_input_dim = cfg["preprocess"]["expected_input_dim"]

    class_dirs = {
        0: data_dir / "Benign",
        1: data_dir / "Malware",
    }

    all_x = []
    all_y = []
    all_paths = []
    bad_count = 0

    for label, class_dir in class_dirs.items():
        if not class_dir.exists():
            print(f"WARNING: Directory not found: {class_dir}")
            continue
        files = sorted([f for f in class_dir.iterdir() if f.is_file() and not f.name.startswith(".")])
        print(f"Processing {len(files)} files from {class_dir.name} (label={label})...")

        for f in files:
            try:
                img = Image.open(f)
                patches = image_to_patches(img, resize_size, patch_size)
                img.close()
                if patches.shape != (expected_seq_len, expected_input_dim):
                    bad_count += 1
                    continue
                all_x.append(patches)
                all_y.append(label)
                all_paths.append(str(f))
            except (UnidentifiedImageError, OSError, Exception) as e:
                bad_count += 1
                print(f"  Skipping {f.name}: {e}")

    X = np.stack(all_x, axis=0).astype(np.float32)
    y = np.array(all_y, dtype=np.int64)
    print(f"\nLoaded: X={X.shape}, y={y.shape}, bad_skipped={bad_count}")
    return X, y, all_paths


def stratified_split(X, y, file_paths, cfg, seed=42):
    """70/10/20 stratified split."""
    n = len(y)
    # First split: 70% train, 30% temp
    sss1 = StratifiedShuffleSplit(n_splits=1, test_size=0.3, random_state=seed)
    train_idx, temp_idx = next(sss1.split(np.zeros(n), y))

    # Second split: temp → val (1/3 of temp = 10%) and test (2/3 of temp = 20%)
    y_temp = y[temp_idx]
    sss2 = StratifiedShuffleSplit(n_splits=1, test_size=2/3, random_state=seed)
    val_idx_temp, test_idx_temp = next(sss2.split(np.zeros(len(temp_idx)), y_temp))

    val_idx = temp_idx[val_idx_temp]
    test_idx = temp_idx[test_idx_temp]

    return {
        "train": (X[train_idx], y[train_idx], [file_paths[i] for i in train_idx]),
        "val": (X[val_idx], y[val_idx], [file_paths[i] for i in val_idx]),
        "test": (X[test_idx], y[test_idx], [file_paths[i] for i in test_idx]),
    }


def stratified_sample(X, y, file_paths, n_samples=200, seed=42):
    """Stratified random sample of up to n_samples."""
    if len(y) <= n_samples:
        return X, y, file_paths
    sss = StratifiedShuffleSplit(n_splits=1, train_size=n_samples, random_state=seed)
    idx, _ = next(sss.split(np.zeros(len(y)), y))
    return X[idx], y[idx], [file_paths[i] for i in idx]


def main():
    t_start = time.time()
    cfg = load_config()

    data_dir = Path(cfg["dataset"]["root"])
    resize_size = cfg["preprocess"]["resize_size"]
    patch_size = cfg["preprocess"]["patch_size"]
    seq_len = cfg["preprocess"]["expected_seq_len"]
    input_dim = cfg["preprocess"]["expected_input_dim"]
    split_seed = cfg["dataset"]["split"]["seed"]

    print("=" * 60)
    print("IMG_DS Patch Generation")
    print(f"  resize={resize_size}, patch={patch_size}, seq_len={seq_len}, input_dim={input_dim}")
    print("=" * 60)

    # Load all images and convert to patches
    X, y, file_paths = load_dataset(data_dir, cfg)
    print(f"\nDataset loaded: {X.shape}, {len(y)} samples")

    # Stratified split
    splits = stratified_split(X, y, file_paths, cfg, seed=split_seed)

    # Save splits
    for split_name, (X_s, y_s, paths_s) in splits.items():
        np.savez_compressed(OUTPUT_PATHS[split_name], X=X_s, y=y_s, file_paths=np.array(paths_s))
        print(f"Saved {split_name}: X={X_s.shape}, y={y_s.shape} → {OUTPUT_PATHS[split_name]}")

    # FPGA eval subset (stratified sampling from test set)
    X_test, y_test, paths_test = splits["test"]
    X_fpga, y_fpga, paths_fpga = stratified_sample(X_test, y_test, paths_test, n_samples=200, seed=split_seed)
    np.savez_compressed(OUTPUT_PATHS["fpga_eval"], X=X_fpga, y=y_fpga, file_paths=np.array(paths_fpga))
    print(f"Saved fpga_eval: X={X_fpga.shape}, y={y_fpga.shape} → {OUTPUT_PATHS['fpga_eval']}")

    # --- Generate report ---
    report_lines = [
        "# IMG_DS Patch Split Report",
        "",
        f"## Configuration",
        f"- resize_size: {resize_size}",
        f"- patch_size: {patch_size}",
        f"- seq_len: {seq_len}",
        f"- input_dim: {input_dim}",
        f"- color_mode: {cfg['preprocess']['color_mode']}",
        f"- normalize: {cfg['preprocess']['normalize']}",
        f"- split seed: {split_seed}",
        "",
        "## Split Shapes",
        "",
        "| Split | X shape | y shape | Benign | Malware |",
        "|-------|---------|---------|--------|---------|",
    ]
    for split_name in ["train", "val", "test"]:
        X_s, y_s, _ = splits[split_name]
        b_count = int((y_s == 0).sum())
        m_count = int((y_s == 1).sum())
        report_lines.append(
            f"| {split_name} | {X_s.shape} | {y_s.shape} | {b_count} | {m_count} |"
        )
    X_e, y_e, _ = X_fpga, y_fpga, paths_fpga
    b_e = int((y_e == 0).sum())
    m_e = int((y_e == 1).sum())
    report_lines.append(
        f"| fpga_eval_200 | {X_e.shape} | {y_e.shape} | {b_e} | {m_e} |"
    )
    report_lines += [
        "",
        "## Why 32×32 Grayscale in Stage 1?",
        "",
        "- ViT4Mal used RGB images at approximately 299×299×3 for their dense ViT.",
        "- For Stage 1, we reduce input size drastically (32×32 grayscale → 16 patches of 64 dims each)",
        "  to keep the software baseline lightweight and training fast.",
        "- This allows rapid iteration on the complete ONNX pipeline before scaling up.",
        "",
        "## Future Expansion Path",
        "",
        "| Stage | Input Size | Patch Size | Seq Len | Input Dim | Notes |",
        "|-------|-----------|------------|---------|-----------|-------|",
        "| 1 (current) | 32×32 | 8×8 | 16 | 64 | Grayscale dense baseline |",
        "| 2 | 32×32 / 64×64 / 128×128 | 8×8 | 16/64/256 | 64 | Input resolution ablation |",
        "| 3+ | TBD | TBD | TBD | TBD | With quantization and sparsity |",
    ]

    with open(REPORT_PATH, "w") as f:
        f.write("\n".join(report_lines) + "\n")
    print(f"\nReport saved: {REPORT_PATH}")

    elapsed = time.time() - t_start
    print(f"\nDone in {elapsed:.1f}s")


if __name__ == "__main__":
    main()
