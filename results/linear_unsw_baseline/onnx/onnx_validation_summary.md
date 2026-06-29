# UNSW-NB15 Linear Transformer ONNX Validation

- Checkpoint: `/home/cym/prj2/finn/notebooks/icl_thesis-master/results/linear_unsw_baseline/best_model.pt`
- Checkpoint format: `model_state_dict`
- Model class: `LinearUNSWAnomalyDetector`
- Input shape: `[1, 8, 24]`
- Output shape: `[1, 2]`
- ONNX model: `/home/cym/prj2/finn/notebooks/icl_thesis-master/results/linear_unsw_baseline/onnx/unsw_linear_transformer.onnx`
- ONNX opset: `13`

## ONNX Operators

| op_type | count |
|---|---:|
| `Add` | 15 |
| `Clip` | 1 |
| `Constant` | 11 |
| `Div` | 4 |
| `Elu` | 2 |
| `Gemm` | 1 |
| `MatMul` | 10 |
| `Mul` | 3 |
| `Pow` | 3 |
| `ReduceMean` | 7 |
| `ReduceSum` | 1 |
| `Relu` | 1 |
| `Sqrt` | 3 |
| `Sub` | 3 |
| `Transpose` | 1 |
| `Unsqueeze` | 1 |

## Single Sample

- PyTorch logits: `[[-1.355611801147461, 1.2704846858978271]]`
- ONNX logits: `[[-1.35561203956604, 1.2704851627349854]]`
- Maximum absolute error: `4.76837158203e-07`
- Mean absolute error: `3.57627868652e-07`
- RMSE: `3.76972873231e-07`
- PyTorch prediction: `1`
- ONNX prediction: `1`
- True label: `0`
- Prediction match: `True`

## First 100 Samples

- Maximum absolute error: `1.07288360596e-06`
- Mean absolute error: `2.96756625175e-07`
- RMSE: `3.9339206661e-07`
- Prediction match rate: `1.000000`
- Logits allclose (`rtol=1e-4`, `atol=1e-5`): `True`

## Next Step

- Can proceed to HLS / Vivado / PYNQ preparation: `True`
- No HLS, Vivado, FPGA, or PYNQ operation was performed in this export step.
