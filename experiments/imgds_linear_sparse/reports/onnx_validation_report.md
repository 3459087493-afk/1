# ONNX Runtime Validation Report

## Model Check
- ONNX checker: PASSED
- Comparison samples: 200

## Numerical Comparison (PyTorch vs ONNX)
- max_abs_error: 0.00000072
- mean_abs_error: 0.00000016
- rmse: 0.00000021
- allclose (atol=1e-5, rtol=1e-4): True
- allclose (atol=1e-4, rtol=1e-4): True

## ONNX Runtime Metrics (N=200)
- Accuracy:  0.9500
- Precision: 0.9758
- Recall:    0.9641
- F1:        0.9699
- AUC:       0.9581

## Graph Statistics
- Nodes: 37
- Initializers: 20
- Operators: {'MatMul': 10, 'Add': 9, 'Elu': 2, 'Constant': 5, 'Transpose': 1, 'ReduceSum': 1, 'Unsqueeze': 1, 'Clip': 1, 'Div': 1, 'LayerNormalization': 3, 'Relu': 1, 'ReduceMean': 1, 'Gemm': 1}

## Conclusion
ONNX model exports successfully and produces outputs consistent with PyTorch.
