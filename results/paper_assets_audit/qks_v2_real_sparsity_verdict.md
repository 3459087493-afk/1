# QKS-v2 real-sparsity verdict

## Verdict: PARTIAL_HARDWARE_SPARSITY

QKS-v2 is not fake mask sparsity. Its generated HLS variants compile `ATTN_DIM` as 16, 14, 13 and 11; Wq/Wk, Q/K, KV and K_sum are physically smaller; the affected loops terminate at `ATTN_DIM`; and the source explicitly removes `ACTIVE_CHANNELS`, runtime masks and `if(active)` checks. HLS latency falls from 90,650 to 81,022 cycles and PYNQ kernel latency falls from 1100.84 to 1005.70 µs, while accuracy remains approximately 93.6–94.1%.

The verdict is **partial**, not “whole-model sparse,” because V projection, output projection, FFN, LayerNorm, pooling, token count and D_MODEL remain dense. The implementation is genuine physical Q/K attention-dimension pruning. Its claim should be scoped exactly that way.

In plain language: we did not merely multiply inactive channels by zero. The Q/K arrays really became narrower, the relevant loops really executed fewer iterations, and the measured FPGA kernel really became faster. But only the Q/K attention path was pruned; the entire Transformer was not.
