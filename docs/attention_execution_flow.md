# Linear Transformer — Complete Attention Execution Flow

> **Generated:** 2026-07-03  
> **Sources:** `src/transformer.py`, `vitis_hls/linear_transformer/`, `vitis_hls/unsw_linear_transformer_fixed16_v3b_hotspot_ii1/`  
> **No code modified.** Analysis only.

---

## 1. Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                     INPUT: x [B, S, Fin]                            │
│                  (Batch=1, SeqLen=8, InputDim=24)                   │
└─────────────┬───────────────────────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  ⑴  front_linear:  x · W_front [Fin × D]  →  front [S, D]          │
│      MACs = S × D × Fin                                            │
└─────────────┬───────────────────────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  ⑵  Q/K/V Projection (3 independent matmuls)                      │
│      Q = front · W_Q [D × D]    →  Q [S, D]                        │
│      K = front · W_K [D × D]    →  K [S, D]                        │
│      V = front · W_V [D × D]    →  V [S, D]                        │
│      MACs = 3 × S × D²                                             │
└─────────────┬───────────────────────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  ⑶  Feature Map  φ(x) = ELU(x) + 1                                │
│      φ(Q)[s,f] = Q[s,f] < 0 ? exp(Q[s,f]) : Q[s,f] + 1            │
│      φ(K)[s,f] = K[s,f] < 0 ? exp(K[s,f]) : K[s,f] + 1            │
│      V is NOT feature-mapped — passed through as-is                 │
└─────────┬───────────┬───────────────────────────────────────────────┘
          │           │
          ▼           ▼
┌─────────────────┐   ┌──────────────────────────────────────────────┐
│ ⑷a Key Sum      │   │ ⑷b KV Outer Product (CORE LINEAR ATTN)       │
│                  │   │                                              │
│ K_sum[f] =       │   │ KV[f₁, f₂] = Σₛ φ(K)[s, f₁] · V[s, f₂]     │
│   Σₛ φ(K)[s, f]  │   │   [D × D] matrix                            │
│                  │   │ MACs = S × D × D                             │
│ Ops = S × D adds │   │ ← THE MAC-DOMINANT LOOP                      │
└────────┬─────────┘   └─────────────────┬────────────────────────────┘
         │                               │
         │                               ▼
         │              ┌────────────────────────────────────────────┐
         │              │ ⑸ Attention Computation (per token)        │
         │              │                                            │
         │              │ ∀ s ∈ [0,S):                               │
         │              │   Z[s] = Σ_f φ(Q)[s,f] · K_sum[f]  (denom) │
         │              │   ∀ f₂ ∈ [0,D):                            │
         │              │     N[s,f₂] = Σ_f₁ φ(Q)[s,f₁] · KV[f₁,f₂] │
         │              │     Attn[s,f₂] = N[s,f₂] / Z[s]            │
         │              │                                            │
         │              │ MACs = S × D + S × D × D                   │
         └──────────────┘                                            │
                     │                                                │
                     ▼                                                │
┌─────────────────────────────────────────────────────────────────────┐
│  ⑹  Output Projection                                              │
│      AttnOut = Attn · W_O [D × D]  →  [S, D]                       │
│      Residual₁ = front + AttnOut                                   │
│      MACs = S × D²                                                  │
└─────────────┬───────────────────────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  ⑺  LayerNorm 1 → FFN₁ (D→FF) → ReLU → FFN₂ (FF→D) → Residual₂   │
│      → LayerNorm 2                                                  │
└─────────────┬───────────────────────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  ⑻  Output: Mean Pooling → LayerNorm → Classifier [D×2]           │
│      (or: final_linear [D×1] for single-output variant)            │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 2. Q / K / V Generation

### 2.1 Python (PyTorch) — `src/transformer.py`

| Variant | Q Generation | K Generation | V Generation | File:Line |
|---------|-------------|-------------|-------------|-----------|
| Standard MHA | `self.query_mat(x)` | `self.key_mat(x)` | `self.value_mat(x)` | `transformer.py:110-112` |
| LinearAttention | `self.query_mat(x)` | `self.key_mat(x)` | `self.value_mat(x)` | `transformer.py:409-411` |
| _UNSWLinearAttention | `self.query(x)` | `self.key(x)` | `self.value(x)` | `transformer.py:598-600` |

All three use **independent** `nn.Linear(input_dim, embed_dim, bias=False)` projections.

**Weight shapes:** `[D_out, D_in]` (PyTorch default).

### 2.2 HLS (C++) — Float Variant `linear_transformer/linear_transformer.cpp`

```cpp
// Combined Q/K/V loop — lines 66-86
qkv_i: for (int i = 0; i < SEQ_LEN; i++) {      // sequence
qkv_j: for (int j = 0; j < BLOCK_INPUT_DIM; j++) { // output feature
    dout_t q_sum = 0.0f, k_sum = 0.0f, v_sum = 0.0f;
  qkv_k: for (int k = 0; k < BLOCK_INPUT_DIM; k++) { // input feature
      const dout_t a = front[i * BLOCK_INPUT_DIM + k];
      q_sum += a * QUERY_WEIGHT[k][j];   // Q projection
      k_sum += a * KEY_WEIGHT[k][j];     // K projection
      v_sum += a * VALUE_WEIGHT[k][j];   // V projection
    }
    // Feature map applied INLINE (see §3)
    query[i*D+j] = ELU_PLUS_ONE(q_sum);
    key[i*D+j]   = ELU_PLUS_ONE(k_sum);
    value[i*D+j] = v_sum;  // ← V NOT feature-mapped
}
```

**Key design decision:** Q, K, V share the same input read (`a = front[...]`), reducing DRAM bandwidth. But this **prevents** independent `#pragma HLS PIPELINE` tuning of each projection.

### 2.3 HLS (C++) — Fixed-Point Variant `unsw_linear_transformer_fixed16_v3b_hotspot_ii1`

```cpp
// Split into THREE SEPARATE loops for better pipelining (§2a, §2b, §2c)
// lines 116-132: Query
for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
  for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
    linear_acc_t query_sum = 0;
    for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
#pragma HLS pipeline II=1
      query_sum += embedded[seq][in_f] * QUERY_WEIGHT[out_f][in_f];
    }
    query[seq][out_f] = ELU_PLUS_ONE(query_sum);
  }
}
// lines 135-153: Key  (same structure, KEY_WEIGHT)
// lines 156-168: Value (same structure, VALUE_WEIGHT, NO feature map)
```

**Why split?** Each projection gets its own `II=1` pipeline. Combined loop would create DSP contention — 3 MACs per inner iteration sharing the same memory read port.

---

## 3. φ(Q) / φ(K) — Feature Map Computation

### 3.1 Definition

```
φ(x) = ELU(x) + 1 = { x + 1       if x ≥ 0
                     { exp(x)      if x < 0   (since eˣ - 1 + 1 = eˣ)
```

**Critical property:** φ(x) > 0 always (guarantees positive attention weights, enabling the linearization trick).

### 3.2 Application sites

| Implementation | Where applied | φ(Q) | φ(K) | φ(V) |
|---------------|--------------|------|------|------|
| Python `LinearAttention` | `transformer.py:413-414` | ✅ | ✅ | ❌ |
| Python `_UNSWLinearAttention` | `transformer.py:598-599` | ✅ | ✅ | ❌ |
| HLS float (combined) | `linear_transformer.cpp:80-81` | ✅ (inline) | ✅ (inline) | ❌ |
| HLS fixed (split) | `unsw_linear_transformer.cpp:127-134` | ✅ (inline) | ✅ (inline) | ❌ |

### 3.3 HLS implementation detail

```cpp
// Float version (exact)
q_sum = q_sum < 0.0f ? expf(q_sum) : q_sum + 1.0f;

// Fixed-point version (float for the exp path only)
if (query_sum >= 0) {
    query[s][f] = act_t(data_t(query_sum) + data_t(1.0f));
} else {
    query[s][f] = act_t(expf((float)query_sum));  // float conversion for exp
}
```

**PWL approximation** (CSG-Halt v03 variant):
```cpp
if (value >= 0.0f)     return value + 1.0f;
if (value >= -1.0f)    return 1.0f + 0.63212056f * value;
if (value >= -2.0f)    return 0.6004236f + 0.2325442f * value;
return 0.1353353f;
```

---

## 4. Attention Score Calculation — The Linear Trick

### 4.1 Mathematical Formulation

Standard attention is **O(S²)**:
```
Attention(Q,K,V) = softmax(Q·K^T / √d) · V    →  [S×S] matrix
```

Linear attention is **O(S·D²)**:
```
Attention(Q,K,V) = φ(Q) · (φ(K)^T · V) / (φ(Q) · Σφ(K)^T)
                   └── numerator ──┘   └─ denominator ─┘
```

The key insight: **change the association** from `(Q·K^T)·V` to `Q·(K^T·V)`.
- `K^T·V` is `[D×S] · [S×D] = [D×D]` — INDEPENDENT of sequence length
- Then `Q · [D×D] = [S×D]` — linear in S

### 4.2 Step-by-step in HLS

```
STEP 1: KV accumulation (the CORE operation)
  KV[f₁, f₂] = Σ_{s=0}^{S-1} φ(K)[s, f₁] · V[s, f₂]
  Shape: [D × D]
  Loop: for f₁ in D: for f₂ in D: for s in S
  MACs: D × D × S

STEP 2: Key sum
  K_sum[f] = Σ_{s=0}^{S-1} φ(K)[s, f]
  Shape: [D]
  Loop: for f in D: for s in S
  Adds: D × S

STEP 3: Denominator (normalizer Z)
  Z[s] = Σ_{f=0}^{D-1} φ(Q)[s, f] · K_sum[f]
  Shape: [S]
  MACs: S × D

STEP 4: Numerator (the actual attention output)
  Attn[s, f₂] = Σ_{f₁=0}^{D-1} φ(Q)[s, f₁] · KV[f₁, f₂] / Z[s]
  Loop: for s in S: for f₂ in D: for f₁ in D
  MACs: S × D × D
```

### 4.3 Two HLS implementation variants

#### Variant A: Float — `linear_transformer.cpp` (SEQ_LEN=8, D=8)

```cpp
// KV as [SEQ_LEN × SEQ_LEN] (less efficient, early implementation)
kv[8][8] = K[8][8] · Vᵀ[8][8]
// Normalizer computed via transposed query
// Numerator: Q[8][8] · kv[8][8]
```

**Problem:** `kv` is `[S×S]` instead of `[D×D]`. Since S=D=8 in this config, it's coincidentally the same size, but this **does not scale** to longer sequences.

#### Variant B: Fixed-Point — `unsw_linear_transformer_fixed16_v3b` (S=8, D=16)

```cpp
// CORRECT formulation — KV as [D_MODEL × D_MODEL]
key_value[16][16]    // ← accumulator dimension, NOT sequence dimension
for (int kf = 0; kf < 16; ++kf)
  for (int vf = 0; vf < 16; ++vf)
    for (int s = 0; s < 8; ++s)
      key_value[kf][vf] += φ(K)[s][kf] * V[s][vf];
```

**This is the production implementation.** KV is `[D×D]` = `[16×16]` regardless of sequence length.

---

## 5. KV Accumulation — Loop Structure Deep Dive

### 5.1 UNSW Fixed-Point v3b (HOTSPOT, II=1)

```
┌──────────────────────────────────────────────────────────────────┐
│  ATTENTION ACCUMULATOR  (attn_acc_t = ap_fixed<28,12>)           │
│  key_value[UNSW_D_MODEL][UNSW_D_MODEL]   // [16][16]             │
├──────────────────────────────────────────────────────────────────┤
│                                                                  │
│  for key_feature = 0..15:          ◄── D iterations              │
│    for value_feature = 0..15:      ◄── D iterations              │
│      sum = 0                                                    │
│      for sequence = 0..7:          ◄── S iterations              │
│        #pragma HLS pipeline II=2                                 │
│        sum += key[seq][kf] * value[seq][vf]                     │
│      key_value[kf][vf] = sum                                     │
│                                                                  │
│  Total MACs = D × D × S = 16×16×8 = 2048                        │
│  Loop latency ≈ D×D×(S×II + pipeline_depth)                     │
│               = 256 × (8×2 + ~4) ≈ 5120 cycles                  │
└──────────────────────────────────────────────────────────────────┘
```

### 5.2 Sparse variant (CSG-Halt, 87.5% active channels)

```
┌──────────────────────────────────────────────────────────────────┐
│  SPARSE KV ACCUMULATOR  (ACTIVE_DIM = 14 of 16)                  │
│  key_value[UNSW_ACTIVE_DIM][UNSW_D_MODEL]   // [14][16]          │
├──────────────────────────────────────────────────────────────────┤
│                                                                  │
│  // Step A: Compact K to active channels only                    │
│  for seq = 0..7:                                                │
│    for active = 0..13:                                          │
│      ch = ACTIVE_K_CHANNELS[active]                              │
│      sparse_key[seq][active] = key[seq][ch]                     │
│      sparse_query[seq][active] = Q_ACTIVE_MASK[ch]              │
│        ? query[seq][ch] : 0.0f    ◄── ZEROED when Q inactive     │
│                                                                  │
│  // Step B: KV with sparse dimension                             │
│  for active_f = 0..13:            ◄── 14 not 16                  │
│    for value_f = 0..15:                                         │
│      for seq = 0..7:                                            │
│        sum += sparse_key[seq][af] * V[seq][vf]                  │
│                                                                  │
│  Total MACs = ACTIVE_DIM × D × S = 14×16×8 = 1792               │
│  (12.5% reduction from 2048)                                     │
└──────────────────────────────────────────────────────────────────┘
```

### 5.3 Attention Accumulator Width Justification

```cpp
// hls_types.h — why such wide accumulators?

// linear_acc_t: ap_fixed<24,10>
//   16-bit × 16-bit product → 32-bit
//   Sum over ≤32 terms → needs ~29 bits
//   24 bits with 10 integer → covers ±8192, safe

// attn_acc_t: ap_fixed<28,12>
//   key_value accumulation: sum over S=8 terms of (act·act) products
//   denominator: sum over D=16 terms of (act·fm) products
//   numerator: sum over D=16 terms of (act·attn_acc) products (chained!)
//   28 bits covers the chain accumulation without saturation
```

---

## 6. Output Layer Computation

### 6.1 Complete Encoder Block (Single Layer)

```
                        ┌─── input: embedded [S, D]
                        │
    ┌───────────────────┼───────────────────┐
    │                   │                   │
    ▼                   ▼                   ▼
 [Q Proj]           [K Proj]           [V Proj]
 D×D MACs            D×D MACs           D×D MACs
    │                   │                   │
    ▼                   ▼                   │
 [ELU+1]            [ELU+1]                │
    │                   │                   │
    │    ┌──────────────┘                   │
    │    │                                  │
    │    ▼                                  │
    │  [K_sum: D]                           │
    │    │                                  │
    │    ├────────────────────┐             │
    │    │                    │             │
    │    ▼                    ▼             │
    │  [Denom: S]     [KV: D×D]             │
    │    │               S×D×D MACs          │
    │    │                    │             │
    │    └────────┬───────────┘             │
    │             │                         │
    │             ▼                         │
    │      [Numerator: S×D]                 │
    │        S×D×D MACs                     │
    │             │                         │
    │             ▼                         │
    │      [÷ normalizer]                   │
    │             │                         │
    │             ▼                         │
    └─────► [O_proj: S×D] ◄─────────────────┘
              D×D MACs
                │
                ▼
         [Residual₁: front + O_proj]  ← element-wise, NO MACs
                │
                ▼
         [LayerNorm 1]
           per-token: mean, var, scale, shift
                │
                ▼
         [FFN₁: D→FF_DIM]    S×D×FF MACs
                │
                ▼
         [ReLU]
                │
                ▼
         [FFN₂: FF_DIM→D]    S×FF×D MACs
                │
                ▼
         [Residual₂: + norm1_in]
                │
                ▼
         [LayerNorm 2]
                │
                ▼
         encoder_out [S, D]
```

### 6.2 Final classifier (two variants)

**Variant A — Single output (IMGDS float):**
```cpp
// final_linear: D→1
for (int i = 0; i < SEQ_LEN; i++) {
  sum = 0;
  for (int k = 0; k < D; k++)
    sum += encoder_out[i][k] * FINAL_WEIGHT[k][0];
  final_out[i] = sum + FINAL_BIAS[0];
}
out[0] = final_out[0];  // only first token!
```
MACs = S × D = 8 × 8 = 64

**Variant B — Two-class classifier (UNSW):**
```cpp
// Mean Pooling → [D]
for (int f = 0; f < D; f++) {
  sum = 0;
  for (int s = 0; s < S; s++) sum += norm2[s][f];
  pooled[f] = sum / S;
}
// Output LayerNorm → [D]
// Classifier: D→2
for (int c = 0; c < 2; c++) {
  sum = CLASSIFIER_BIAS[c];
  for (int f = 0; f < D; f++)
    sum += normalized_output[f] * CLASSIFIER_WEIGHT[c][f];
  logits[c] = sum;
}
```
MACs = S×D (pooling) + D×2 (classifier) = 8×16 + 16×2 = 160

---

## 7. Loop Classification — MAC vs Latency

### 7.1 🔴 MAC-Determining Loops

These loops directly control the number of multiply-accumulate operations and thus DSP utilization:

| Loop | Dimensions | MACs (S=8,D=16) | Formula | Code Location |
|------|-----------|-----------------|---------|---------------|
| **Front Linear** | S × D × Fin | 8×16×24 = 3072 | S·D·Fin | `unsw_linear_transformer.cpp:95-105` |
| **Q Projection** | S × D × D | 8×16×16 = 2048 | S·D² | `unsw_linear_transformer.cpp:117-132` |
| **K Projection** | S × D × D | 8×16×16 = 2048 | S·D² | `unsw_linear_transformer.cpp:136-152` |
| **V Projection** | S × D × D | 8×16×16 = 2048 | S·D² | `unsw_linear_transformer.cpp:156-168` |
| **🔴 KV Accumulation** | **D × D × S** | **16×16×8 = 2048** | **D²·S** | `unsw_linear_transformer.cpp:171-182` |
| **🔴 Numerator** | S × D × D | 8×16×16 = 2048 | S·D² | `unsw_linear_transformer.cpp:207-215` |
| **Denominator** | S × D | 8×16 = 128 | S·D | `unsw_linear_transformer.cpp:197-203` |
| **O_proj** | S × D × D | 8×16×16 = 2048 | S·D² | `unsw_linear_transformer.cpp:221-233` |
| **FFN₁** | S × D × FF | 8×16×32 = 4096 | S·D·FF | `unsw_linear_transformer.cpp:244-253` |
| **FFN₂** | S × FF × D | 8×32×16 = 4096 | S·FF·D | `unsw_linear_transformer.cpp:257-268` |

**Total MACs per inference ≈ 23,680** (S=8, D=16, FF=32, Fin=24), single layer.

### 7.2 🟡 FPGA Latency-Determining Loops

These loops are on the **critical path** — they cannot overlap and their dependency chain sets the minimum clock cycles:

```
Latency-critical chain (sequential dependencies):

  Embedded [S,D]
      │
      ▼  Q_proj: S×D×D iterations, II=1 pipeline
      │  → (S×D)×(D/II) + overhead ≈ 8×16×16 + ~4 = ~2052 cycles
      │
      ▼  ELU+1:  S×D = 128 element-wise ops (negligible vs matmul)
      │
      ▼  KV accumulation: D×D×S, II=2
      │  → D×D×(S×II + depth) ≈ 256×(16+4) ≈ 5120 cycles
      │
      ▼  K_sum: D×S = 128 adds, II=1 → ~128 cycles
      │
      ▼  Denominator: S×D, II=2 → ~256 cycles
      │
      ▼  Numerator + Attention: S×D×D, II=2
      │  → S×D×(D×II + depth) ≈ 128×(32+4) ≈ 4608 cycles
      │
      ▼  O_proj + Residual: S×D×D, II=1 → ~2052 cycles
      │
      ▼  LayerNorm 1: S×(3D+D) ≈ 8×64 ≈ 512 cycles (3 passes)
      │
      ▼  FFN₁: S×D×FF, II=1 → 8×16×32 ≈ 4096 cycles
      │
      ▼  ReLU + FFN₂: S×FF×D, II=1 → 8×32×16 ≈ 4096 cycles
      │
      ▼  LayerNorm 2 → Pooling → OutputLN → Classifier: ~300 cycles

  Critical path ≈ 23,000+ cycles (single layer, single sample)
```

**The KV accumulation loop is the PRIMARY latency bottleneck** because:
1. It has `II=2` (not `II=1`) — each iteration takes 2 cycles
2. It has `D×D = 256` outer iterations (largest 2D iteration space)
3. The inner `S=8` loop is fully sequential

### 7.3 🟢 Pipeline II Annotations (v3b_hotspot)

| Loop | II | Reasoning |
|------|----|-----------|
| Input conversion | **II=1** | Simple type cast, no contention |
| Input Embedding | **II=1** | Single MAC per cycle, separate arrays |
| Q proj (split) | **II=1** | Dedicated DSP, no sharing |
| K proj (split) | **II=1** | Dedicated DSP, no sharing |
| V proj (split) | **II=1** | Dedicated DSP, no sharing |
| KV accumulation | **II=2** | Two reads (key + value) from BRAM, 1 write |
| Key sum | **II=1** | Simple accumulation |
| Denominator | **II=2** | Read query + key_sum, MAC, write |
| Numerator | **II=2** | Read query + key_value, MAC, divide, write |
| O_proj + residual | **II=1** | Standard matmul |
| LayerNorm (all) | **II=2** | Multiple passes over same data |
| FFN₁ | **II=1** | Standard matmul |
| FFN₂ | **II=1** | Standard matmul |
| Mean Pooling | **II=1** | Simple accumulation |
| Classifier | **II=1** | Small matmul |

---

## 8. ⚠️ Mask=0 — What Still Executes

### 8.1 Current mask support status

```python
# transformer.py:402-403 (LinearAttention.forward)
def forward(self, x, mask=None):
    if mask is not None:
        raise NotImplementedError("mask is not supported yet")
```

**Mask is explicitly NOT IMPLEMENTED** in the linear attention Python path.

### 8.2 What WOULD still execute if masking were added

In a standard transformer with causal masking, `mask[i,j]=0` for `j>i` means token i cannot attend to token j. In the linear transformer:

```
┌─────────────────────────────────────────────────────────────────┐
│  STANDARD ATTENTION (mask works naturally)                      │
│                                                                 │
│  attn_logits = Q·K^T / √d           ← [S×S] matrix             │
│  attn_logits.masked_fill(mask==0, -∞)  ← zero-out forbidden    │
│  attention = softmax(attn_logits)    ← -∞ → 0 after softmax    │
│  output = attention · V             ← masked tokens contribute 0│
│                                                                 │
│  → Tokens with mask=0 CONTRIBUTE NOTHING.                       │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│  LINEAR ATTENTION (mask DOES NOT work naturally)                │
│                                                                 │
│  KV[f₁,f₂] = Σₛ φ(K)[s,f₁] · V[s,f₂]   ← sum over ALL seq     │
│                                                                 │
│  ⚠ The KV accumulator is a GLOBAL sum over the ENTIRE sequence. │
│  It CANNOT be trivially masked because there is no [S×S]        │
│  attention matrix to zero out.                                  │
│                                                                 │
│  → Tokens with mask=0 STILL CONTRIBUTE to the KV accumulator.   │
│  → Their φ(K) and V values are accumulated into the [D×D] KV.   │
│  → Their φ(K) values are counted in K_sum.                      │
│  → Even if mask=0, ALL the following execute:                   │
│     • Q/K/V projection (all S tokens)                           │
│     • φ(Q), φ(K) feature map (all S tokens)                     │
│     • KV accumulation (all S tokens contribute)                  │
│     • K_sum (all S tokens summed)                                │
│     • Denominator (all S query tokens × K_sum)                   │
│     • Numerator (all S query tokens × KV)                        │
└─────────────────────────────────────────────────────────────────┘
```

**To support masking in a linear transformer, you would need:**
1. **Causal KV accumulation:** `KV[t] = KV[t-1] + φ(K)[t] ⊗ V[t]` — a running sum that only includes tokens ≤ t
2. **Causal K_sum:** `K_sum[t] = K_sum[t-1] + φ(K)[t]` — running sum
3. This turns the O(S) algorithm back into a recurrent form, still O(S·D²) but with sequential dependency

**None of these are implemented. The current code computes over ALL tokens regardless of any hypothetical mask.**

---

## 9. Complete Dataflow Diagram

```
═══════════════════════════════════════════════════════════════════════════
                    LINEAR TRANSFORMER — FULL DATAFLOW
              (UNSW Fixed-Point v3b, S=8, Fin=24, D=16, FF=32)
═══════════════════════════════════════════════════════════════════════════

                              ┌──────────────────┐
                              │  input [8][24]   │  float32 (AXI)
                              │  (8 tokens,      │
                              │   24 features)   │
                              └────────┬─────────┘
                                       │
                              ┌────────▼─────────┐
                              │ float → ap_fixed  │  II=1, 192 ops
                              │ data_t = <16,6>   │
                              └────────┬─────────┘
                                       │
                    ╔══════════════════▼══════════════════════╗
                    ║  ⑴ INPUT EMBEDDING                    ║
                    ║  embedded[8][16] = input · W_inpᵀ     ║
                    ║  W_inp: [16×24]  MACs: 8×16×24=3072  ║
                    ║  + bias + position_embedding           ║
                    ║  II=1, acc=linear_acc_t<24,10>        ║
                    ╚══════════════════╤═════════════════════╝
                                       │
            ╔══════════════════════════╪══════════════════════════╗
            ║  ⑵ Q/K/V PROJECTION (3 separate pipelines)       ║
            ║───────────────────────────────────────────────────║
            ║                                                     ║
            ║  ┌──────────────┐  ┌──────────────┐  ┌──────────┐ ║
            ║  │ Q Proj [8×16]│  │ K Proj [8×16]│  │V Proj[8×16]│ ║
            ║  │ W_Q: [16×16] │  │ W_K: [16×16] │  │W_V:[16×16]│ ║
            ║  │ 2048 MACs    │  │ 2048 MACs    │  │2048 MACs  │ ║
            ║  │ II=1         │  │ II=1         │  │II=1       │ ║
            ║  └──────┬───────┘  └──────┬───────┘  └─────┬─────┘ ║
            ║         │                 │                 │       ║
            ╚═════════╪═════════════════╪═════════════════╪═══════╝
                      │                 │                 │
            ┌─────────▼────────┐ ┌──────▼──────┐ ┌───────▼──────┐
            │  ELU+1 (inplace) │ │ ELU+1 (inpl)│ │  (pass thru) │
            │  φ(Q)[8][16]     │ │ φ(K)[8][16] │ │  V[8][16]    │
            │  128 elem ops    │ │ 128 elem ops│ │              │
            └────────┬─────────┘ └──────┬──────┘ └──────┬───────┘
                     │                  │                │
                     │     ╔════════════╧════════════╗   │
                     │     ║ ⑶ KEY SUM              ║   │
                     │     ║ K_sum[f] = Σₛ φ(K)[s,f]║   │
                     │     ║ → [16] vector           ║   │
                     │     ║ II=1, 128 adds          ║   │
                     │     ╚════════════╤════════════╝   │
                     │                  │                │
                     │     ╔════════════╧════════════════╧══╗
                     │     ║ ⑷ KV ACCUMULATION             ║
                     │     ║ KV[f₁,f₂] = Σₛ φ(K)[s,f₁]·V[s,f₂]
                     │     ║ → [16×16] matrix                ║
                     │     ║ II=2, 2048 MACs                 ║
                     │     ║ attn_acc_t<28,12> accumulator   ║
                     │     ╚════════════╤════════════════════╝
                     │                  │
                     │     ╔════════════╧════════════╗
                     │     ║ ⑸a DENOMINATOR          ║
                     │     ║ Z[s] = Σ_f φ(Q)[s,f]    ║
                     │     ║        · K_sum[f]       ║
                     │     ║ → [8] vector             ║
                     │     ║ II=2, 128 MACs           ║
                     │     ╚════════════╤════════════╝
                     │                  │
                     │     ╔════════════╧══════════════════════╗
                     │     ║ ⑸b NUMERATOR + ATTENTION         ║
                     │     ║ N[s,f₂] = Σ_f₁ φ(Q)[s,f₁]·KV[f₁,f₂]
                     │     ║ Attn[s,f₂] = N[s,f₂] / Z[s]      ║
                     │     ║ → [8×16]                          ║
                     │     ║ II=2, 2048 MACs + 128 divs        ║
                     │     ╚════════════╤══════════════════════╝
                     │                  │
                     ╔══════════════════╧══════════════════════╗
                     ║ ⑹ OUTPUT PROJECTION + RESIDUAL 1       ║
                     ║ AttnOut = Attn · W_O [16×16]           ║
                     ║ Residual₁ = embedded + AttnOut          ║
                     ║ → [8×16]  MACs: 2048  II=1             ║
                     ╚══════════════════╤══════════════════════╝
                                        │
                     ╔══════════════════╧══════════════════════╗
                     ║ ⑺ LAYER NORM 1                        ║
                     ║ per-token: mean → var → inv_std        ║
                     ║ → normalize → scale + shift            ║
                     ║ → norm1 [8×16]  II=2                   ║
                     ╚══════════════════╤══════════════════════╝
                                        │
                     ╔══════════════════╧══════════════════════╗
                     ║ ⑻ FFN LAYER 0 (D→FF, ReLU)           ║
                     ║ hidden = norm1 · W_FF0 [16×32]         ║
                     ║ ReLU: max(0, x)                        ║
                     ║ → hidden [8×32]  MACs: 4096  II=1     ║
                     ╚══════════════════╤══════════════════════╝
                                        │
                     ╔══════════════════╧══════════════════════╗
                     ║ ⑼ FFN LAYER 3 (FF→D) + RESIDUAL 2    ║
                     ║ output = hidden · W_FF3 [32×16]        ║
                     ║ Residual₂ = norm1 + output             ║
                     ║ → residual2 [8×16]  MACs: 4096  II=1  ║
                     ╚══════════════════╤══════════════════════╝
                                        │
                     ╔══════════════════╧══════════════════════╗
                     ║ ⑽ LAYER NORM 2                        ║
                     ║ → norm2 [8×16]  II=2                   ║
                     ╚══════════════════╤══════════════════════╝
                                        │
                     ╔══════════════════╧══════════════════════╗
                     ║ ⑾ MEAN POOLING (across sequence)       ║
                     ║ pooled[f] = (1/S) Σₛ norm2[s,f]        ║
                     ║ → [16] vector                           ║
                     ╚══════════════════╤══════════════════════╝
                                        │
                     ╔══════════════════╧══════════════════════╗
                     ║ ⑿ OUTPUT LAYER NORM                   ║
                     ║ → normalized [16]                       ║
                     ╚══════════════════╤══════════════════════╝
                                        │
                     ╔══════════════════╧══════════════════════╗
                     ║ ⒀ CLASSIFIER (D→2)                    ║
                     ║ logits[c] = Σ_f norm[f]·W_cls[c,f]    ║
                     ║ → [2] (binary classification)          ║
                     ║ MACs: 32  II=1                         ║
                     ╚══════════════════╤══════════════════════╝
                                        │
                              ┌─────────▼──────────┐
                              │ ap_fixed → float32  │
                              │ logits [2] (AXI)    │
                              └────────────────────┘

═══════════════════════════════════════════════════════════════════════════
  LEGEND:
  ╔═══╗  Major compute block
  ┌───┐  Element-wise / simple ops
  ───►   Data dependency
  ═══►   Critical path (sequential dependency)
═══════════════════════════════════════════════════════════════════════════
```

---

## 10. Summary: MAC/Latency/Mask Decision Table

### 10.1 All loops ranked by MAC impact

| Rank | Loop | MACs | % of Total | Acc. Type | II |
|------|------|------|-----------|-----------|-----|
| 1 | FFN₁ (D→FF) | 4096 | 17.3% | ffn_acc_t<24,10> | 1 |
| 2 | FFN₂ (FF→D) | 4096 | 17.3% | ffn_acc_t<24,10> | 1 |
| 3 | Input Embedding | 3072 | 13.0% | linear_acc_t<24,10> | 1 |
| 4 | Q Projection | 2048 | 8.6% | linear_acc_t<24,10> | 1 |
| 5 | K Projection | 2048 | 8.6% | linear_acc_t<24,10> | 1 |
| 6 | V Projection | 2048 | 8.6% | linear_acc_t<24,10> | 1 |
| 7 | **KV Accumulation** | **2048** | **8.6%** | **attn_acc_t<28,12>** | **2** |
| 8 | **Numerator** | **2048** | **8.6%** | **attn_acc_t<28,12>** | **2** |
| 9 | O_proj | 2048 | 8.6% | linear_acc_t<24,10> | 1 |
| 10 | Denominator | 128 | 0.5% | attn_acc_t<28,12> | 2 |
| 11 | Classifier | 32 | 0.1% | linear_acc_t<24,10> | 1 |
| **Total** | | **23,712** | **100%** | | |

### 10.2 All loops ranked by latency impact

| Rank | Loop | Est. Cycles | Factor | Limiting Reason |
|------|------|------------|--------|-----------------|
| 1 | **KV Accumulation** | **~5,120** | II=2, D²×S iters | BRAM port contention (2 reads + 1 write) |
| 2 | Numerator | ~4,608 | II=2, S×D² iters | Same as above + division |
| 3 | FFN₁ | ~4,096 | II=1, S×D×FF | Large FF dimension (32) |
| 4 | FFN₂ | ~4,096 | II=1, S×FF×D | Large FF dimension (32) |
| 5 | Input Embedding | ~3,072 | II=1, S×D×Fin | Input dimension (24) |
| 6 | Q/K/V Proj (each) | ~2,048 | II=1, S×D² | D² per sequence element |
| 7 | O_proj | ~2,048 | II=1, S×D² | Standard matmul |
| 8 | LayerNorm ×2 | ~512 | II=2, 3-pass | Sequential mean→var→norm |
| 9 | Denominator | ~256 | II=2, S×D | Small iteration count |
| 10 | K_sum | ~128 | II=1, D×S | Simple addition |

### 10.3 Mask=0 execution survival

| Computation | Runs when mask=0? | Why |
|------------|-------------------|-----|
| Input Embedding | ✅ **YES** | Applied before attention |
| Q Projection | ✅ **YES** | Computed for all tokens |
| K Projection | ✅ **YES** | Computed for all tokens |
| V Projection | ✅ **YES** | Computed for all tokens |
| φ(Q) | ✅ **YES** | Applied element-wise to Q |
| φ(K) | ✅ **YES** | Applied element-wise to K |
| KV Accumulation | ✅ **YES** | **Global sum over ALL tokens** — masked tokens still contribute |
| K_sum | ✅ **YES** | Sums ALL key vectors |
| Denominator | ✅ **YES** | Uses K_sum which includes masked tokens |
| Numerator | ✅ **YES** | Uses KV which includes masked token contributions |
| O_proj + Residual | ✅ **YES** | Computed for all positions |
| LayerNorm | ✅ **YES** | Per-token, all tokens |
| FFN | ✅ **YES** | Per-token, all tokens |
| Output | ✅ **YES** | All computations dependent on earlier full-sequence ops |

**Bottom line:** In the current linear transformer implementation, **100% of computations execute regardless of mask**. The O(S·D²) complexity advantage comes at the cost of losing the natural masking semantics of standard attention. The KV accumulator is a global state that cannot be selectively updated per attention head.

---

## 11. Implementation Variant Comparison

| Feature | Float (`linear_transformer/`) | UNSW v1 (fixed16) | UNSW v3b (hotspot) | CSG-Halt Sparse |
|---------|------|-----|------|-----|
| **KV shape** | `[S×S]` ❌ | `[D×D]` ✅ | `[D×D]` ✅ | `[ACTIVE×D]` ✅ |
| **Q/K/V loops** | Combined | Combined | **Split** (3 loops) | Split (3 loops) |
| **Arithmetic** | float32 | ap_fixed<16,6> | ap_fixed<16,6> | mixed fixed |
| **Accumulator** | float32 | linear: <24,10>, attn: <28,12> | same | same |
| **KV II** | unconstrained | unconstrained | **II=2** | II=2 |
| **Proj II** | unconstrained | unconstrained | **II=1** | II=1 |
| **KV MACs** | 512 (8×8×8) | 2048 (16×16×8) | 2048 | **1792** (14×16×8) |
| **Sparsity** | None | None | None | 87.5% (14/16 ch) |
| **Feature Map** | ELU+1 (exact) | ELU+1 (exact) | ELU+1 (exact) | PWL 3-segment |
| **Mask support** | ❌ | ❌ | ❌ | ❌ |
| **Seq length scaling** | O(S²) ❌ | O(S·D²) ✅ | O(S·D²) ✅ | O(S·ACT·D) ✅ |
| **Estimated LUT** | N/A | ~14,004 | ~14,004 | **TBD** (target <14,004) |
| **Target** | Reference | PYNQ-Z2 baseline | PYNQ-Z2 optimized | Pareto improvement |

---

## 12. Key Design Decisions & Trade-offs

### 12.1 Why split Q/K/V loops?
```
Combined loop:  1 read of `embedded`, 3 MACs, 3 writes  → DSP contention, II≤3
Split loops:   1 read per loop, 1 MAC, 1 write per loop → clean II=1
Cost: 3× BRAM reads of `embedded` (reads are cheap on FPGA)
```

### 12.2 Why KV is the bottleneck despite moderate MAC count
```
KV: D×D=256 outer iterations × II=2 = 512+ cycles minimum
    Each iteration: read key[s][kf] (BRAM) + read value[s][vf] (BRAM)
                    multiply + accumulate + write key_value[kf][vf] (BRAM)
    BRAM has 2 read ports → 2 reads saturate → no room for write buffering
    → II=2 is the best achievable without array partitioning
```

### 12.3 Why sparse attention helps
```
Full:    KV[16][16] → 256 accumulator entries → 256×8 MACs = 2048
Sparse:  KV[14][16] → 224 accumulator entries → 224×8 MACs = 1792 (-12.5%)
         Key_sum[14] instead of [16]
         Denominator: 8×14 MACs instead of 8×16

Extra savings: when Q entry is zeroed (channel not in Q active set),
     the numerator loop STILL runs but multiplies by 0
     → MAC executes but result contributes 0
     → Future optimization: skip the MAC entirely
```

### 12.4 The `[S×S]` KV bug in the float implementation
```
linear_transformer.cpp computes:  kv = K [8×8] · Vᵀ [8×8]  → kv [8×8]
This is WRONG for linear attention. Should be: KV = Kᵀ [8×8] · V [8×8] → KV [8×8]
(The shapes happen to be identical because S=D=8, but the semantics differ.)

unsw_linear_transformer.cpp computes: KV = Kᵀ [D×S] · V [S×D] → KV [D×D]
This is the CORRECT linear attention formulation.
```

---

## Appendix A: File Index

| File | Role |
|------|------|
| `src/transformer.py:369-441` | Python `LinearAttention` — reference implementation |
| `src/transformer.py:578-608` | Python `_UNSWLinearAttention` — corrected formulation |
| `src/transformer.py:357-366` | Python `FeatureMap` — ELU+1 definition |
| `vitis_hls/linear_transformer/linear_transformer.cpp` | HLS float — [S×S] KV variant |
| `vitis_hls/linear_transformer_slow/linear_transformer.cpp` | HLS float — modular template variant |
| `vitis_hls/unsw_linear_transformer_fixed16_v1/src/unsw_linear_transformer.cpp` | HLS fixed16 baseline |
| `vitis_hls/unsw_linear_transformer_fixed16_v3b_hotspot_ii1/src/unsw_linear_transformer.cpp` | HLS fixed16, split loops, II=1 ✅ |
| `vitis_hls/unsw_linear_transformer_fixed16_v3b_hotspot_ii1/src/hls_types.h` | Fixed-point type definitions |
| `experiments/innovation1_csg_halt/scripts/04b_generate_sparse_hls_variants.py` | Sparse attention variant generator |
| `experiments/imgds_linear_sparse/stage4_structural_small_models/` | Structural small model experiments |

## Appendix B: Quantization Precision Map

```
  Stage            Input Type      Weight Type     Accumulator       Output Type
  ─────            ──────────      ───────────     ───────────       ───────────
  Input convert    float32         —               —                 data_t<16,6>
  Embedding        data_t<16,6>    weight_t<16,6>  linear_acc<24,10> act_t<16,6>
  Q/K/V Proj       data_t<16,6>    weight_t<16,6>  linear_acc<24,10> act_t<16,6>
  ELU+1            act_t<16,6>     —               float (exp path)  act_t<16,6>
  KV Accum         act_t<16,6>     —               attn_acc<28,12>   attn_acc<28,12>
  Denominator      act_t<16,6>     —               attn_acc<28,12>   attn_acc<28,12>
  Numerator        act_t + attn    —               attn_acc<28,12>   act_t<16,6>
  O_proj           act_t<16,6>     weight_t<16,6>  linear_acc<24,10> act_t<16,6>
  LayerNorm        act_t<16,6>     weight_t<16,6>  linear_acc<24,10> act_t<16,6>
  FFN              act_t<16,6>     weight_t<16,6>  ffn_acc<24,10>    act_t<16,6>
  Pooling          act_t<16,6>     —               linear_acc<24,10> act_t<16,6>
  Classifier       act_t<16,6>     weight_t<16,6>  linear_acc<24,10> act_t<16,6>
  Output convert   act_t<16,6>     —               —                 float32 (AXI)
```
