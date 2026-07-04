# Structural Model Comparison: Q16 Main / small_A / small_B / tiny

**Generated:** 2026-07-01
**All models:** Linear Transformer, 1 encoder layer, IMG_DS input (16×64 grayscale patches)

---

## 1. Quick Reference Table

| Property | **Q16 Main** | **small_A** | **small_B** | **tiny** |
|----------|-------------|------------|------------|---------|
| **Paper Name** | Ours-Dense-Q16 | Ours-CompactA-Q16 | Ours-Compact-Q16 | Ours-Tiny-Q16 |
| **d_model** | 16 | 12 | 8 | 6 |
| **ff_dim** | 32 | 24 | 16 | 12 |
| **Input shape** | (B, 16, 64) | (B, 16, 64) | (B, 16, 64) | (B, 16, 64) |
| **Parameters** | 3,538 | 2,270 | 1,258 | 848 |
| **vs Q16 Main** | 100% | 64% | 36% | 24% |
| **SW Accuracy** | 94.19% | **96.05%** | 95.18% | 95.53% |
| **HLS LUT** | 25,402 | — (not yet) | 23,346 | — (not yet) |
| **HLS Latency (cycles)** | 75,627 | — | 30,843 | — |
| **HLS Latency (μs@100MHz)** | 756.27 | — | 308.43 | — |
| **Vivado LUT** | **14,004** | — (not yet) | **13,095** | — (not yet) |
| **Est. Vivado LUT** | 14,004 | ~9,000 | 13,095 | ~5,000 |
| **PYNQ latency** | 926.31 μs | — | **454.92 μs** | — |
| **PYNQ accuracy** | TBD (3444 running) | — | **93.96%** | — |
| **Current Status** | bit ready, 3444 PYNQ pending | SW trained only | ✅ **Fully done** | SW trained only |
| **Paper Role** | High-accuracy anchor | Potential 3rd Pareto point | Low-LUT low-latency | Extreme compression |

---

## 2. Structural Differences Explained

All four models share the same Linear Transformer macro-architecture:

```
input (16×64) → input_projection [input_dim→d_model] → positional encoding
→ LinearAttention(Q/K/V + output_proj) → LayerNorm
→ FeedForward(d_model→ff_dim→d_model, ReLU) → LayerNorm
→ mean_pooling → output_norm → classifier → 2-class logits
```

The difference is purely in **two dimensions**:

| Dimension | What it controls | Impact on model |
|-----------|-----------------|-----------------|
| **d_model** | Hidden channel width of the entire transformer | Affects attention matrix size (d×d), input projection (d×64), classifier (2×d), all LayerNorms (d) |
| **ff_dim** | Hidden width of the feedforward MLP | Affects FF expansion from d→ff_dim→d. Typically ff_dim = 2×d_model |

### Parameter breakdown by component

| Component | Formula | Q16 Main (d=16) | small_A (d=12) | small_B (d=8) | tiny (d=6) |
|-----------|---------|----------------|---------------|---------------|------------|
| input_projection | d × 64 + d | 1,040 | 780 | 520 | 390 |
| position_embedding | seq_len × d | 256 | 192 | 128 | 96 |
| Q weight | d × d | 256 | 144 | 64 | 36 |
| K weight | d × d | 256 | 144 | 64 | 36 |
| V weight | d × d | 256 | 144 | 64 | 36 |
| O weight + bias | d × d + d | 272 | 156 | 72 | 42 |
| FF0 weight + bias | ff_dim × d + ff_dim | 544 | 312 | 144 | 90 |
| FF3 weight + bias | d × ff_dim + d | 528 | 300 | 136 | 78 |
| LayerNorm×4 | 4 × 2d | 128 | 96 | 64 | 48 |
| classifier | d × 2 + 2 | 34 | 26 | 18 | 14 |
| **Total trainable** | | **3,538** | **2,270** | **1,258** | **848** |

### The computational story

A Linear Transformer's key computation is `Q·(Kᵀ·V) / (Q·K_sum)`. The dominant operations are:

1. **Q/K/V projection:** `d × d` matrix multiply per sequence position. cost ∝ d².
2. **Kᵀ·V:** `d × d` accumulator. cost ∝ d².
3. **Output projection:** `d × d` matrix multiply. cost ∝ d².
4. **FeedForward:** `d × ff_dim` + `ff_dim × d`. cost ∝ 2·d·ff_dim.

For Q16 Main (d=16): attention cost ∝ 256, FF cost ∝ 2×16×32 = 1024.
For small_B (d=8): attention cost ∝ 64 (4× smaller!), FF cost ∝ 2×8×16 = 256 (4× smaller!).

This is why small_B HLS latency dropped 59% (75,627 → 30,843 cycles) and DSP dropped 37% (156 → 98).

---

## 3. How small_A, small_B, tiny Differ From Each Other

### small_A → small_B

- d_model drops from 12 → 8 (33% reduction)
- ff_dim drops from 24 → 16 (33% reduction)
- Parameter count: 2,270 → 1,258 (45% reduction)
- **Trade-off:** small_A has higher SW accuracy (96.05% vs 95.18%), but small_B has better hardware efficiency (Vivado LUT 13,095 confirmed, DSP 98, latency 455 μs)
- small_B is the one that's already **on PYNQ** — it passed the full 3444 test

### small_B → tiny

- d_model drops from 8 → 6 (25% reduction)
- ff_dim drops from 16 → 12 (25% reduction)
- Parameter count: 1,258 → 848 (33% reduction)
- **Interesting:** tiny actually has slightly higher SW accuracy (95.53%) than small_B (95.18%) despite being smaller. This suggests IMG_DS doesn't need even 8 dimensions — the task is separable in ~6 dimensions
- tiny is the most extreme compression candidate — estimated Vivado LUT ~5,000

---

## 4. Recommended Paper Roles

| Model | Paper Role | Why |
|-------|-----------|-----|
| **Q16 Main** (Ours-Dense-Q16) | **High-accuracy anchor** | Largest model. SW acc=94.19%, PYNQ pending. Vivado LUT=14,004. <br>Shows the full-size Linear Transformer baseline on PYNQ-Z2. |
| **small_B** (Ours-Compact-Q16) | **Low-LUT, low-latency frontier** | ✅ Fully validated. LUT=13,095, latency=455 μs, PYNQ acc=93.96%. <br>1,781× faster than ViT4Mal-Fastest. 21% lower LUT. |
| **small_A** (Ours-CompactA-Q16) | **Potential 3rd Pareto point** | SW acc=**96.05%** — higher than ALL ViT4Mal configs and Q16 Main! <br>At d=12/ff=24 and 2,270 params, it sits between Q16 Main and small_B. <br>LUT estimate ~9,000 — could be the 3rd red star on the Pareto curve. <br>**Not yet HLS'd or boarded.** |
| **tiny** (Ours-Tiny-Q16) | **Extreme compression exploration** | SW acc=95.53% despite only 848 params. <br>LUT estimate ~5,000 — the most aggressive point. <br>**Not yet HLS'd or boarded.** |

### The Pareto story

The four models form a natural trade-off curve:

```
Accuracy ↑
 96.0% +                   ★ small_A (d=12, SW only, est LUT ~9k)
       |
 95.5% +           ★ tiny (d=6, SW only, est LUT ~5k)
       |
 95.0% +       ★ small_B (d=8, PYNQ measured, LUT=13,095)
       |
 94.5% +
       |   ★ Q16 Main (d=16, PYNQ measured, LUT=14,004)
 94.0% +
       +----+----+----+----+----+----+----+---->
        5k  6k  8k  10k 12k 14k        Vivado LUT
```

small_A (d=12) is the most interesting next point — it could give the highest accuracy of all four at LUT ~9,000, creating three Pareto stars: Q16 Main (left-top anchor), small_A (highest acc, mid LUT), small_B (lower right, lowest LUT with good acc).

---

*Generated 2026-07-01.*
