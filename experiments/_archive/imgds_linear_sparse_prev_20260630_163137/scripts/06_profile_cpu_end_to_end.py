#!/usr/bin/env python3
"""Profile CPU end-to-end latency for IMG_DS Linear Transformer inference.

Measures: image_load → preprocess → patchify → model_inference → postprocess.
Uses raw test images and the trained PyTorch checkpoint.
Outputs per-stage statistics (mean, std, p50, p90, p99).
"""

import csv
import sys
import time
from pathlib import Path

import numpy as np
import torch
import yaml
from PIL import Image

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
OUTPUTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/outputs"
RESULTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/results"
REPORTS_DIR = PROJECT_ROOT / "experiments/imgds_linear_sparse/reports"
RESULTS_DIR.mkdir(parents=True, exist_ok=True)
REPORTS_DIR.mkdir(parents=True, exist_ok=True)

BREAKDOWN_CSV = RESULTS_DIR / "cpu_end_to_end_breakdown.csv"
BREAKDOWN_MD = REPORTS_DIR / "cpu_end_to_end_breakdown.md"


def load_config():
    with open(CONFIG_PATH) as f:
        return yaml.safe_load(f)


def image_to_patches_pil_only(img: Image.Image, resize_size: int, patch_size: int) -> np.ndarray:
    """Grayscale → resize → patchify (used inside timing)."""
    img_gray = img.convert("L")
    img_resized = img_gray.resize((resize_size, resize_size), Image.BILINEAR)
    arr = np.array(img_resized, dtype=np.float32) / 255.0
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


def percentile(arr, p):
    return float(np.percentile(arr, p))


def main():
    cfg = load_config()
    resize_size = cfg["preprocess"]["resize_size"]
    patch_size = cfg["preprocess"]["patch_size"]
    seq_len = cfg["preprocess"]["expected_seq_len"]
    input_dim = cfg["preprocess"]["expected_input_dim"]
    model_cfg = cfg["model"]

    device = torch.device("cpu")

    print("=" * 60)
    print("CPU End-to-End Profiling")
    print("=" * 60)

    # ---- Load checkpoint ----
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

    # ---- Collect test image paths ----
    test_npz = np.load(OUTPUTS_DIR / "imgds_r32_p8_test.npz")
    test_paths = test_npz["file_paths"]
    test_labels = test_npz["y"]

    n_profile = min(500, len(test_paths))
    paths = test_paths[:n_profile]
    labels = test_labels[:n_profile]

    print(f"Profiling {len(paths)} images...")

    # Warm-up
    for _ in range(10):
        with torch.no_grad():
            _ = model(torch.randn(1, seq_len, input_dim))

    # ---- Profile each stage ----
    timings = {
        "image_load_us": [],
        "preprocess_us": [],
        "patchify_us": [],
        "model_inference_us": [],
        "postprocess_us": [],
        "end_to_end_us": [],
    }

    for idx in range(len(paths)):
        t0 = time.perf_counter()

        # Stage 1: Image load
        t1 = time.perf_counter()
        img = Image.open(paths[idx])
        t2 = time.perf_counter()

        # Stage 2: Preprocess (grayscale + resize)
        img_gray = img.convert("L")
        img_resized = img_gray.resize((resize_size, resize_size), Image.BILINEAR)
        arr = np.array(img_resized, dtype=np.float32) / 255.0
        t3 = time.perf_counter()

        # Stage 3: Patchify
        patches = np.zeros((seq_len, input_dim), dtype=np.float32)
        seq_side = resize_size // patch_size
        pid = 0
        for i in range(seq_side):
            for j in range(seq_side):
                patch = arr[
                    i * patch_size:(i + 1) * patch_size,
                    j * patch_size:(j + 1) * patch_size,
                ]
                patches[pid] = patch.flatten()
                pid += 1
        t4 = time.perf_counter()

        # Stage 4: Model inference
        with torch.no_grad():
            x = torch.tensor(patches, dtype=torch.float32).unsqueeze(0)
            logits = model(x)
        t5 = time.perf_counter()

        # Stage 5: Postprocess (softmax + argmax)
        probs = torch.softmax(logits, dim=1)
        pred = torch.argmax(probs, dim=1).item()
        t6 = time.perf_counter()

        img.close()

        timings["image_load_us"].append((t2 - t1) * 1e6)
        timings["preprocess_us"].append((t3 - t2) * 1e6)
        timings["patchify_us"].append((t4 - t3) * 1e6)
        timings["model_inference_us"].append((t5 - t4) * 1e6)
        timings["postprocess_us"].append((t6 - t5) * 1e6)
        timings["end_to_end_us"].append((t6 - t1) * 1e6)

    # ---- Statistics ----
    stats = {}
    for stage_name, values in timings.items():
        vals = np.array(values)
        stats[stage_name] = {
            "mean": float(np.mean(vals)),
            "std": float(np.std(vals)),
            "p50": percentile(vals, 50),
            "p90": percentile(vals, 90),
            "p99": percentile(vals, 99),
        }

    # ---- Save CSV ----
    with open(BREAKDOWN_CSV, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["stage", "mean_us", "std_us", "p50_us", "p90_us", "p99_us"])
        for stage_name in ["image_load_us", "preprocess_us", "patchify_us", "model_inference_us", "postprocess_us", "end_to_end_us"]:
            s = stats[stage_name]
            writer.writerow([stage_name, s["mean"], s["std"], s["p50"], s["p90"], s["p99"]])
    print(f"\nBreakdown CSV: {BREAKDOWN_CSV}")

    # ---- Print table ----
    print(f"\n{'Stage':<25} {'Mean (µs)':>12} {'Std (µs)':>12} {'P50 (µs)':>12} {'P90 (µs)':>12} {'P99 (µs)':>12}")
    print("-" * 85)
    for stage_name in ["image_load_us", "preprocess_us", "patchify_us", "model_inference_us", "postprocess_us", "end_to_end_us"]:
        s = stats[stage_name]
        print(f"{stage_name:<25} {s['mean']:>12.1f} {s['std']:>12.1f} {s['p50']:>12.1f} {s['p90']:>12.1f} {s['p99']:>12.1f}")

    # ---- Generate report ----
    md_lines = [
        "# CPU End-to-End Latency Breakdown",
        "",
        f"Profiled on **{n_profile}** test images from IMG_DS.",
        f"All measurements on **CPU** (NOT PYNQ-Z2).",
        "",
        "## Per-Stage Statistics (µs)",
        "",
        "| Stage | Mean | Std | P50 | P90 | P99 |",
        "|-------|------|-----|-----|-----|-----|",
    ]
    for stage_name in ["image_load_us", "preprocess_us", "patchify_us", "model_inference_us", "postprocess_us", "end_to_end_us"]:
        s = stats[stage_name]
        md_lines.append(f"| {stage_name} | {s['mean']:.1f} | {s['std']:.1f} | {s['p50']:.1f} | {s['p90']:.1f} | {s['p99']:.1f} |")

    md_lines += [
        "",
        "## Stage Descriptions",
        "",
        "- **image_load_us**: PIL.Image.open() time.",
        "- **preprocess_us**: Grayscale conversion + resize + normalize.",
        "- **patchify_us**: Split resized image into 8×8 patches and flatten.",
        "- **model_inference_us**: PyTorch forward pass (CPU).",
        "- **postprocess_us**: Softmax + argmax.",
        "- **end_to_end_us**: image_open → prediction (full pipeline).",
        "",
        "## Important Notes",
        "",
        "- ⚠️  This is **CPU profiling only**, NOT PYNQ-Z2 FPGA timing.",
        "- PYNQ-Z2 inference time will be measured in Stage 6 after HLS synthesis.",
        "- These CPU numbers serve as a software reference for later FPGA speedup comparison.",
        "- Model: LinearIMGDSDenseBaseline (Linear Transformer, 1 layer, d_model=16).",
    ]
    with open(BREAKDOWN_MD, "w") as f:
        f.write("\n".join(md_lines) + "\n")
    print(f"\nReport: {BREAKDOWN_MD}")
    print("CPU profiling complete ✓")


if __name__ == "__main__":
    main()
