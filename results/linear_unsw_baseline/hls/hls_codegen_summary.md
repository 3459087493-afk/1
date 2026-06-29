# UNSW-NB15 Linear Transformer HLS Codegen and CSIM

- Checkpoint: `/home/cym/prj2/finn/notebooks/icl_thesis-master/results/linear_unsw_baseline/best_model.pt`
- Checkpoint format: `model_state_dict`
- ONNX reference: `/home/cym/prj2/finn/notebooks/icl_thesis-master/results/linear_unsw_baseline/onnx/unsw_linear_transformer.onnx`
- Test inputs: `/home/cym/prj2/finn/notebooks/icl_thesis-master/results/linear_unsw_baseline/sample_inputs.npy`
- HLS top function: `unsw_linear_transformer`
- Input shape: `[8, 24]`
- Output shape: `[2]`
- Arithmetic: `float`
- Exported tensors: `20`
- Exported parameters: `2770`

## Generated HLS Files

- `vitis_hls/unsw_linear_transformer_hls/src/unsw_linear_transformer.h`
- `vitis_hls/unsw_linear_transformer_hls/src/unsw_linear_transformer.cpp`
- `vitis_hls/unsw_linear_transformer_hls/src/weights.h`
- `vitis_hls/unsw_linear_transformer_hls/src/test_vectors.h`
- `vitis_hls/unsw_linear_transformer_hls/src/testbench.cpp`
- `vitis_hls/unsw_linear_transformer_hls/run_csim.tcl`
- `vitis_hls/unsw_linear_transformer_hls/run_csynth.tcl`
- `vitis_hls/unsw_linear_transformer_hls/README.md`

## C Simulation

- `vitis_hls` available: `True`
- C simulation executed: `True`
- C simulation passed: `True`
- Maximum absolute error: `1.907348633e-06`
- Mean absolute error: `4.954636097e-07`
- Prediction match rate: `1.0`
- Can enter `csynth_design`: `True`
- Status: `CSIM PASS`

## Next Step

Run `csynth_design` only after C simulation passes. Vivado, bitstream generation,
and PYNQ execution are outside this stage and have not been run.
