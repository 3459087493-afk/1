# Ours-Dense-Q8 PYNQ-Z2 Validation

## Model

| Property | Value |
|----------|-------|
| Paper Name | **Ours-Dense-Q8** |
| Architecture | Linear Transformer, d=16/ff=32 |
| Weight storage | ap_fixed<8,4> (Q8) |
| Data path | ap_fixed<16,6> (Q16) |
| m_axi I/O type | int16 (Q6.10, scale=1024) |
| Vivado LUT | 14,019 |
| Vivado DSP | 124 (-20.5% vs Q16 Main's 156) |
| Vivado FF | 13,373 |
| Vivado BRAM | 15 |
| SW Accuracy | 91.00% |
| Test samples | 3,444 |

## Package Contents

| File | Size | Purpose |
|------|------|---------|
| q8_dense.bit | 3.9 MB | Vivado bitstream |
| q8_dense.hwh | 262 KB | Hardware handoff |
| run_q8_dense_pynq_full_test.py | ~140 lines | Staged validation script |
| q8_dense_test_3444.npz | 14 MB | Full test set + Q8 ref logits |
| q8_dense_eval200.npz | 804 KB | Quick 200-sample check |
| q8_dense_sanity.npz | 4.8 KB | Single-sample sanity |

## Run on PYNQ-Z2

```bash
sudo python3 run_q8_dense_pynq_full_test.py
```

Output: `q8_dense_pynq_result.csv`
