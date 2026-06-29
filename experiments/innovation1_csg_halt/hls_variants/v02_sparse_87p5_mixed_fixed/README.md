# v02_sparse_87p5_mixed_fixed

- Active channel ratio: `0.875` (`14/16`)
- Active Q channels: `[0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15]`
- Active K channels: `[0, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15]`
- Fixed-point mode: `mixed_ap_fixed_16_18_24`
- Feature-map mode: `elu_plus_one_float_projection`
- Scheduling mode: `baseline_sparse_loop_bounds`
- Difference from float baseline: v01 plus mixed ap_fixed types inside the sparse attention accumulation.
- PyTorch reference logits: `../../results/hls_generation/reference_logits/sparse_87p5_mixed_fixed_reference_logits.npy`

Q and K sets differ. The compact physical dimension follows K indices, while compact Q is
zero for K channels absent from the Q set. This preserves the Stage 4 independent-mask
semantics; unrelated Q/K channels are never paired by list position. Q/K/V projections stay
16-dimensional in this first version. Sparse hardware is introduced in K^T V, key sum,
denominator, and numerator reductions.

## Commands

```bash
cd /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/innovation1_csg_halt/hls_variants/v02_sparse_87p5_mixed_fixed
source /tools/Xilinx/Vitis_HLS/2022.2/settings64.sh
vitis_hls -f run_csim.tcl
vitis_hls -f run_csynth.tcl
```

Run `04c_generate_variant_reference_logits.py` before CSIM so `test_vectors.h` contains the
variant-specific expected logits. No result in this README claims CSIM or CSYNTH success.
