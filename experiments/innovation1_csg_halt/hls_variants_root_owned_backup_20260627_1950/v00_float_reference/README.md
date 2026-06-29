# v00_float_reference

- Active channel ratio: `1.0` (`16/16`)
- Active Q channels: `[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]`
- Active K channels: `[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]`
- Fixed-point mode: `float`
- Feature-map mode: `elu_plus_one`
- Scheduling mode: `baseline`
- Difference from float baseline: Exact copied float computation; only CSIM tolerance is named in the header.
- PyTorch reference logits: `../../results/hls_generation/reference_logits/original_float_reference_logits.npy`

This is the untouched float computation reference with all 16 Q/K channels.

## Commands

```bash
cd /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/innovation1_csg_halt/hls_variants/v00_float_reference
source /tools/Xilinx/Vitis_HLS/2022.2/settings64.sh
vitis_hls -f run_csim.tcl
vitis_hls -f run_csynth.tcl
```

Run `04c_generate_variant_reference_logits.py` before CSIM so `test_vectors.h` contains the
variant-specific expected logits. No result in this README claims CSIM or CSYNTH success.
