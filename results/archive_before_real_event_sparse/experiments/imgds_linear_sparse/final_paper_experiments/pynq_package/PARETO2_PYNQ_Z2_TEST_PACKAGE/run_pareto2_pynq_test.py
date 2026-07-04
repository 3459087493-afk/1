#!/usr/bin/env python3
"""
PARETO2 PYNQ-Z2 On-Board Test Script
=====================================
Deploy Q16-S0-PARETO2 Linear Transformer IP to PYNQ-Z2,
measure kernel runtime, total runtime, accuracy, and compute
speedup vs ViT4Mal published results.

Run on PYNQ-Z2:
    sudo python3 run_pareto2_pynq_test.py

Output:
    ../../latency/pynq_pareto2_runtime.csv
"""

import os
import sys
import time
import csv
import numpy as np

# ---- Configuration ----
BIT_FILE = "pareto2.bit"
HWH_FILE = "pareto2.hwh"
EVAL_NPZ = "eval_samples_q16.npz"
EXPECTED_LOGITS_NPY = "expected_outputs.npy"
EXPECTED_LABELS_NPY = "expected_labels.npy"
OUTPUT_CSV = "../../latency/pynq_pareto2_runtime.csv"

N_WARMUP = 10
N_BENCHMARK = 100
VIT4MAL_FASTEST_S = 0.81       # ViT4Mal 1enc2head PYNQ-Z1 measured
VIT4MAL_RECOMMENDED_S = 1.48   # ViT4Mal 2enc4head PYNQ-Z1 measured


def check_prerequisites():
    """Verify all required files exist."""
    missing = []
    for f in [BIT_FILE, HWH_FILE, EVAL_NPZ, EXPECTED_LOGITS_NPY, EXPECTED_LABELS_NPY]:
        if not os.path.exists(f):
            missing.append(f)
    if missing:
        print(f"ERROR: Missing required files: {missing}")
        print("Generate bitstream from Vivado and copy .bit/.hwh to this directory.")
        print("If these are still pending, this script cannot run yet.")
        sys.exit(1)
    print("All required files found.")


def load_data():
    """Load eval samples and expected outputs."""
    data = np.load(EVAL_NPZ)
    X = data["X"]       # (200, 16, 64) float32
    y = data["y"]       # (200,) int64
    expected_logits = np.load(EXPECTED_LOGITS_NPY)  # (200, 2) float32
    expected_labels = np.load(EXPECTED_LABELS_NPY)  # (200,) int64
    print(f"Loaded {len(X)} samples: X{X.shape}, y{y.shape}")
    return X, y, expected_logits, expected_labels


def deploy_overlay():
    """Load bitstream and get handle to the HLS IP kernel."""
    from pynq import Overlay
    overlay = Overlay(BIT_FILE)
    print(f"Bitstream loaded: {BIT_FILE}")
    # Adjust IP name based on Vivado block design
    # Common naming: overlay.<top_function>_0 or overlay.<ip_name>_0
    ip_names = [d for d in dir(overlay) if not d.startswith("_")]
    print(f"Available IP blocks: {ip_names}")
    # Look for our IP
    kernel = None
    for name in ip_names:
        if "imgds" in name.lower() or "linear" in name.lower() or "transformer" in name.lower():
            kernel = getattr(overlay, name)
            print(f"Found kernel: {name}")
            break
    if kernel is None:
        # fallback: use first IP block
        for name in ip_names:
            obj = getattr(overlay, name)
            if hasattr(obj, "write") and hasattr(obj, "read"):
                kernel = obj
                print(f"Fallback kernel: {name}")
                break
    if kernel is None:
        raise RuntimeError("No IP kernel found in overlay. Check block design name.")
    return overlay, kernel


def run_single_inference(kernel, sample):
    """Run a single inference on the FPGA kernel. Returns logits array."""
    # Write input to kernel
    # Adjust register map based on actual HLS IP interface
    # This is a template - adjust addresses to match the generated IP
    flat = sample.flatten()
    # Assuming AXI-Lite or memory-mapped interface
    # For streaming interface, use DMA
    kernel.write(0x10, flat.tobytes())  # adjust offset as needed
    kernel.write(0x00, 0x01)            # start signal
    while kernel.read(0x00) & 0x02 == 0:  # wait for done
        pass
    # Read output logits
    result_bytes = kernel.read(0x20, 2 * 4)  # 2 float32 logits
    logits = np.frombuffer(result_bytes, dtype=np.float32)
    return logits


def benchmark_kernel(kernel, X):
    """Run warmup + benchmark on kernel only."""
    print(f"Warmup: {N_WARMUP} runs...")
    sample = X[0]
    for i in range(N_WARMUP):
        _ = run_single_inference(kernel, sample)

    print(f"Benchmark: kernel-only {N_BENCHMARK} runs on sample 0...")
    kernel_times = []
    sample = X[0]
    for i in range(N_BENCHMARK):
        t0 = time.perf_counter()
        _ = run_single_inference(kernel, sample)
        t1 = time.perf_counter()
        kernel_times.append((t1 - t0) * 1e6)  # seconds -> microseconds

    kernel_times = np.array(kernel_times)
    print(f"  Kernel mean: {kernel_times.mean():.2f} us")
    print(f"  Kernel std:  {kernel_times.std():.2f} us")
    return kernel_times


def benchmark_total_inference(kernel, X):
    """Benchmark total inference including pre/post processing."""
    print(f"Benchmark: total inference {N_BENCHMARK} runs on sample 0...")
    total_times = []
    sample = X[0]
    for i in range(N_BENCHMARK):
        t0 = time.perf_counter()
        # Pre-processing: flatten and (if needed) quantize
        flat = sample.flatten().astype(np.float32)
        # Run kernel
        logits = run_single_inference(kernel, sample)
        # Post-processing: argmax
        pred = np.argmax(logits)
        t1 = time.perf_counter()
        total_times.append((t1 - t0) * 1e6)

    total_times = np.array(total_times)
    print(f"  Total mean: {total_times.mean():.2f} us")
    print(f"  Total std:  {total_times.std():.2f} us")
    return total_times


def evaluate_accuracy(kernel, X, expected_logits, expected_labels):
    """Run inference on all 200 eval samples and compute match rates."""
    print("Evaluating accuracy on 200 samples...")
    hw_predictions = []
    match_q32 = 0
    abs_errors = []

    for i, sample in enumerate(X):
        logits = run_single_inference(kernel, sample)
        pred = int(np.argmax(logits))
        hw_predictions.append(pred)

        # Match rate vs Q32 reference
        ref_pred = int(np.argmax(expected_logits[i]))
        if pred == ref_pred:
            match_q32 += 1

        abs_errors.append(np.max(np.abs(logits - expected_logits[i])))

    match_q32_rate = match_q32 / len(X)
    hw_acc = np.mean(np.array(hw_predictions) == expected_labels)
    ref_acc = np.mean(np.argmax(expected_logits, axis=1) == expected_labels)

    print(f"  Prediction match rate vs Q32: {match_q32_rate:.4f} ({match_q32}/{len(X)})")
    print(f"  HW label accuracy:     {hw_acc:.4f}")
    print(f"  Reference accuracy:    {ref_acc:.4f}")
    print(f"  Max abs error vs Q32:  {np.max(abs_errors):.8f}")
    print(f"  Mean abs error vs Q32: {np.mean(abs_errors):.8f}")

    return match_q32_rate, hw_acc, ref_acc, abs_errors


def compute_speedup(total_mean_us):
    """Compute speedup vs ViT4Mal published latencies."""
    total_mean_s = total_mean_us / 1e6
    speedup_fastest = VIT4MAL_FASTEST_S / total_mean_s
    speedup_recommended = VIT4MAL_RECOMMENDED_S / total_mean_s
    print(f"\nSpeedup Analysis (assuming {total_mean_us:.2f} us = {total_mean_s:.6f} s):")
    print(f"  vs ViT4Mal fastest (0.81s):     {speedup_fastest:.1f}x")
    print(f"  vs ViT4Mal recommended (1.48s):  {speedup_recommended:.1f}x")
    return speedup_fastest, speedup_recommended


def save_results(kernel_times, total_times, match_q32_rate, hw_acc, ref_acc,
                 abs_errors, speedup_fastest, speedup_recommended):
    """Save all results to CSV."""
    os.makedirs(os.path.dirname(OUTPUT_CSV), exist_ok=True)

    results = {
        "single_kernel_runtime_us": kernel_times[0] if len(kernel_times) > 0 else "N/A",
        "kernel_runtime_mean_us_100runs": kernel_times.mean(),
        "kernel_runtime_std_us_100runs": kernel_times.std(),
        "total_runtime_mean_us_100runs": total_times.mean(),
        "total_runtime_std_us_100runs": total_times.std(),
        "throughput_samples_per_sec": 1e6 / total_times.mean() if total_times.mean() > 0 else "N/A",
        "prediction_match_rate_vs_q32": match_q32_rate,
        "hw_label_accuracy": hw_acc,
        "ref_label_accuracy": ref_acc,
        "speedup_vs_vit4mal_fastest_0p81s": speedup_fastest,
        "speedup_vs_vit4mal_recommended_1p48s": speedup_recommended,
        "max_abs_error_vs_q32": np.max(abs_errors),
        "mean_abs_error_vs_q32": np.mean(abs_errors),
        "n_benchmark_runs": N_BENCHMARK,
        "n_eval_samples": 200,
        "latency_source": "PYNQ_MEASURED",
        "pynq_measured": True,
    }

    with open(OUTPUT_CSV, "w", newline="") as f:
        writer = csv.writer(f)
        for key, value in results.items():
            writer.writerow([key, value])

    print(f"\nResults saved to: {OUTPUT_CSV}")

    # Also print summary table
    print("\n" + "=" * 60)
    print("PARETO2 PYNQ-Z2 BOARD TEST RESULTS")
    print("=" * 60)
    for key, value in results.items():
        if isinstance(value, float):
            print(f"  {key}: {value:.6f}")
        else:
            print(f"  {key}: {value}")
    print("=" * 60)


def main():
    print("=" * 60)
    print("PARETO2 PYNQ-Z2 Board Test")
    print("=" * 60)

    check_prerequisites()
    X, y, expected_logits, expected_labels = load_data()
    overlay, kernel = deploy_overlay()

    # Benchmark kernel only
    kernel_times = benchmark_kernel(kernel, X)

    # Benchmark total inference
    total_times = benchmark_total_inference(kernel, X)

    # Evaluate accuracy on all 200 samples
    match_q32_rate, hw_acc, ref_acc, abs_errors = evaluate_accuracy(
        kernel, X, expected_logits, expected_labels
    )

    # Compute speedup
    speedup_fastest, speedup_recommended = compute_speedup(total_times.mean())

    # Save results
    save_results(kernel_times, total_times, match_q32_rate, hw_acc, ref_acc,
                 abs_errors, speedup_fastest, speedup_recommended)

    print("\nDone.")


if __name__ == "__main__":
    main()
