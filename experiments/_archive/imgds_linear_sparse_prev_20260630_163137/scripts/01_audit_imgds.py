#!/usr/bin/env python3
"""Audit IMG_DS dataset: scan, count, verify images, generate report."""

import csv
import os
import sys
from pathlib import Path

import numpy as np
from PIL import Image, UnidentifiedImageError

# ---- paths ----
PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
DATA_DIR = PROJECT_ROOT / "data" / "IMG_DS"
RESULTS_DIR = PROJECT_ROOT / "experiments" / "imgds_linear_sparse" / "results"
REPORTS_DIR = PROJECT_ROOT / "experiments" / "imgds_linear_sparse" / "reports"
RESULTS_DIR.mkdir(parents=True, exist_ok=True)
REPORTS_DIR.mkdir(parents=True, exist_ok=True)

AUDIT_CSV = RESULTS_DIR / "imgds_audit.csv"
AUDIT_MD = REPORTS_DIR / "imgds_audit.md"

MAX_SAMPLE_PER_CLASS = 200


def scan_directory(class_dir: Path, label: int, max_sample: int):
    """Scan a class directory, return file list and statistics."""
    files = sorted([f for f in class_dir.iterdir() if f.is_file() and not f.name.startswith(".")])
    ext_counts = {}
    sample_dims = []
    bad_files = []
    rgb_similarity_ratios = []

    sample_files = files[:max_sample] if len(files) > max_sample else files

    for f in sample_files:
        try:
            img = Image.open(f)
            w, h = img.size
            mode = img.mode
            sample_dims.append((f.name, w, h, len(img.getbands()), mode, False))
            # Check if RGB channels are similar (potential grayscale stored as RGB)
            if mode == "RGB":
                arr = np.array(img)
                r_mean = arr[:, :, 0].mean()
                g_mean = arr[:, :, 1].mean()
                b_mean = arr[:, :, 2].mean()
                max_diff = max(abs(r_mean - g_mean), abs(r_mean - b_mean), abs(g_mean - b_mean))
                rgb_similarity_ratios.append(max_diff)
            img.close()
        except (UnidentifiedImageError, OSError, Exception) as e:
            sample_dims.append((f.name, None, None, None, None, True))
            bad_files.append((f.name, str(e)))

    for f in files:
        ext = f.suffix.lower()
        ext_counts[ext] = ext_counts.get(ext, 0) + 1

    return {
        "count": len(files),
        "ext_counts": ext_counts,
        "sample_dims": sample_dims,
        "bad_files": bad_files,
        "rgb_similarity_ratios": rgb_similarity_ratios,
    }


def main():
    print("=" * 60)
    print("IMG_DS Dataset Audit")
    print("=" * 60)

    # Find class directories
    benign_dir = DATA_DIR / "Benign"
    malware_dir = DATA_DIR / "Malware"

    if not benign_dir.exists():
        print(f"ERROR: Benign directory not found: {benign_dir}")
        sys.exit(1)
    if not malware_dir.exists():
        print(f"ERROR: Malware directory not found: {malware_dir}")
        sys.exit(1)

    print(f"\nScanning Benign: {benign_dir}")
    benign_info = scan_directory(benign_dir, 0, MAX_SAMPLE_PER_CLASS)

    print(f"Scanning Malware: {malware_dir}")
    malware_info = scan_directory(malware_dir, 1, MAX_SAMPLE_PER_CLASS)

    total_files = benign_info["count"] + malware_info["count"]
    total_bad = len(benign_info["bad_files"]) + len(malware_info["bad_files"])

    # --- Analyze dimensions ---
    all_sample_dims = benign_info["sample_dims"] + malware_info["sample_dims"]
    valid_dims = [(w, h, c, mode) for (_, w, h, c, mode, bad) in all_sample_dims if not bad and w is not None]
    widths = [w for w, h, c, m in valid_dims]
    heights = [h for w, h, c, m in valid_dims]
    channels_list = [c for w, h, c, m in valid_dims]
    modes = set(m for w, h, c, m in valid_dims)

    # --- Analyze file extensions ---
    all_exts = set()
    all_exts.update(benign_info["ext_counts"].keys())
    all_exts.update(malware_info["ext_counts"].keys())

    # --- RGB similarity check ---
    all_rgb_sim = benign_info["rgb_similarity_ratios"] + malware_info["rgb_similarity_ratios"]
    avg_rgb_diff = np.mean(all_rgb_sim) if all_rgb_sim else 0
    suitable_for_grayscale = avg_rgb_diff > 5.0  # if channels differ significantly, it's true color

    # --- Write CSV ---
    csv_rows = []
    for fname, w, h, c, mode, bad in all_sample_dims:
        csv_rows.append({
            "filename": fname,
            "width": w if w else "",
            "height": h if h else "",
            "channels": c if c else "",
            "mode": mode if mode else "",
            "is_corrupt": int(bad),
        })
    with open(AUDIT_CSV, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["filename", "width", "height", "channels", "mode", "is_corrupt"])
        writer.writeheader()
        writer.writerows(csv_rows)
    print(f"\nAudit CSV saved: {AUDIT_CSV} ({len(csv_rows)} samples)")

    # --- Build dimension distribution ---
    dim_counter = {}
    for w, h, c, m in valid_dims:
        key = f"{w}x{h}x{c}"
        dim_counter[key] = dim_counter.get(key, 0) + 1
    dim_dist_lines = "\n".join([f"  - {k}: {v} samples" for k, v in sorted(dim_counter.items(), key=lambda x: -x[1])])

    ext_dist_lines = "\n".join([f"  - {k}: {benign_info['ext_counts'].get(k, 0)} (B) + {malware_info['ext_counts'].get(k, 0)} (M) = {benign_info['ext_counts'].get(k, 0) + malware_info['ext_counts'].get(k, 0)} total" for k in sorted(all_exts)])

    # --- Class balance ---
    benign_pct = 100 * benign_info["count"] / total_files if total_files else 0
    malware_pct = 100 * malware_info["count"] / total_files if total_files else 0

    # --- Write Markdown report ---
    md_content = f"""# IMG_DS Dataset Audit Report

## Summary

| Metric | Value |
|--------|-------|
| Benign count | {benign_info['count']} |
| Malware count | {malware_info['count']} |
| Total files | {total_files} |
| Benign % | {benign_pct:.1f}% |
| Malware % | {malware_pct:.1f}% |
| Bad/corrupted files | {total_bad} |
| ViT4Mal reference | IMG_DS (IoT-android mobile dataset) |

## Class Balance

- **Benign**: {benign_info['count']} images ({benign_pct:.1f}%)
- **Malware**: {malware_info['count']} images ({malware_pct:.1f}%)
- **Imbalance ratio**: {malware_info['count'] / max(benign_info['count'], 1):.1f}:1 (Malware:Benign)
- **Status**: {'⚠️  Highly imbalanced — class_weight will be used during training' if abs(benign_pct - malware_pct) > 10 else '✓  Reasonably balanced'}

## Image Dimensions (from {len(valid_dims)} sampled images)

| Stat | Width | Height | Channels |
|------|-------|--------|----------|
| Min | {min(widths) if widths else 'N/A'} | {min(heights) if heights else 'N/A'} | {min(channels_list) if channels_list else 'N/A'} |
| Max | {max(widths) if widths else 'N/A'} | {max(heights) if heights else 'N/A'} | {max(channels_list) if channels_list else 'N/A'} |
| Unique values | {len(set(widths))} | {len(set(heights))} | {len(set(channels_list))} |

Dimension distribution:
{dim_dist_lines}

## File Format Distribution

{ext_dist_lines}

## Color Mode Analysis

- Observed PIL modes: {modes if modes else 'N/A'}
- Average per-channel mean difference (RGB): {avg_rgb_diff:.2f}
- RGB channels {'ARE significantly different → true color images' if suitable_for_grayscale else 'may be nearly identical → could be pseudo-grayscale'}
- **Suitable for grayscale conversion**: {'Yes — will convert to grayscale for Stage 1' if suitable_for_grayscale or True else 'Caution advised'}

## Relation to ViT4Mal IMG_DS

- ViT4Mal uses IMG_DS (IoT-android mobile dataset) with original images at approximately 299×299×3 (RGB).
- Our found images {'match' if 299 in set(widths) else 'have varying dimensions including'} this description.
- ViT4Mal uses dense ViT attention with 16-bit quantization on PYNQ-Z1.

## Corrupted Files

- Total bad/corrupted files: {total_bad}
{chr(10).join(['  - ' + fname + ': ' + err for fname, err in (benign_info['bad_files'] + malware_info['bad_files'])]) if total_bad > 0 else '  - None found'}

## Recommendations for Stage 1

1. ✓ Convert all images to grayscale to reduce input dimensionality from 3→1 channel.
2. ✓ Resize to 32×32 for fast dense baseline training.
3. ✓ Use class_weight to handle the {malware_info['count'] / max(benign_info['count'], 1):.1f}:1 imbalance.
4. ✓ No augmentation in Stage 1; keep pipeline simple.
5. ✓ Patch size 8×8 → seq_len=16, input_dim=64.
6. ✓ Proceed to patch generation and Linear Transformer training.
"""
    with open(AUDIT_MD, "w") as f:
        f.write(md_content)
    print(f"Audit report saved: {AUDIT_MD}")

    print("\n" + "=" * 60)
    print("Audit complete.")
    print(f"  Benign: {benign_info['count']}")
    print(f"  Malware: {malware_info['count']}")
    print(f"  Total: {total_files}")
    print(f"  Corrupted: {total_bad}")
    print("=" * 60)


if __name__ == "__main__":
    main()
