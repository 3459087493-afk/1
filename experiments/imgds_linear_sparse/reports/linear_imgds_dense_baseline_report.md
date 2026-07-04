# IMG_DS Linear Transformer Dense Baseline Report

## Status
- **Stage:** Stage 1 — software dense baseline
- **HLS:** No
- **FPGA resources:** No (not applicable)
- **PYNQ latency:** No (not applicable)
- **Quantization:** No (float32)
- **Sparsity:** No (0%)

## Configuration
- input_dim=64, seq_len=16, d_model=16, dim_feedforward=32
- num_layers=1, dropout=0.1, num_classes=2
- loss=CrossEntropyLoss(class_weight), optimizer=AdamW(lr=0.001, wd=0.0001)
- batch_size=128, epochs=30, seed=42

## Test Results
- Accuracy:  0.9419
- Precision: 0.9771
- Recall:    0.9545
- F1:        0.9657
- AUC:       0.9791

## Confusion Matrix
|           | Pred Benign | Pred Malware |
|-----------|------------|-------------|
| Actual Benign  | 431 | 66 |
| Actual Malware | 134 | 2813 |

## Parameters
- Parameter count: 3,538
- Model size (float32): 0.01 MB
- Best epoch: 29
- Best val F1: 0.9708
