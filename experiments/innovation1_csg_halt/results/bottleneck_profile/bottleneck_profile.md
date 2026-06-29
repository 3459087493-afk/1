# Float HLS Baseline Bottleneck Profile

## Measured Baseline

| Metric | Value |
|---|---:|
| Latency max | 7869 cycles |
| Interval max | 7870 cycles |
| Estimated clock | 8.567 ns |
| BRAM_18K | 176 / 280 (62.86%) |
| DSP48E | 258 / 220 (117.27%) |
| FF | 71828 / 106400 (67.51%) |
| LUT | 65546 / 53200 (123.21%) |

The float baseline is functionally correct and meets the 10 ns target, but DSP and LUT
exceed PYNQ-Z2 capacity. It must not proceed directly to Vivado or board evaluation.

## Likely Hardware Bottlenecks

1. Dense Q/K/V projections replicate floating-point multiply/add operators.
2. The `ELU+1` feature map requires floating-point exponential hardware.
3. `K^T V` and the numerator perform dense Linear Attention accumulations.
4. The denominator combines dense Q/K channels and floating-point division.
5. The attention output projection and classifier retain dense floating-point paths.
6. Automatic loop unrolling and array partitioning replicate operators aggressively.
7. The log contains 36 II-violation messages and 37 warnings,
   showing memory-port/dependence pressure in addition to resource overuse.

## Innovation-1 Direction

The next step is calibration-guided sparse Linear Attention hardware generation, not
immediate Vivado integration. Dynamic event gates are used only to discover important
`phi(Q)`/`phi(K)` channels; the later HLS kernel will use static active-channel loop bounds.
