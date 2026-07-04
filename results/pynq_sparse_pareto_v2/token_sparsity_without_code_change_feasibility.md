# Patch/token-level sparsity without changing QKS-v2 code

## Conclusion

**feasible_without_code_change: no**

The current QKS-v2 accelerator can vary only the Q/K attention feature dimension (`ATTN_DIM=16/14/13/11`). It cannot vary the number of input patches or token-loop iterations. Supplying zeros for selected patches would still transfer 16×64 values and execute every `SEQ_LEN=16` loop; that would be mask/zero sparsity rather than token-level compute skipping.

It is therefore not possible—without changing HLS and PYNQ code—to add genuine patch/token sparsity or to make Full Application Latency decrease monotonically as a causal consequence of that sparsity. Existing full-application totals must not be filtered, reordered or selectively reported to create monotonic data.

## Six required checks

### 1. FPGA IP input shape

The input shape is fixed at compile time:

```cpp
#define SEQ_LEN 16
#define INPUT_DIM 64
data_t input[SEQ_LEN][INPUT_DIM]
#pragma HLS INTERFACE m_axi port=input ... depth=1024
```

All S0/S10/S20/S30 variants use the same `[16][64]` input and AXI depth 1024. At Q6.10/int16 this is 1024 elements or 2048 bytes per sample.

Evidence: `q16_qksv2_d*.h`, lines 7–10 and 17–20; `q16_qksv2_d*.cpp`, top-level interface around lines 202–210.

### 2. Patch/token count

The patch count is fixed at 16. A 32×32 grayscale image is divided into a 4×4 grid of 8×8 patches. QKS-v2 sparsity changes attention feature width, not token count.

### 3. PYNQ patch-tensor construction

The runner always constructs all 16 patches:

```python
for pr in range(4):
    for pc in range(4):
        ...
return np.array(patches)  # [16, 64]
```

It then reshapes and copies the complete tensor. There is no token score, active-token list, compaction or variable-length metadata. Evidence: `run_qks_v2_pynq.py`, lines 24–41 and 44–65.

### 4. PS–PL transfer size

Transfer size does not change among S0/S10/S20/S30. The runner allocates and writes `N * 16 * 64` int16 elements for every configuration. Reducing `ATTN_DIM` changes internal Q/K computation but does not reduce the 2048-byte input-buffer payload.

### 5. HLS token loops

Token loops do not support a variable active-token count. Input projection, Q/K/V generation, KV accumulation across tokens, K_sum, attention output, LayerNorm, FFN and pooling all use compile-time `SEQ_LEN`. Pooling also divides by fixed `SEQ_LEN`.

There is no `active_token_num` port or runtime loop bound. Writing zero tokens cannot reduce loop iterations because the loops still run from 0 to 15.

### 6. Full-application preprocessing

Q/K feature-dimension pruning does not affect:

- image file read and JPEG decode;
- resize to 32×32;
- normalization;
- construction of all sixteen patches;
- the fixed-size input quantization and transfer.

The measured breakdown shows read/decode alone at roughly 12 ms and about 65% of total time. Kernel execution is only about 5% of the 18.5–18.8 ms total. These PS costs vary with operating-system load, storage/cache state and Python/PIL execution, independently of Q/K sparsity. This is why the existing Full Application Latency is not monotonic even though FPGA kernel latency is monotonic.

## What must change for real token sparsity

At minimum, genuine patch/token-level sparsity requires changes to both sides of the interface.

### PYNQ/PS changes

1. Compute a token importance/event score.
2. Select active token indices using a defined threshold or fixed K.
3. Compact/gather only active patches into a packed tensor.
4. Pass `active_token_num` and, if required, token indices/positions to the accelerator.
5. Allocate/copy/flush only the active payload or define a packed fixed-maximum protocol with an explicit valid count.
6. Preserve positional information and use event-aware pooling semantics.

### HLS changes

1. Add an active-count/index interface or synthesize separate fixed-K accelerators.
2. Replace relevant token bounds with `ACTIVE_TOKEN_NUM` or a bounded runtime active count.
3. Make input projection, Q/K/V, KV/K_sum, attention output, LayerNorm, FFN and pooling consume the compacted token list.
4. Divide pooling by active count rather than 16.
5. Ensure loops do not remain `SEQ_LEN` with `if(mask)` or multiply inactive values by zero.
6. Revalidate numerical equivalence/accuracy and then run csynth/Vivado/PYNQ to prove iteration and latency reduction.

If selection occurs after K or φ(K), the front-end input/K projection must still process all 16 tokens; only later stages can skip tokens. To reduce patch construction, input transfer and input projection as well, selection must occur before those stages using an input-side score.

## Can Full Application Latency become monotonic after such changes?

It may decrease in expectation, but monotonicity is not guaranteed. Real pre-projection token compaction could reduce patch packing, quantization, PS–PL payload and token-dependent PL computation. It would not reduce JPEG decode, image resize or normalization, and token scoring/selection introduces new overhead. Since those fixed/noisy PS components dominate the current total, their variation may be larger than the saved token time.

A valid future claim would require repeated full-dataset measurements with identical sample order and a disclosed statistical protocol. Kernel latency and token-dependent subcomponents should be reported separately. Observed non-monotonic totals must be retained and explained rather than removed.

## Timing-boundary warning

Changing the timing boundary—for example reporting kernel-only latency instead of Full Application Latency—can reveal the already monotonic Q/K kernel effect. It does **not** add patch/token sparsity and does not make the full application itself faster. Renaming or narrowing the metric is a reporting change, not a new sparse implementation.

Likewise, passing a full `[16][64]` tensor with some patches set to zero would not qualify: transfer size, array dimensions and token loop trip counts remain unchanged.
