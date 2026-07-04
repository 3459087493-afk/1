# QKS-v3 exploratory HLS check

## Status and scope

**QKS-v3 Phase 1 failed and is not eligible for main paper results.** S30 accuracy fell from 94.19% to 85.28%, an 8.91 percentage-point drop. The Phase 1 full-application proxy was not monotonic in either mean or median. The HLS work below was explicitly authorized only as exploratory evidence about whether real token compaction can reduce synthesized latency.

No QKS-v2 source/result was overwritten. No Vivado implementation, IP export, bitstream generation or PYNQ run was performed.

## Exploratory implementation

Four isolated projects were derived from the corresponding QKS-v2 sources. Each accelerator has a compile-time compact input `input[ACTIVE_TOKENS][64]` and a compact `token_indices[ACTIVE_TOKENS]` input used to fetch the original positional embedding. The main arrays are `x/Q/K/V[ACTIVE_TOKENS][...]`. All token-dependent input projection, attention, LayerNorm, FFN and pooling loops use `ACTIVE_TOKENS`; pooling divides by `ACTIVE_TOKENS`. Q/K storage and output-dimension loops use `ATTN_DIM`.

This is not a `[16,D]` tensor plus a mask. There is no token mask, `if(active)`, inactive zero row, or `ACTIVE_CHANNELS` indirect full-width loop. Input payload elements fall from 1024 to 896/832/704, excluding the small token-index payload.

## Results

| Config | Active tokens | ATTN_DIM | CSim | HLS latency cycles | Reduction vs S0 | Estimated total MAC reduction |
|---|---:|---:|---|---:|---:|---:|
| S0 | 16 | 16 | PASS | 90,705 | 0.00% | 0.00% |
| S10 | 14 | 14 | PASS | 76,045 | 16.16% | 15.65% |
| S20 | 13 | 13 | PASS | 69,055 | 23.87% | 23.14% |
| S30 | 11 | 11 | PASS | 55,819 | 38.46% | 37.44% |

All four csim and csynth commands exited successfully. Vitis HLS reported “All loop constraints were NOT satisfied” for each design; this warning is retained because some requested pipeline IIs were not achieved. It does not change the reported whole-design latency ordering, but these are synthesis estimates rather than placed-and-routed or measured values.

## Required answers

### 1. Does HLS latency decrease monotonically?

Yes. `90,705 > 76,045 > 69,055 > 55,819` cycles. Under this exploratory compile-time architecture, simultaneously reducing token count and Q/K width produces a strict monotonic decrease.

### 2. Does token-loop tripcount really decrease?

Yes. Source bounds are `ACTIVE_TOKENS`, and top/attention csynth reports show tripcounts `16 > 14 > 13 > 11`. The combined KV loop tripcount falls from 4096 to 3136, 2704 and 1936.

### 3. Does Q/K tripcount really decrease?

Yes. Q and K arrays are physically `[ACTIVE_TOKENS][ATTN_DIM]`, and Q/K output loops terminate at `ATTN_DIM=16/14/13/11`. This is direct compile-time pruning, not a 16-wide loop with conditional skipping.

### 4. Why can this not enter the main paper results?

Phase 1 already failed the predefined method gate: S30 loses 8.91 percentage points of accuracy and the software full-application proxy is not monotonic. The csim test is a finite-output smoke test, not a 3444-sample numerical/accuracy validation. Csynth provides estimated cycles only; there is no Vivado timing closure, resource implementation, bitstream, PYNQ kernel measurement, model-inference measurement or full-application measurement. Promoting this table would ignore the failed algorithm and measurement gates.

### 5. What would be needed for a main-result candidate?

At minimum:

1. Sparsity-aware training or fine-tuning using exactly the L1 Top-K compaction and the four fixed K values, with S30 accuracy drop brought within the declared 1 percentage-point limit.
2. A frozen selection/position/pooling specification shared by software, HLS and PYNQ.
3. Full 3444-sample HLS C/RTL numerical validation against the trained software reference, not only a smoke test.
4. Vivado implementation and timing closure for all four isolated accelerators.
5. PYNQ measurements of kernel, prepared-input model inference and complete application latency with all samples/repeats retained.
6. Strict monotonicity of the required PYNQ metrics, including full-application latency, under the predeclared protocol.

Until all conditions pass, this result remains **exploratory evidence that compact loop bounds can reduce HLS-estimated latency**, not a final model result.
