#!/usr/bin/env python3
"""
QKS-v2 PYNQ-Z2 full test script — physically pruned Q/K structured sparsity.
Run on PYNQ-Z2: bash run_pynq.sh run_qks_v2_pynq.py --bit BIT --hwh HWH --data DATA [--limit N]

Data source: IMG_DS JPEG images (3444 total)
Normalization, 8x8 patch transform, Q6.10 quantization done on host.
"""
import os, sys, time, csv, argparse, numpy as np

# ── Fixed-point constants ──────────────────────────────────────────
FP_SCALE = 1 << 10    # Q6.10
FP_I16_MAX = 32767
FP_I16_MIN = -32768

def float_to_q16(x):
    q = np.round(x.astype(np.float64) * FP_SCALE)
    q = np.clip(q, FP_I16_MIN, FP_I16_MAX)
    return q.astype(np.int16)

def q16_to_float(x):
    return x.astype(np.float32) / np.float32(FP_SCALE)

# ── IMG_DS preprocessing ──────────────────────────────────────────
# Must match the HLS input format exactly: [seq_len=16, input_dim=64], Q6.10 int16.
# Images are 32x32 grayscale, partitioned into 8x8 patches = 16 patches, 64 pixels each.
# Normalization: pixel/255.0, then patch extraction row-major.

def preprocess_image(img_path):
    """Read a grayscale 32x32 image, normalize, extract 8x8 patches -> [16, 64] float."""
    from PIL import Image
    img = Image.open(img_path).convert('L')
    img = img.resize((32, 32), Image.BILINEAR)
    pixels = np.array(img, dtype=np.float32) / 255.0
    # Extract 8x8 patches: 4 rows × 4 cols = 16 patches, each 8×8=64 pixels
    patches = []
    for pr in range(4):
        for pc in range(4):
            patch = pixels[pr*8:(pr+1)*8, pc*8:(pc+1)*8]
            patches.append(patch.flatten())
    return np.array(patches, dtype=np.float32)  # [16, 64]

# ── PYNQ hardware interface ────────────────────────────────────────
def run_pynq_inference(ol, inputs_q16):
    """
    Run inference on a batch of preprocessed, quantized inputs.
    inputs_q16: [N, 16, 64] int16
    Returns: logits [N, 2] float32
    """
    from pynq import Overlay, allocate

    ip = ol.q16_qksv2_d11_0
    N = inputs_q16.shape[0]

    # Allocate DMA buffers
    input_bytes = N * 16 * 64 * 2  # int16 = 2 bytes
    output_bytes = N * 2 * 2        # 2 classes × int16 = 4 bytes per sample

    in_buf = allocate(shape=(N * 16 * 64,), dtype=np.int16)
    out_buf = allocate(shape=(N * 2,), dtype=np.int16)

    # Flatten and copy input
    flat = inputs_q16.reshape(-1)
    in_buf[:] = flat[:]
    in_buf.flush()

    # Set DMA pointers (AXI-lite offset registers)
    in_phys = in_buf.physical_address
    out_phys = out_buf.physical_address

    # Write physical addresses to IP registers
    ip.register_map.input_r_1 = in_phys & 0xFFFFFFFF
    ip.register_map.input_r_2 = (in_phys >> 32) & 0xFFFFFFFF
    ip.register_map.logits_1 = out_phys & 0xFFFFFFFF
    ip.register_map.logits_2 = (out_phys >> 32) & 0xFFFFFFFF

    # Start IP
    ip.register_map.CTRL = 1  # ap_start
    # Wait for done
    while not (ip.register_map.CTRL & 2):  # ap_done bit
        pass

    # Read output
    out_buf.invalidate()
    logits_q16 = np.array(out_buf[:N*2], dtype=np.int16).reshape(N, 2)
    logits = q16_to_float(logits_q16)

    del in_buf, out_buf
    return logits


def run_pynq_inference_single(ol, input_q16):
    """Run single sample inference."""
    return run_pynq_inference(ol, input_q16[np.newaxis, :, :])


def main():
    parser = argparse.ArgumentParser(description="QKS-v2 PYNQ-Z2 test")
    parser.add_argument("--bit", required=True, help="Path to .bit file")
    parser.add_argument("--hwh", required=True, help="Path to .hwh file")
    parser.add_argument("--data", required=True, help="Path to IMG_DS directory")
    parser.add_argument("--out", required=True, help="Output directory")
    parser.add_argument("--limit", type=int, default=20, help="Number of images (default: 20 for smoke)")
    parser.add_argument("--labels", default=None, help="Path to labels CSV")
    args = parser.parse_args()

    os.makedirs(args.out, exist_ok=True)

    # ── Load labels ────────────────────────────────────────────────
    label_path = args.labels or os.path.join(args.data, "labels.csv")
    labels = {}
    if os.path.exists(label_path):
        with open(label_path) as f:
            for line in f:
                parts = line.strip().split(",")
                if len(parts) >= 2:
                    labels[parts[0]] = int(parts[1])

    # ── Find image files ───────────────────────────────────────────
    img_dir = args.data
    if os.path.isdir(os.path.join(img_dir, "images")):
        img_dir = os.path.join(img_dir, "images")
    elif os.path.isdir(os.path.join(img_dir, "IMG_DS")):
        img_dir = os.path.join(img_dir, "IMG_DS")

    # Try to find images - look for JPEGs recursively
    import glob
    image_files = sorted(glob.glob(os.path.join(img_dir, "**", "*.jpg"), recursive=True))
    if not image_files:
        image_files = sorted(glob.glob(os.path.join(img_dir, "**", "*.jpeg"), recursive=True))
    if not image_files:
        image_files = sorted(glob.glob(os.path.join(img_dir, "**", "*.png"), recursive=True))

    print(f"Found {len(image_files)} images in {img_dir}")
    if args.limit:
        image_files = image_files[:args.limit]
    print(f"Processing {len(image_files)} images")

    # ── Preprocess ─────────────────────────────────────────────────
    print("Preprocessing images...")
    all_inputs = []
    for i, img_path in enumerate(image_files):
        if i % 500 == 0:
            print(f"  Preprocessing {i}/{len(image_files)}...")
        try:
            patches = preprocess_image(img_path)
            patches_q16 = float_to_q16(patches)
            all_inputs.append(patches_q16)
        except Exception as e:
            print(f"  WARNING: Failed to preprocess {img_path}: {e}")
            continue

    if not all_inputs:
        print("ERROR: No images could be preprocessed!")
        sys.exit(1)

    inputs_np = np.array(all_inputs, dtype=np.int16)
    print(f"Preprocessed {len(all_inputs)} images, shape: {inputs_np.shape}")

    # ── Load overlay ───────────────────────────────────────────────
    from pynq import Overlay, allocate
    print(f"Loading overlay: {args.bit}")
    ol = Overlay(args.bit)
    print(f"Overlay loaded. IP: {list(ol.ip_dict.keys())}")

    # ── Run inference ──────────────────────────────────────────────
    print("Running PYNQ inference...")
    # Process in batches of 1 (each sample needs its own DMA setup with this IP)
    all_logits = []
    inference_times_us = []

    BATCH = 1
    for i in range(0, len(inputs_np), BATCH):
        if i % 200 == 0:
            print(f"  Inference {i}/{len(inputs_np)}...")
        batch = inputs_np[i:i+BATCH]
        t0 = time.perf_counter()
        logits = run_pynq_inference(ol, batch)
        t1 = time.perf_counter()
        all_logits.append(logits)
        inference_times_us.append((t1 - t0) * 1e6)

    all_logits = np.concatenate(all_logits, axis=0)

    # ── Compute metrics ────────────────────────────────────────────
    predictions = np.argmax(all_logits, axis=1)

    # Get true labels
    true_labels = []
    for img_path in image_files:
        fname = os.path.basename(img_path)
        if fname in labels:
            true_labels.append(labels[fname])
        elif "benign" in img_path.lower():
            true_labels.append(0)
        elif "malware" in img_path.lower() or "malign" in img_path.lower():
            true_labels.append(1)
        else:
            true_labels.append(-1)

    true_labels = np.array(true_labels, dtype=np.int32)
    valid = true_labels >= 0

    if valid.sum() > 0:
        pred_v = predictions[valid]
        true_v = true_labels[valid]
        acc = (pred_v == true_v).mean()

        tp = ((pred_v == 1) & (true_v == 1)).sum()
        fp = ((pred_v == 1) & (true_v == 0)).sum()
        fn = ((pred_v == 0) & (true_v == 1)).sum()
        tn = ((pred_v == 0) & (true_v == 0)).sum()
        precision = tp / (tp + fp) if (tp + fp) > 0 else 0.0
        recall = tp / (tp + fn) if (tp + fn) > 0 else 0.0
        f1 = 2 * precision * recall / (precision + recall) if (precision + recall) > 0 else 0.0
    else:
        acc = precision = recall = f1 = 0.0
        tp = fp = fn = tn = 0

    itimes = np.array(inference_times_us)

    # ── Save metrics ───────────────────────────────────────────────
    metrics_csv = os.path.join(args.out, "metrics.csv")
    with open(metrics_csv, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["metric", "value"])
        writer.writerow(["config", os.path.basename(args.bit).replace(".bit", "")])
        writer.writerow(["num_samples", len(all_logits)])
        writer.writerow(["num_with_labels", int(valid.sum())])
        writer.writerow(["accuracy", f"{acc:.6f}"])
        writer.writerow(["precision", f"{precision:.6f}"])
        writer.writerow(["recall", f"{recall:.6f}"])
        writer.writerow(["f1", f"{f1:.6f}"])
        writer.writerow(["tp", int(tp)])
        writer.writerow(["tn", int(tn)])
        writer.writerow(["fp", int(fp)])
        writer.writerow(["fn", int(fn)])
        writer.writerow(["inference_mean_us", f"{itimes.mean():.4f}"])
        writer.writerow(["inference_std_us", f"{itimes.std():.4f}"])
        writer.writerow(["inference_p50_us", f"{np.percentile(itimes, 50):.4f}"])
        writer.writerow(["inference_p95_us", f"{np.percentile(itimes, 95):.4f}"])
        writer.writerow(["bit_path", args.bit])
        writer.writerow(["hwh_path", args.hwh])

    print(f"\n{'='*60}")
    print(f"QKS-v2 PYNQ Test Results — {os.path.basename(args.bit).replace('.bit', '')}")
    print(f"{'='*60}")
    print(f"Samples: {len(all_logits)} (with labels: {valid.sum()})")
    print(f"Accuracy:  {acc*100:.4f}%")
    print(f"Precision: {precision:.4f}")
    print(f"Recall:    {recall:.4f}")
    print(f"F1:        {f1:.4f}")
    print(f"TP={tp} TN={tn} FP={fp} FN={fn}")
    print(f"Inf mean: {itimes.mean():.2f} us")
    print(f"Inf P50:  {np.percentile(itimes, 50):.2f} us")
    print(f"Inf P95:  {np.percentile(itimes, 95):.2f} us")
    print(f"\nMetrics saved to: {metrics_csv}")

if __name__ == "__main__":
    main()
