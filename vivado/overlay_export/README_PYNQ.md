# Run Transformer Overlay on PYNQ-Z2

Copy these three files to the same directory on the PYNQ-Z2 board:

- `transformer.bit`
- `transformer.hwh`
- `run_transformer_on_pynq.py`

On the board:

```bash
cd /home/xilinx/transformer_overlay
python3 run_transformer_on_pynq.py
```

Expected output should be close to:

```text
HW output        : -0.50886
Expected C-sim   : -0.50886
Absolute error   : small float error
```

The HLS AXI-Lite register map used by the script:

```text
0x00 AP_CTRL
0x10 input_array low  address
0x14 input_array high address
0x1c val/output low  address
0x20 val/output high address
```

