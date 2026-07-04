# UNSW-NB15 Linear Transformer HLS — Project Scan Report

## 1. HLS Project Summary

| Item | Value |
|---|---|
| **Project Location** | `vitis_hls/unsw_linear_transformer_hls/` |
| **Top Function** | `unsw_linear_transformer` |
| **Input Shape** | `float[UNSW_SEQ_LEN][UNSW_INPUT_DIM]` = `float[8][24]` |
| **Output Shape** | `float[UNSW_NUM_CLASSES]` = `float[2]` |
| **Model** | Single-layer Linear Transformer / Linear Attention |
| **Task** | Binary anomaly detection (0=normal, 1=anomaly) |
| **Target Part** | `xc7z020clg400-1` (PYNQ-Z2) |
| **Target Clock** | 10.0 ns |

## 2. Current Data Types

**All arithmetic, arrays, weights, and biases are `float` (32-bit IEEE 754).**

No `ap_fixed`, no integer, no half-precision.

## 3. PYNQ-Z2 Resource Utilization (Original Float Design)

| Resource | Used | Capacity | % |
|---|---|---|---|
| BRAM_18K | 176 | 280 | 62.86% |
| DSP48E | 258 | 220 | **117.27%** |
| FF | 71828 | 106400 | 67.51% |
| LUT | 65546 | 53200 | **123.21%** |

**Decision: Cannot deploy; DSP and LUT both exceed PYNQ-Z2 capacity.**

Latency: 7869 cycles, Interval: 7870 cycles.

## 4. Computation Sections per `unsw_linear_transformer`

### 4.1 Input Embedding (lines 70–81)
- **Operation**: 16×24 matrix multiply per sequence (8 sequences)
- **Equation**: `embedded[s][o] = sum(input[s][i] * W_proj[o][i]) + bias + pos_embedding[o][s]`
- **DSP consumption**: 16 × 24 × 8 = **3,072 multiply-accumulates** (theoretically parallelizable)
- **Current float**: `float[16][24]` weight, `float[8][24]` input

### 4.2 Q/K/V Projection (lines 86–104)
- **Operation**: 3 × (16×16) matrix multiply per sequence (8 sequences)
- **Equation**: `Q[s][o] = elu_plus_one(sum(emb[s][i] * W_q[o][i]));` same for K and V
- **DSP consumption**: 3 × 16 × 16 × 8 = **6,144 MACs**
- **Current float**: `float[16][16]` weight × 3

### 4.3 KV Outer Accumulation (lines 106–115)
- **Operation**: `key_value[k][v] = sum_s(key[s][k] * value[s][v])`
- **DSP consumption**: 16 × 16 × 8 = **2,048 MACs**
- **Current float**: `float[16][16]`

### 4.4 Key Sum (lines 117–124)
- **Operation**: `key_sum[f] = sum_s(key[s][f])`
- **DSP consumption**: negligible (add only, no multiply)

### 4.5 Attention Computation (lines 126–143)
- **Denominator**: `sum_f(query[s][f] * key_sum[f])` — 16 × 8 = 128 MACs
- **Numerator**: `sum_k(query[s][k] * key_value[k][v])` — 16 × 16 × 8 = **2,048 MACs**
- **Total attention MACs**: **~2,176**

### 4.6 Attention Output Projection (lines 145–157)
- **Operation**: 16×16 matrix multiply per sequence
- **Equation**: `attn_out[s][o] = sum(attention[s][i] * W_o[o][i]) + bias`
- **DSP consumption**: 16 × 16 × 8 = **2,048 MACs**
- **Residual add**: `residual1 = embedded + attn_out` (add only)

### 4.7 Layer Norm 1 (lines 159–165)
- Per-sequence mean, variance, normalize, scale, shift on [8][16]
- Contains division and `std::sqrt`

### 4.8 FFN Layer 0 (lines 167–177)
- **Operation**: 32×16 matrix multiply per sequence, ReLU
- **DSP consumption**: 32 × 16 × 8 = **4,096 MACs**

### 4.9 FFN Layer 3 (lines 179–189)
- **Operation**: 16×32 matrix multiply per sequence, residual add
- **DSP consumption**: 16 × 32 × 8 = **4,096 MACs**

### 4.10 Layer Norm 2 (lines 191–197)
- Same as Layer Norm 1

### 4.11 Pooling + Output Norm + Classifier (lines 199–217)
- **Pooling**: 8×16 sum then divide (low DSP)
- **Output Norm**: 16-element layer norm (division + sqrt)
- **Classifier**: 2×16 matrix multiply — **32 MACs**

### Total MACs ≈ 3,072 + 6,144 + 2,048 + 2,176 + 2,048 + 4,096 + 4,096 + 32 = **23,712** multiply-accumulates per inference

## 5. Current HLS Pragmas

**None.** The solution directive file is empty (only TOP pragma). Vitis HLS automatically inserts maximum parallelism (UNROLL all loops), causing DSP=258 and LUT=65546.

## 6. DSP/LUT Hotspots (ranked by contribution)

1. **QKV Projection (3×16×16×8)** — largest weight arrays, 3 separate matrix multiplications, fully unrolled → massive DSP parallelization
2. **FFN Layer 0 (32×16×8)** — wide FFN dim, many DSPs
3. **FFN Layer 3 (16×32×8)** — same
4. **Input Projection (16×24×8)** — input dim 24
5. **KV Accumulation + Attention Numerator** — 2 × (16×16×8)
6. **Attention Output Projection (16×16×8)**

## 7. Files in Current HLS Project

| File | Purpose |
|---|---|
| `src/unsw_linear_transformer.h` | Top-level header, dimension constants |
| `src/unsw_linear_transformer.cpp` | Top function + all computation |
| `src/weights.h` | All trained weights as `static const float` |
| `src/test_vectors.h` | 16 test samples + expected outputs |
| `src/testbench.cpp` | CSIM wrapper, error measurement |
| `run_csim.tcl` | Vitis HLS C simulation script |
| `run_csynth.tcl` | Vitis HLS synthesis script |

## 8. Optimization Strategy

### Phase 1: Fixed-Point Conversion (V1)
- Replace all internal `float` with `ap_fixed<16,6>` for data/weights/activations
- Use wider accumulators: `ap_fixed<24,10>` for linear, `ap_fixed<28,12>` for attention
- Keep AXI interface as `float` at top level, convert internally to fixed-point
- No pragma changes — measure baseline fixed-point resource

### Phase 2: Parallelism Reduction (V2)
- Add pragmas to limit UNROLL on matrix multiply loops
- Change implicit ARRAY_PARTITION to cyclic or none
- Increase PIPELINE II from implicit 1 to 2 or 4
- Allow DSP reuse at cost of higher latency

### Phase 3: Precision Sweep (V3)
- Test multiple fixed-point width combinations
- Find minimum viable bitwidth for PYNQ-Z2 fit