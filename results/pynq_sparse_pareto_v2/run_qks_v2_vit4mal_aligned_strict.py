#!/usr/bin/env python3
"""Strict, reusable-buffer QKS-v2 timing runner for PYNQ-Z2.

The timed boundary starts immediately before copying one already-prepared
Q6.10 patch tensor into the PYNQ buffer and ends after output conversion and
argmax. Overlay loading, NPZ loading, allocation, warm-up and logging are
outside the timed region.
"""
import argparse
import csv
import os
import time

import numpy as np


SCALE = np.float32(1024.0)
CONFIG_META = {
    "Q16-QKSv2-S0": (16, "0%", 13322, 147, 12733, 15),
    "Q16-QKSv2-S10": (14, "12.5%", 13344, 147, 12735, 15),
    "Q16-QKSv2-S20": (13, "18.75%", 13349, 148, 12779, 15),
    "Q16-QKSv2-S30": (11, "31.25%", 13347, 148, 12779, 15),
}


def load_prepared_npz(path):
    z = np.load(path, allow_pickle=False)
    keys = set(z.files)
    xkey = next((k for k in ("inputs", "X", "x", "test_inputs", "images") if k in keys), None)
    ykey = next((k for k in ("labels", "y", "Y", "test_labels", "targets") if k in keys), None)
    if xkey is None or ykey is None:
        raise KeyError("NPZ must contain an input and label array; keys=" + repr(z.files))
    x = np.asarray(z[xkey])
    y = np.asarray(z[ykey]).reshape(-1).astype(np.int64)
    if x.shape[0] != y.shape[0]:
        raise ValueError(f"input/label length mismatch: {x.shape[0]} vs {y.shape[0]}")
    if x.shape[1:] != (16, 64):
        x = x.reshape(x.shape[0], 16, 64)
    if x.dtype != np.int16:
        x = np.clip(np.rint(x.astype(np.float64) * 1024.0), -32768, 32767).astype(np.int16)
    return np.ascontiguousarray(x), y


def find_ip(overlay):
    candidates = [(name, obj) for name, obj in overlay.__dict__.items()
                  if name.startswith("q16_qksv2_") and hasattr(obj, "register_map")]
    if len(candidates) == 1:
        return candidates[0]
    names = [n for n in overlay.ip_dict if "qksv2" in n.lower()]
    if len(names) != 1:
        raise RuntimeError(f"expected one QKS-v2 IP, found {names}")
    leaf = names[0].split("/")[-1]
    return names[0], getattr(overlay, leaf)


def percentile(a, p):
    return float(np.percentile(np.asarray(a, dtype=np.float64), p))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--config", required=True, choices=CONFIG_META)
    ap.add_argument("--bit", required=True)
    ap.add_argument("--hwh", required=True, help="Kept explicit for provenance; must share basename with bit")
    ap.add_argument("--npz", required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--repeats", type=int, default=5)
    ap.add_argument("--warmup", type=int, default=20)
    ap.add_argument("--limit", type=int, default=0, help="0 means all samples; nonzero is smoke only")
    args = ap.parse_args()
    if os.path.splitext(args.bit)[0] != os.path.splitext(args.hwh)[0]:
        raise ValueError("bit and hwh must have the same basename")
    os.makedirs(args.out, exist_ok=True)

    # Explicitly outside timing.
    inputs, labels = load_prepared_npz(args.npz)
    if args.limit:
        inputs, labels = inputs[:args.limit], labels[:args.limit]
    from pynq import Overlay, allocate
    overlay = Overlay(args.bit)
    ip_name, ip = find_ip(overlay)
    in_buf = allocate(shape=(16 * 64,), dtype=np.int16)
    out_buf = allocate(shape=(2,), dtype=np.int16)
    in_addr, out_addr = int(in_buf.physical_address), int(out_buf.physical_address)

    fields = ["config", "sample_id", "repeat_id", "label", "prediction", "correct",
              "buf_write_us", "cache_flush_us", "register_setup_us", "kernel_us",
              "output_readback_us", "classifier_us", "patch_embedding_us",
              "weight_transfer_us", "total_vit4mal_aligned_us"]
    rows = []

    def invoke(sample, record=False, sample_id=-1, repeat_id=-1, label=-1):
        total0 = time.perf_counter_ns()
        t0 = time.perf_counter_ns(); in_buf[:] = sample.reshape(-1); t1 = time.perf_counter_ns()
        in_buf.flush(); t2 = time.perf_counter_ns()
        ip.register_map.input_r_1 = in_addr & 0xFFFFFFFF
        ip.register_map.input_r_2 = (in_addr >> 32) & 0xFFFFFFFF
        ip.register_map.logits_1 = out_addr & 0xFFFFFFFF
        ip.register_map.logits_2 = (out_addr >> 32) & 0xFFFFFFFF
        t3 = time.perf_counter_ns()
        ip.register_map.CTRL = 1
        while not (int(ip.register_map.CTRL) & 2):
            pass
        t4 = time.perf_counter_ns()
        out_buf.invalidate()
        logits = np.asarray(out_buf[:], dtype=np.int16).astype(np.float32) / SCALE
        t5 = time.perf_counter_ns()
        pred = int(np.argmax(logits))
        t6 = time.perf_counter_ns()
        if record:
            us = lambda a, b: (b - a) / 1000.0
            rows.append([args.config, sample_id, repeat_id, int(label), pred, int(pred == label),
                         us(t0, t1), us(t1, t2), us(t2, t3), us(t3, t4), us(t4, t5),
                         us(t5, t6), 0.0, 0.0, us(total0, t6)])

    for i in range(args.warmup):
        invoke(inputs[i % len(inputs)])
    for repeat in range(args.repeats):
        for i, (sample, label) in enumerate(zip(inputs, labels)):
            invoke(sample, True, i, repeat, label)

    per_path = os.path.join(args.out, f"{args.config}_strict_per_sample.csv")
    with open(per_path, "w", newline="") as f:
        w = csv.writer(f); w.writerow(fields); w.writerows(rows)

    numeric = {name: np.asarray([r[j] for r in rows], dtype=np.float64)
               for j, name in enumerate(fields) if name.endswith("_us")}
    pred = np.asarray([r[4] for r in rows[:len(inputs)]])
    tp = int(((pred == 1) & (labels == 1)).sum()); fp = int(((pred == 1) & (labels == 0)).sum())
    fn = int(((pred == 0) & (labels == 1)).sum())
    precision = tp / (tp + fp) if tp + fp else 0.0
    recall = tp / (tp + fn) if tp + fn else 0.0
    f1 = 2 * precision * recall / (precision + recall) if precision + recall else 0.0
    attn_dim, sparsity, lut, dsp, ff, bram = CONFIG_META[args.config]
    total = numeric["total_vit4mal_aligned_us"]
    summary_fields = ["config", "paper_name", "attn_dim", "actual_sparsity", "accuracy", "precision", "recall", "f1",
        "num_samples", "num_repeats", "kernel_us_mean", "kernel_us_p50", "kernel_us_p95",
        "buf_write_us_mean", "cache_flush_us_mean", "register_setup_us_mean", "output_readback_us_mean",
        "classifier_us_mean", "patch_embedding_us_mean", "weight_transfer_us_mean",
        "total_vit4mal_aligned_us_mean", "total_vit4mal_aligned_us_p50", "total_vit4mal_aligned_us_p95",
        "total_vit4mal_aligned_us_std", "latency_reduction_vs_s0_kernel_percent",
        "latency_reduction_vs_s0_vit4mal_aligned_percent", "speedup_vs_vit4mal_0p81s",
        "speedup_vs_vit4mal_1p48s", "vivado_lut", "vivado_dsp", "vivado_ff", "vivado_bram",
        "timing_pass", "notes"]
    mean = lambda k: float(numeric[k].mean())
    values = [args.config, args.config, attn_dim, sparsity, float(np.mean(pred == labels)), precision, recall, f1,
        len(inputs), args.repeats, mean("kernel_us"), percentile(numeric["kernel_us"], 50),
        percentile(numeric["kernel_us"], 95), mean("buf_write_us"), mean("cache_flush_us"),
        mean("register_setup_us"), mean("output_readback_us"), mean("classifier_us"), 0.0, 0.0,
        float(total.mean()), percentile(total, 50), percentile(total, 95), float(total.std()), "PENDING_MERGE",
        "PENDING_MERGE", 810000.0 / float(total.mean()), 1480000.0 / float(total.mean()), lut, dsp, ff,
        bram, "PASS" if len(inputs) == 3444 and args.repeats >= 5 else "SMOKE_ONLY",
        f"ip={ip_name}; prepared Q6.10 patch tensor; reusable buffers; weights static in bitstream; overlay/NPZ/allocation/warmup/logging excluded"]
    with open(os.path.join(args.out, f"{args.config}_strict_summary.csv"), "w", newline="") as f:
        w = csv.writer(f); w.writerow(summary_fields); w.writerow(values)
    print(f"completed {args.config}: samples={len(inputs)}, repeats={args.repeats}, mean={total.mean():.3f} us")


if __name__ == "__main__":
    main()
