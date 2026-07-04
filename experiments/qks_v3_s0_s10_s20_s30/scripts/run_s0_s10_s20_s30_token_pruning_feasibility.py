#!/usr/bin/env python3
"""QKS-v3 Phase 1: real Top-K token compaction plus physical Q/K pruning.

Only S0/S10/S20/S30 are evaluated. Image preprocessing is invariant across
configs and measured once per sample/repeat (common-random-numbers design).
Config-dependent selection, compaction and quantization are measured without
masking or sample/run filtering.
"""
import argparse
import csv
import time
from pathlib import Path

import numpy as np
import torch
from PIL import Image

ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
CKPT = ROOT / "experiments/imgds_linear_sparse/checkpoints/best_linear_imgds_dense_r32_p8.pt"
DATA = ROOT / "experiments/imgds_linear_sparse/outputs/imgds_r32_p8_test.npz"
OUT = ROOT / "results/qks_v3_s0_s10_s20_s30"
EPS = 1e-6
CONFIGS = [
    ("Q16-QKSv3-S0", 0, 0.0, 16, 16),
    ("Q16-QKSv3-S10", 10, 12.5, 14, 14),
    ("Q16-QKSv3-S20", 20, 18.75, 13, 13),
    ("Q16-QKSv3-S30", 30, 31.25, 11, 11),
]


def layer_norm(x, gamma, beta):
    mean = x.mean(axis=-1, keepdims=True)
    var = ((x - mean) ** 2).mean(axis=-1, keepdims=True)
    return (x - mean) / np.sqrt(var + EPS) * gamma + beta


def feature_map(x):
    return np.where(x >= 0, x + 1.0, np.exp(x))


def metrics(pred, labels):
    tp = int(((pred == 1) & (labels == 1)).sum())
    fp = int(((pred == 1) & (labels == 0)).sum())
    fn = int(((pred == 0) & (labels == 1)).sum())
    precision = tp / (tp + fp) if tp + fp else 0.0
    recall = tp / (tp + fn) if tp + fn else 0.0
    f1 = 2 * precision * recall / (precision + recall) if precision + recall else 0.0
    return float((pred == labels).mean()), precision, recall, f1


def topk_compact_one(tokens, k):
    """Return compact [K,64] tensor and original indices; never returns [16,64] masked data."""
    scores = np.abs(tokens).sum(axis=1)
    if k == len(scores):
        idx = np.arange(k, dtype=np.int64)
    else:
        idx = np.argpartition(scores, -k)[-k:]
        idx.sort()  # retain spatial/positional order after importance selection
    return np.ascontiguousarray(tokens[idx]), idx


def compact_dataset(inputs, k):
    compact = np.empty((len(inputs), k, inputs.shape[2]), dtype=np.float32)
    indices = np.empty((len(inputs), k), dtype=np.int64)
    for i, sample in enumerate(inputs):
        compact[i], indices[i] = topk_compact_one(sample, k)
    return compact, indices


def forward(compact, indices, active_channels, w, batch=200):
    logits_all = []
    wq = w["Wq"][active_channels]
    wk = w["Wk"][active_channels]
    for start in range(0, len(compact), batch):
        end = min(start + batch, len(compact))
        inp = compact[start:end]
        idx = indices[start:end]
        x = inp @ w["Win"].T + w["bin"]
        x = x + w["pos"][idx]
        q = feature_map(x @ wq.T)
        k = feature_map(x @ wk.T)
        v = x @ w["Wv"].T
        kv = k.transpose(0, 2, 1) @ v
        ksum = k.sum(axis=1)
        normalizer = (q * ksum[:, None, :]).sum(axis=2) + EPS
        attended = (q @ kv) / normalizer[:, :, None]
        x = x + attended @ w["Wo"].T + w["bo"]
        x = layer_norm(x, w["ln1w"], w["ln1b"])
        hidden = np.maximum(x @ w["W0"].T + w["b0"], 0)
        x = x + hidden @ w["W3"].T + w["b3"]
        x = layer_norm(x, w["ln2w"], w["ln2b"])
        pooled = layer_norm(x.mean(axis=1), w["onw"], w["onb"])
        logits_all.append(pooled @ w["Wc"].T + w["bc"])
    return np.concatenate(logits_all)


def load_weights():
    state = torch.load(CKPT, map_location="cpu", weights_only=False)["model_state_dict"]
    n = lambda key: state[key].detach().cpu().numpy()
    return {"Win": n("backbone.input_projection.weight"), "bin": n("backbone.input_projection.bias"),
            "pos": n("backbone.position_embedding")[0], "Wq": n("backbone.layers.0.attention.query.weight"),
            "Wk": n("backbone.layers.0.attention.key.weight"), "Wv": n("backbone.layers.0.attention.value.weight"),
            "Wo": n("backbone.layers.0.attention.output.weight"), "bo": n("backbone.layers.0.attention.output.bias"),
            "W0": n("backbone.layers.0.feedforward.0.weight"), "b0": n("backbone.layers.0.feedforward.0.bias"),
            "W3": n("backbone.layers.0.feedforward.3.weight"), "b3": n("backbone.layers.0.feedforward.3.bias"),
            "ln1w": n("backbone.layers.0.norm1.weight"), "ln1b": n("backbone.layers.0.norm1.bias"),
            "ln2w": n("backbone.layers.0.norm2.weight"), "ln2b": n("backbone.layers.0.norm2.bias"),
            "onw": n("backbone.output_norm.weight"), "onb": n("backbone.output_norm.bias"),
            "Wc": n("backbone.classifier.weight"), "bc": n("backbone.classifier.bias")}


def measure_image_pipeline(paths, repeats):
    rows = []
    for rep in range(repeats):
        for sid, path in enumerate(paths):
            t0 = time.perf_counter_ns()
            with Image.open(path) as im:
                gray = im.convert("L"); gray.load()
            t1 = time.perf_counter_ns()
            resized = gray.resize((32, 32), Image.BILINEAR)
            t2 = time.perf_counter_ns()
            arr = np.asarray(resized, dtype=np.float32) / 255.0
            t3 = time.perf_counter_ns()
            patches = np.empty((16, 64), dtype=np.float32)
            z = 0
            for pr in range(4):
                for pc in range(4):
                    patches[z] = arr[pr*8:(pr+1)*8, pc*8:(pc+1)*8].reshape(-1); z += 1
            t4 = time.perf_counter_ns()
            rows.append((sid, rep, (t1-t0)/1e6, (t2-t1)/1e6, (t3-t2)/1e6, (t4-t3)/1e6))
        print(f"image pipeline repeat {rep+1}/{repeats}", flush=True)
    return rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--timing-repeats", type=int, default=30)
    args = ap.parse_args()
    if args.timing_repeats < 30:
        raise ValueError("formal Phase 1 requires at least 30 timing repeats")
    OUT.mkdir(parents=True, exist_ok=True)
    d = np.load(DATA, allow_pickle=False)
    inputs, labels, paths = d["X"].astype(np.float32), d["y"].astype(np.int64), d["paths"]
    if inputs.shape != (3444, 16, 64):
        raise ValueError(f"expected full 3444 test split, got {inputs.shape}")
    w = load_weights()
    rank = np.argsort(-(np.abs(w["Wq"]).sum(1) + np.abs(w["Wk"]).sum(1)))

    # Accuracy first; if it fails, timing is still recorded for a complete Phase-1 audit.
    evals = {}
    compact_cache = {}
    for config, nominal, actual, active, adim in CONFIGS:
        compact, indices = compact_dataset(inputs, active)
        assert compact.shape == (3444, active, 64)
        active_channels = np.sort(rank[:adim])
        pred = np.argmax(forward(compact, indices, active_channels, w), axis=1)
        evals[config] = metrics(pred, labels)
        compact_cache[config] = (compact, indices)
        print(config, compact.shape, evals[config], flush=True)

    # Invariant image-side work measured once and shared across configs.
    image_rows = measure_image_pipeline(paths, args.timing_repeats)
    image_by_key = {(sid, rep): vals for sid, rep, *vals in image_rows}
    per_rows = []
    config_times = {}
    for config, nominal, actual, active, adim in CONFIGS:
        timed = []
        for rep in range(args.timing_repeats):
            for sid, sample in enumerate(inputs):
                t0 = time.perf_counter_ns()
                scores = np.abs(sample).sum(axis=1)
                t1 = time.perf_counter_ns()
                if active == 16:
                    idx = np.arange(16, dtype=np.int64)
                else:
                    idx = np.argpartition(scores, -active)[-active:]; idx.sort()
                compact = np.ascontiguousarray(sample[idx])
                t2 = time.perf_counter_ns()
                quantized = np.clip(np.rint(compact.astype(np.float64) * 1024.0), -32768, 32767).astype(np.int16)
                _ = quantized.nbytes
                t3 = time.perf_counter_ns()
                decode, resize, norm, patch = image_by_key[(sid, rep)]
                select = (t1-t0)/1e6
                compact_ms = (t2-t1)/1e6
                quant = (t3-t2)/1e6
                prepared = patch + select + compact_ms + quant
                full = decode + resize + norm + prepared
                row = [config, sid, rep, int(labels[sid]), active, adim, decode, resize, norm, patch,
                       select, compact_ms, quant, prepared, full, False, True]
                per_rows.append(row); timed.append(row)
            print(f"{config} config timing repeat {rep+1}/{args.timing_repeats}", flush=True)
        config_times[config] = timed

    per_fields = ["config", "sample_id", "repeat_id", "label", "active_tokens", "attn_dim",
                  "image_decode_ms", "resize_ms", "normalize_ms", "patch_construction_ms",
                  "token_selection_ms", "compact_tensor_generation_ms", "quantization_ms",
                  "prepared_input_total_ms", "full_application_proxy_ms", "is_mask_based",
                  "is_true_token_compaction"]
    with (OUT / "software_feasibility_per_sample.csv").open("w", newline="") as f:
        wr = csv.writer(f); wr.writerow(per_fields); wr.writerows(per_rows)

    means, medians = [], []
    for cfg, *_ in CONFIGS:
        vals = np.asarray([r[14] for r in config_times[cfg]])
        means.append(float(vals.mean())); medians.append(float(np.median(vals)))
    mono_mean = all(a > b for a, b in zip(means, means[1:]))
    mono_median = all(a > b for a, b in zip(medians, medians[1:]))
    s0acc = evals[CONFIGS[0][0]][0]
    summary = []
    for ci, (config, nominal, actual, active, adim) in enumerate(CONFIGS):
        arr = np.asarray([r[6:15] for r in config_times[config]], dtype=np.float64)
        acc, prec, rec, f1 = evals[config]
        drop = (s0acc - acc) * 100.0
        eligible = drop <= 1.0 and mono_median
        summary.append([config, nominal, actual, active, adim, acc, prec, rec, f1, drop,
                        *arr[:, :7].mean(axis=0), arr[:, 7].mean(), arr[:, 8].mean(),
                        float(np.median(arr[:, 8])), mono_mean, mono_median, False, True, eligible,
                        "raw-patch L1 Top-K; compact shape [N,K,64]; original positional indices retained; invariant image timings shared across configs"])
    fields = ["config", "nominal_sparsity", "actual_sparsity", "active_tokens", "attn_dim", "accuracy",
              "precision", "recall", "f1", "accuracy_drop_vs_s0", "image_decode_ms_mean", "resize_ms_mean",
              "normalize_ms_mean", "patch_construction_ms_mean", "token_selection_ms_mean",
              "compact_tensor_generation_ms_mean", "quantization_ms_mean", "prepared_input_total_ms_mean",
              "full_application_proxy_ms_mean", "full_application_proxy_ms_median",
              "is_full_application_proxy_mean_monotonic", "is_full_application_proxy_median_monotonic",
              "is_mask_based", "is_true_token_compaction", "eligible_for_hls", "notes"]
    with (OUT / "software_feasibility_summary.csv").open("w", newline="") as f:
        wr = csv.writer(f); wr.writerow(fields); wr.writerows(summary)

    accuracy_ok = all(r[9] <= 1.0 for r in summary)
    passed = accuracy_ok and mono_median
    report = "# QKS-v3 Phase 1 software feasibility\n\n"
    report += f"- Samples: 3444 (unchanged IMG_DS test order)\n- Timing repeats: {args.timing_repeats}\n"
    report += "- Selection: raw patch L1 Top-K; compact `[K,64]`; no mask\n"
    report += f"- Mean monotonic: {mono_mean}\n- Median monotonic: {mono_median}\n- Accuracy criterion passed: {accuracy_ok}\n"
    report += f"- Phase 1 passed: {passed}\n\n"
    report += "Image decode/resize/normalize/patch measurements are common to all configs by design because these operations are identical and occur before token selection. No sample or repeat was removed. `full_application_proxy` sums those measurements with config-specific selection, compaction and quantization; it is not a PYNQ result.\n\n"
    if passed:
        report += "Phase 1 meets the stated gate and is eligible to proceed to HLS.\n"
    elif not accuracy_ok:
        report += "Phase 1 failed the accuracy gate. Stop before HLS.\n"
    else:
        report += "Phase 1 failed the median monotonicity gate. Stop before HLS.\n"
    (OUT / "software_feasibility_report.md").write_text(report)
    print(f"PHASE1_PASS={passed} mean_monotonic={mono_mean} median_monotonic={mono_median} accuracy_ok={accuracy_ok}")


if __name__ == "__main__":
    main()
