#!/usr/bin/env python3
"""Generate sparse reference logits for Experiment 1 configs.
For each sparsity level, runs PyTorch model with Q/K attention channel mask
matching the ACTIVE_DIM/ACTIVE_CHANNELS used in HLS.
"""
import sys, os, numpy as np
sys.path.insert(0, '/home/cym/prj2/finn/notebooks/icl_thesis-master/src')

import torch
import torch.nn.functional as F

PROJ = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse'
CKPT = f'{PROJ}/checkpoints/best_linear_imgds_dense_r32_p8.pt'
TEST_NPZ = f'{PROJ}/q16_full_pynq_validation/q16_main_test_3444.npz'
EVAL_NPZ = f'{PROJ}/q16_full_pynq_validation/q16_main_eval200.npz'
SANITY_NPZ = f'{PROJ}/q16_full_pynq_validation/q16_main_sanity.npz'
DST = f'{PROJ}/final_paper_experiments/experiment1_sparse_board/pynq_packages'

# Active channels per sparsity level (from existing SW experiments)
SPARSE_CONFIGS = {
    "q16_s10": {"active_channels": [0, 1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15]},
    "q16_s20": {"active_channels": [0, 1, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15]},
    "q16_s30": {"active_channels": [0, 1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15]},  # Wait, this should be the S30 channels
    "q8_s30":  {"active_channels": [3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15]},
}

# Fix: Q16 S30 uses channels [3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15]
SPARSE_CONFIGS["q16_s30"]["active_channels"] = [3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 15]

D_MODEL = 16

def sparse_forward(model, x, active_set):
    """Run model with Q/K attention channels masked to active_set only."""
    with torch.no_grad():
        # Embedding
        emb = model.backbone.input_projection(x)
        emb = emb + model.backbone.pos_embedding.unsqueeze(0) if model.backbone.pos_embedding.dim() == 2 else emb + model.backbone.pos_embedding

        # Create mask: 1 for active channels, 0 for pruned channels
        mask = torch.zeros(D_MODEL, device=x.device)
        for ch in active_set:
            mask[ch] = 1.0

        # Attention with sparse Q/K
        q = model.backbone.layers[0].attention.query(emb)   # [B, S, D]
        k = model.backbone.layers[0].attention.key(emb)
        v = model.backbone.layers[0].attention.value(emb)

        # Apply sparse mask to Q and K
        q = q * mask.unsqueeze(0).unsqueeze(0)
        k = k * mask.unsqueeze(0).unsqueeze(0)

        # Feature map: elu + 1
        q = F.elu(q) + 1
        k = F.elu(k) + 1

        # Linear attention: K^T V kernel trick
        # KV = sum_s K[s]^T V[s]  -> [B, D, D]
        kv = torch.einsum('bsd,bse->bde', k, v)
        # K_sum = sum_s K[s]  -> [B, D]
        k_sum = k.sum(dim=1)

        # Normalizer = Q @ K_sum^T + eps
        normalizer = torch.einsum('bsd,bd->bs', q, k_sum) + 1e-6

        # Attended = Q @ KV / normalizer
        attended = torch.einsum('bsd,bde->bse', q, kv)
        attended = attended / normalizer.unsqueeze(-1)

        # Output projection + residual
        attn_out = model.backbone.layers[0].attention.output_proj(attended)
        emb = emb + attn_out

        # LayerNorm 1
        emb = model.backbone.layers[0].norm1(emb)

        # FFN + residual
        ffn_out = model.backbone.layers[0].feedforward(emb)
        emb = emb + ffn_out

        # LayerNorm 2
        emb = model.backbone.layers[0].norm2(emb)

        # Mean pool
        pooled = emb.mean(dim=1)

        # Output norm + classifier
        pooled = model.backbone.output_norm(pooled)
        logits = model.backbone.classifier(pooled)

        return logits


def main():
    from transformer import LinearTransformerIMGDS

    device = torch.device('cpu')
    cfg = {"input_dim": 64, "seq_len": 16, "d_model": 16,
           "dim_feedforward": 32, "num_layers": 1, "num_classes": 2, "dropout": 0.1}

    print("Loading checkpoint...")
    state = torch.load(CKPT, map_location=device)
    model = LinearTransformerIMGDS(**cfg).to(device)
    model.load_state_dict(state["model_state_dict"])
    model.eval()

    print("Loading test data...")
    test = np.load(TEST_NPZ)
    X_test, y_test = test['X'], test['y']
    eval_data = np.load(EVAL_NPZ)
    X_eval, y_eval = eval_data['X'], eval_data['y']
    sanity = np.load(SANITY_NPZ)
    X_sanity, y_sanity = sanity['X'], sanity['y']

    for code, spec in SPARSE_CONFIGS.items():
        active = spec["active_channels"]
        active_dim = len(active)
        print(f"\n{'='*60}")
        print(f"Generating reference logits for {code} (ACTIVE_DIM={active_dim}, channels={active})")

        dst_dir = f"{DST}/{code}_attn_sparse"
        os.makedirs(dst_dir, exist_ok=True)

        active_set = set(active)

        for name, X, y, fname in [
            ("full 3444", X_test, y_test, f"{code}_attn_sparse_test_3444.npz"),
            ("eval 200", X_eval, y_eval, f"{code}_attn_sparse_eval200.npz"),
            ("sanity 1", X_sanity, y_sanity, f"{code}_attn_sparse_sanity.npz"),
        ]:
            all_logits = []
            bs = 128
            for start in range(0, len(X), bs):
                end = min(start + bs, len(X))
                batch = torch.from_numpy(X[start:end]).float().to(device)
                logits = sparse_forward(model, batch, active_set)
                all_logits.append(logits.cpu().numpy())

            ref_logits = np.concatenate(all_logits, axis=0)
            ref_pred = np.argmax(ref_logits, axis=1)
            ref_acc = (ref_pred == y).mean()
            print(f"  {name}: ref_acc={ref_acc:.6f}")

            np.savez(f"{dst_dir}/{fname}", X=X, y=y, ref_logits=ref_logits)

        # Also copy bit+hwh if they exist from S0
        # For Q16 sparse: reuse Q16 S0 bit? NO - they need their own sparse bitstreams
        # For now mark as NEEDS_VIVADO
        print(f"  -> Reference logits saved. Needs Vivado bitstream.")

    # For Q16 S0: already has NPZ from Q16 Main (dense = no sparsity, same ref logits)
    # copy the existing ones
    import shutil
    s0_dst = f"{DST}/q16_s0_attn_sparse"
    for src_name, dst_name in [
        ("q16_main_test_3444.npz", "q16_s0_attn_sparse_test_3444.npz"),
        ("q16_main_eval200.npz", "q16_s0_attn_sparse_eval200.npz"),
        ("q16_main_sanity.npz", "q16_s0_attn_sparse_sanity.npz"),
    ]:
        src = f"{PROJ}/q16_full_pynq_validation/{src_name}"
        dst = f"{s0_dst}/{dst_name}"
        if os.path.exists(src) and not os.path.exists(dst):
            shutil.copy2(src, dst)
    print(f"\nQ16 S0: NPZ files ready (reuse from Q16 Main)")

    print("\nDone. Reference logits generated for all sparse configs.")


if __name__ == "__main__":
    main()
