#!/usr/bin/env python3
"""
QKS-v2 Phase 1: Software Reference with Physically Pruned Q/K Matrices.

Key difference from v1:
  v1: full Wq[16,16] + ACTIVE_CHANNELS indirect indexing + sparse Q[16,16]
  v2: Wq_pruned[ATTN_DIM,16] + direct loops + Q[16,ATTN_DIM]

Strategy:
  Rank Q/K output channels by L1 norm of Wq+Wk weight rows.
  For each ATTN_DIM in {16, 14, 13, 11, 10, 8}:
    1. Create physically smaller Wq_pruned, Wk_pruned matrices
    2. Run inference where Q,K have ATTN_DIM output channels
    3. KV[ATTN_DIM,16], K_sum[ATTN_DIM] are physically smaller
    4. V, Wo, FFN, input_projection remain FULL 16-channel
"""
import os, sys, json, csv
from pathlib import Path

import numpy as np
import torch
import torch.nn.functional as F

# ── Paths ──────────────────────────────────────────────────────────
PROJ_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
CKPT_PATH = PROJ_ROOT / "experiments/imgds_linear_sparse/checkpoints/best_linear_imgds_dense_r32_p8.pt"
TEST_NPZ  = PROJ_ROOT / "experiments/imgds_linear_sparse/q16_full_pynq_validation/q16_main_test_3444.npz"
OUT_DIR   = PROJ_ROOT / "results/pynq_sparse_pareto_v2"
WEIGHTS_DIR = OUT_DIR / "weights"
OUT_DIR.mkdir(parents=True, exist_ok=True)

# ── Model Config (matches LinearUNSWAnomalyDetector in src/transformer.py) ──
SEQ_LEN     = 16
INPUT_DIM   = 64
D_MODEL     = 16
FF_DIM      = 32
N_CLASSES   = 2
EPS         = 1e-6

# ── Configs to evaluate ────────────────────────────────────────────
# ATTN_DIM: physically pruned Q/K output channels
# nominal_sparsity: for paper labeling
# actual_sparsity: computed as (D_MODEL - ATTN_DIM) / D_MODEL
CONFIGS = [
    {"config": "Q16-QKSv2-D16", "attn_dim": 16, "nominal_sparsity":  0, "actual_sparsity":  0.00},
    {"config": "Q16-QKSv2-D14", "attn_dim": 14, "nominal_sparsity": 10, "actual_sparsity": 12.50},
    {"config": "Q16-QKSv2-D13", "attn_dim": 13, "nominal_sparsity": 20, "actual_sparsity": 18.75},
    {"config": "Q16-QKSv2-D11", "attn_dim": 11, "nominal_sparsity": 30, "actual_sparsity": 31.25},
    {"config": "Q16-QKSv2-D10", "attn_dim": 10, "nominal_sparsity": 37, "actual_sparsity": 37.50},
    {"config": "Q16-QKSv2-D8",  "attn_dim":  8, "nominal_sparsity": 50, "actual_sparsity": 50.00},
]

# ── Load model checkpoint ──────────────────────────────────────────
print("Loading checkpoint...")
ckpt = torch.load(CKPT_PATH, map_location="cpu", weights_only=False)
state = ckpt["model_state_dict"]

# Extract all weights as numpy for faster inference
W_inp_w = state["backbone.input_projection.weight"].numpy()      # [16, 64]
W_inp_b = state["backbone.input_projection.bias"].numpy()        # [16]
pos_emb  = state["backbone.position_embedding"].numpy()[0]       # [16, 16]  (remove batch dim)
Wq_full  = state["backbone.layers.0.attention.query.weight"].numpy()  # [16, 16]
Wk_full  = state["backbone.layers.0.attention.key.weight"].numpy()    # [16, 16]
Wv_full  = state["backbone.layers.0.attention.value.weight"].numpy()   # [16, 16]
Wo_full  = state["backbone.layers.0.attention.output.weight"].numpy()   # [16, 16]
Wo_bias  = state["backbone.layers.0.attention.output.bias"].numpy()    # [16]
W0_w     = state["backbone.layers.0.feedforward.0.weight"].numpy()     # [32, 16]
W0_b     = state["backbone.layers.0.feedforward.0.bias"].numpy()       # [32]
W3_w     = state["backbone.layers.0.feedforward.3.weight"].numpy()     # [16, 32]
W3_b     = state["backbone.layers.0.feedforward.3.bias"].numpy()       # [16]
ln1_w    = state["backbone.layers.0.norm1.weight"].numpy()             # [16]
ln1_b    = state["backbone.layers.0.norm1.bias"].numpy()               # [16]
ln2_w    = state["backbone.layers.0.norm2.weight"].numpy()             # [16]
ln2_b    = state["backbone.layers.0.norm2.bias"].numpy()               # [16]
out_n_w  = state["backbone.output_norm.weight"].numpy()                # [16]
out_n_b  = state["backbone.output_norm.bias"].numpy()                  # [16]
cls_w    = state["backbone.classifier.weight"].numpy()                 # [2, 16]
cls_b    = state["backbone.classifier.bias"].numpy()                   # [2]
print("Weights loaded.")

# ── Compute Channel Importance ─────────────────────────────────────
# Importance = L1 norm of Wq[row] + L1 norm of Wk[row]
channel_l1 = np.zeros(D_MODEL)
for ch in range(D_MODEL):
    channel_l1[ch] = np.sum(np.abs(Wq_full[ch])) + np.sum(np.abs(Wk_full[ch]))

# Rank channels by importance (descending)
ranked_channels = np.argsort(-channel_l1)  # most important first
print(f"\nQ/K Channel Ranking (L1 norm, descending):")
for rank, ch in enumerate(ranked_channels):
    print(f"  Rank {rank:2d}: ch {ch:2d}  L1={channel_l1[ch]:.4f}")

# ── Helper: LayerNorm in numpy ─────────────────────────────────────
def layer_norm(x, gamma, beta):
    mean = x.mean(axis=-1, keepdims=True)
    var  = ((x - mean) ** 2).mean(axis=-1, keepdims=True)
    return (x - mean) / np.sqrt(var + EPS) * gamma + beta

# ── Helper: feature_map (elu + 1) ──────────────────────────────────
def feature_map(x):
    return np.where(x >= 0, x + 1.0, np.exp(x))

# ── Helper: Full dense forward pass ────────────────────────────────
def dense_forward(inputs):
    """Run full dense Q16 model forward pass on batched [B, 16, 64] inputs."""
    B = inputs.shape[0]
    # Input projection
    x = inputs @ W_inp_w.T + W_inp_b  # [B, 16, 64] @ [64, 16] + [16] = [B, 16, 16]
    x = x + pos_emb  # [B, 16, 16]

    # Linear attention — dense forward (x @ W.T for nn.Linear)
    q  = x @ Wq_full.T  # [B, 16, 16] @ [16, 16] = [B, 16, 16]
    k  = x @ Wk_full.T  # [B, 16, 16] @ [16, 16] = [B, 16, 16]
    v  = x @ Wv_full.T  # [B, 16, 16] @ [16, 16] = [B, 16, 16]

    q_feat = feature_map(q)  # [B, 16, 16]
    k_feat = feature_map(k)  # [B, 16, 16]

    # KV = K^T @ V → [B, 16, 16] .T @ [B, 16, 16] → [B, 16, 16]
    kv = k_feat.transpose(0, 2, 1) @ v  # [B, 16, 16] @ [B, 16, 16] = [B, 16, 16]

    k_sum = k_feat.sum(axis=1)  # [B, 16]

    # normalizer = Q @ K_sum^T → [B, 16]
    normalizer = (q_feat * k_sum[:, np.newaxis, :]).sum(axis=2) + EPS  # [B, 16]

    # attended = Q @ KV → [B, 16, 16] @ [B, 16, 16] = [B, 16, 16]
    attended = q_feat @ kv  # [B, 16, 16] @ [B, 16, 16] = [B, 16, 16]
    attended = attended / normalizer[:, :, np.newaxis]  # [B, 16, 16]

    # Output projection
    attn_out = attended @ Wo_full.T + Wo_bias  # [B, 16, 16] @ [16, 16] + [16] = [B, 16, 16]
    x = x + attn_out  # residual

    # LayerNorm 1
    x = layer_norm(x, ln1_w, ln1_b)

    # FFN
    hidden = x @ W0_w.T + W0_b  # [B, 16, 16] @ [16, 32] + [32] = [B, 16, 32]
    hidden = np.maximum(hidden, 0)  # ReLU
    ffn_out = hidden @ W3_w.T + W3_b  # [B, 16, 32] @ [32, 16] + [16] = [B, 16, 16]
    x = x + ffn_out

    # LayerNorm 2
    x = layer_norm(x, ln2_w, ln2_b)

    # Mean pool
    pooled = x.mean(axis=1)  # [B, 16]
    pooled = layer_norm(pooled, out_n_w, out_n_b)

    # Classifier
    logits = pooled @ cls_w.T + cls_b  # [B, 2]
    return logits

# ── Helper: Pruned forward pass ────────────────────────────────────
def pruned_forward(inputs, active_channels, attn_dim):
    """
    Physically pruned forward pass.

    active_channels: list of ATTN_DIM channel indices to keep (sorted ascending)
    attn_dim: ATTN_DIM (must match len(active_channels))

    Key difference from v1:
      - Wq_pruned[ATTN_DIM, 16] — physically smaller, NOT Wq[active_channels, :]
      - Q[16, ATTN_DIM] — physically smaller, NOT Q[16, 16] with zeros
      - KV[ATTN_DIM, 16] — physically smaller
      - K_sum[ATTN_DIM] — physically smaller
    """
    B = inputs.shape[0]
    ac = np.array(active_channels, dtype=np.int32)

    # Create physically pruned Wq, Wk
    Wq_pruned = Wq_full[ac, :]  # [ATTN_DIM, 16]
    Wk_pruned = Wk_full[ac, :]  # [ATTN_DIM, 16]

    # Input projection (unchanged — FULL)
    x = inputs @ W_inp_w.T + W_inp_b  # [B, 16, 16]
    x = x + pos_emb

    # Q = x @ Wq_pruned.T → [B, 16, 16] @ [16, ATTN_DIM] = [B, 16, ATTN_DIM]
    q = x @ Wq_pruned.T  # [B, 16, ATTN_DIM]
    k = x @ Wk_pruned.T  # [B, 16, ATTN_DIM]
    # V is FULL 16-channel
    v = x @ Wv_full.T     # [B, 16, 16]

    q_feat = feature_map(q)  # [B, 16, ATTN_DIM]
    k_feat = feature_map(k)  # [B, 16, ATTN_DIM]

    # KV = K^T @ V → [B, ATTN_DIM, 16] @ [B, 16, 16] = [B, ATTN_DIM, 16]
    kv = k_feat.transpose(0, 2, 1) @ v  # [B, ATTN_DIM, 16] @ [B, 16, 16] = [B, ATTN_DIM, 16]

    k_sum = k_feat.sum(axis=1)  # [B, ATTN_DIM]

    # normalizer = sum_d Q[pos][d] * K_sum[d] → [B, 16]
    normalizer = (q_feat * k_sum[:, np.newaxis, :]).sum(axis=2) + EPS  # [B, 16]

    # attended = Q @ KV → [B, 16, ATTN_DIM] @ [B, ATTN_DIM, 16] = [B, 16, 16]
    attended = q_feat @ kv  # [B, 16, ATTN_DIM] @ [B, ATTN_DIM, 16] = [B, 16, 16]
    attended = attended / normalizer[:, :, np.newaxis]

    # Output projection (FULL 16-channel)
    attn_out = attended @ Wo_full.T + Wo_bias  # [B, 16, 16] @ [16, 16] + [16] = [B, 16, 16]
    x = x + attn_out

    # LayerNorm 1
    x = layer_norm(x, ln1_w, ln1_b)

    # FFN (FULL)
    hidden = x @ W0_w.T + W0_b  # [B, 16, 32]
    hidden = np.maximum(hidden, 0)
    ffn_out = hidden @ W3_w.T + W3_b  # [B, 16, 16]
    x = x + ffn_out

    # LayerNorm 2
    x = layer_norm(x, ln2_w, ln2_b)

    # Mean pool
    pooled = x.mean(axis=1)
    pooled = layer_norm(pooled, out_n_w, out_n_b)

    # Classifier
    logits = pooled @ cls_w.T + cls_b
    return logits

# ── MAC Estimation ─────────────────────────────────────────────────
def estimate_macs(attn_dim):
    """Estimate total MACs for a physically pruned config."""
    # Input projection: 16 × 16 × 64 = 16384
    mac_input = SEQ_LEN * D_MODEL * INPUT_DIM  # full

    # Q projection: SEQ_LEN × ATTN_DIM × D_MODEL
    mac_q = SEQ_LEN * attn_dim * D_MODEL
    # K projection: SEQ_LEN × ATTN_DIM × D_MODEL
    mac_k = SEQ_LEN * attn_dim * D_MODEL
    # V projection: SEQ_LEN × D_MODEL × D_MODEL  (FULL)
    mac_v = SEQ_LEN * D_MODEL * D_MODEL

    # KV: ATTN_DIM × D_MODEL × SEQ_LEN
    mac_kv = attn_dim * D_MODEL * SEQ_LEN
    # K_sum: ATTN_DIM × SEQ_LEN (just sum, no multiply)

    # Normalizer: SEQ_LEN × ATTN_DIM
    mac_norm = SEQ_LEN * attn_dim
    # Attended: SEQ_LEN × ATTN_DIM × D_MODEL
    mac_attn = SEQ_LEN * attn_dim * D_MODEL

    # Output proj: SEQ_LEN × D_MODEL × D_MODEL (FULL)
    mac_out = SEQ_LEN * D_MODEL * D_MODEL

    # FFN hidden: SEQ_LEN × FF_DIM × D_MODEL (FULL)
    mac_ffn1 = SEQ_LEN * FF_DIM * D_MODEL
    # FFN output: SEQ_LEN × D_MODEL × FF_DIM (FULL)
    mac_ffn2 = SEQ_LEN * D_MODEL * FF_DIM

    # Classifier: N_CLASSES × D_MODEL
    mac_cls = N_CLASSES * D_MODEL

    total = (mac_input + mac_q + mac_k + mac_v + mac_kv +
             mac_norm + mac_attn + mac_out + mac_ffn1 + mac_ffn2 + mac_cls)

    # Attention-only MACs
    mac_attn_total = mac_q + mac_k + mac_v + mac_kv + mac_attn + mac_out

    return int(total), int(mac_attn_total)

# ── Main Sweep ─────────────────────────────────────────────────────
print("\nLoading test data...")
data = np.load(TEST_NPZ)
inputs = data["X"]          # [3444, 16, 64]
labels = data["y"]          # [3444]
ref_logits_dense = data.get("ref_logits", None)  # [3444, 2] from previous dense run
print(f"  inputs: {inputs.shape}, labels: {labels.shape}")

# Run dense baseline first
print("\nRunning dense baseline (ATTN_DIM=16)...")
dense_logits = []
BATCH = 200
for start in range(0, len(inputs), BATCH):
    end = min(start + BATCH, len(inputs))
    dense_logits.append(dense_forward(inputs[start:end]))
dense_logits = np.concatenate(dense_logits, axis=0)
dense_pred = np.argmax(dense_logits, axis=1)
dense_acc = (dense_pred == labels).mean()
print(f"  Dense baseline accuracy: {dense_acc:.6f}")

# Compute dense MACs (reference for reduction %)
dense_total_mac, dense_attn_mac = estimate_macs(D_MODEL)

# Run swept configs
results = []
for cfg in CONFIGS:
    attn_dim = cfg["attn_dim"]
    # Select top 'attn_dim' channels from the ranking
    active_channels = sorted(ranked_channels[:attn_dim].tolist())

    print(f"\n{'='*60}")
    print(f"Config: {cfg['config']}  ATTN_DIM={attn_dim}")
    print(f"  Active channels: {active_channels}")
    print(f"  Pruned channels: {sorted(set(range(D_MODEL)) - set(active_channels))}")

    # Run pruned forward
    pruned_logits = []
    for start in range(0, len(inputs), BATCH):
        end = min(start + BATCH, len(inputs))
        pruned_logits.append(pruned_forward(inputs[start:end], active_channels, attn_dim))
    pruned_logits = np.concatenate(pruned_logits, axis=0)

    pruned_pred = np.argmax(pruned_logits, axis=1)
    acc = (pruned_pred == labels).mean()

    # Match vs dense
    match_vs_dense = (pruned_pred == dense_pred).mean()

    # Error vs dense
    abs_err = np.abs(pruned_logits - dense_logits)
    mean_abs_err = abs_err.mean()
    max_abs_err = abs_err.max()

    # Per-class metrics
    from collections import Counter
    tp = np.sum((pruned_pred == 1) & (labels == 1))
    fp = np.sum((pruned_pred == 1) & (labels == 0))
    fn = np.sum((pruned_pred == 0) & (labels == 1))
    tn = np.sum((pruned_pred == 0) & (labels == 0))

    precision = tp / (tp + fp) if (tp + fp) > 0 else 0.0
    recall    = tp / (tp + fn) if (tp + fn) > 0 else 0.0
    f1        = 2 * precision * recall / (precision + recall) if (precision + recall) > 0 else 0.0

    # MAC estimates
    total_mac, attn_mac = estimate_macs(attn_dim)
    mac_reduction_pct = (1.0 - total_mac / dense_total_mac) * 100
    attn_mac_reduction_pct = (1.0 - attn_mac / dense_attn_mac) * 100

    acc_drop_pp = (dense_acc - acc) * 100  # percentage points
    eligible = acc_drop_pp <= 0.3 and attn_dim < D_MODEL  # must show acc stability

    print(f"  Accuracy:        {acc:.6f}  ({acc*100:.4f}%)")
    print(f"  vs Dense:        {acc_drop_pp:+.4f} pp")
    print(f"  Match vs Dense:  {match_vs_dense:.6f}")
    print(f"  Precision:       {precision:.6f}")
    print(f"  Recall:          {recall:.6f}")
    print(f"  F1:              {f1:.6f}")
    print(f"  Max Abs Error:   {max_abs_err:.6f}")
    print(f"  Mean Abs Error:  {mean_abs_err:.8f}")
    print(f"  Total MACs:      {total_mac}  ({mac_reduction_pct:.2f}% reduction)")
    print(f"  Attn MACs:       {attn_mac}  ({attn_mac_reduction_pct:.2f}% reduction)")
    print(f"  Eligible:         {eligible}")

    results.append({
        "config": cfg["config"],
        "attn_dim": attn_dim,
        "nominal_sparsity": cfg["nominal_sparsity"],
        "actual_sparsity": cfg["actual_sparsity"],
        "active_channels": str(active_channels),
        "accuracy": round(acc, 6),
        "precision": round(precision, 6),
        "recall": round(recall, 6),
        "f1": round(f1, 6),
        "match_vs_dense": round(match_vs_dense, 6),
        "mean_abs_error": round(float(mean_abs_err), 8),
        "max_abs_error": round(float(max_abs_err), 6),
        "estimated_attention_mac": attn_mac,
        "estimated_total_mac": total_mac,
        "estimated_mac_reduction_vs_dense_pct": round(mac_reduction_pct, 2),
        "acc_drop_vs_dense_pp": round(float(acc_drop_pp), 4),
        "eligible_for_hardware": eligible and attn_dim < D_MODEL,
    })

    # Save pruned weights for eligible configs
    if eligible or attn_dim == D_MODEL:
        wdir = WEIGHTS_DIR / f"qks_v2_d{attn_dim}"
        wdir.mkdir(parents=True, exist_ok=True)

        ac = np.array(sorted(ranked_channels[:attn_dim]), dtype=np.int32)

        # Save pruned Q/K weights
        wq = Wq_full[ac, :]  # [ATTN_DIM, D_MODEL]
        wk = Wk_full[ac, :]

        np.save(wdir / "Wq_pruned.npy", wq)
        np.save(wdir / "Wk_pruned.npy", wk)

        # Save channel info
        with open(wdir / "selected_qk_channels.txt", "w") as f:
            f.write(f"ATTN_DIM={attn_dim}\n")
            f.write(f"Active Q/K channels (sorted): {sorted(ac.tolist())}\n")
            f.write(f"Pruned Q/K channels: {sorted(set(range(D_MODEL)) - set(ac.tolist()))}\n")

        # Save ranking CSV
        with open(wdir / "qk_channel_ranking.csv", "w", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(["rank", "channel", "L1_norm", "kept"])
            for rank, ch in enumerate(ranked_channels):
                writer.writerow([rank, ch, channel_l1[ch], ch in ac])

        # Save metadata
        meta = {
            "attn_dim": attn_dim,
            "d_model": D_MODEL,
            "nominal_sparsity": cfg["nominal_sparsity"],
            "actual_sparsity": cfg["actual_sparsity"],
            "active_channels": sorted(ac.tolist()),
            "pruned_channels": sorted(set(range(D_MODEL)) - set(ac.tolist())),
            "channel_importance_method": "L1_norm_Wq_plus_Wk",
            "accuracy_vs_dense": round(float(acc), 6),
            "accuracy_drop_pp": round(float(acc_drop_pp), 4),
        }
        with open(wdir / "pruning_metadata.json", "w") as f:
            json.dump(meta, f, indent=2)

        print(f"  Weights saved to: {wdir}")

# ── Save Sweep CSV ─────────────────────────────────────────────────
csv_path = OUT_DIR / "qks_v2_software_sweep.csv"
with open(csv_path, "w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=results[0].keys())
    writer.writeheader()
    writer.writerows(results)
print(f"\n✅ Sweep CSV saved to: {csv_path}")

# ── Summary ────────────────────────────────────────────────────────
print(f"\n{'='*70}")
print("QKS-v2 Software Sweep Summary")
print(f"{'='*70}")
print(f"{'Config':<20s} {'ATTN_DIM':>9s} {'Acc':>8s} {'AccDrop':>8s} {'F1':>8s} {'MAC_Red%':>9s} {'Eligible':>9s}")
print(f"{'-'*20} {'-'*9} {'-'*8} {'-'*8} {'-'*8} {'-'*9} {'-'*9}")
for r in results:
    print(f"{r['config']:<20s} {r['attn_dim']:>9d} {r['accuracy']*100:>7.4f}% {r['acc_drop_vs_dense_pp']:>+7.4f}pp {r['f1']*100:>7.4f}% {r['estimated_mac_reduction_vs_dense_pct']:>8.2f}% {'YES' if r['eligible_for_hardware'] else 'NO':>9s}")

print(f"\nDense baseline accuracy: {dense_acc*100:.4f}%")
print(f"Eligibility criterion: accuracy drop ≤ 0.3 pp vs dense")
print(f"\nAll results and weights saved under: {OUT_DIR}")
