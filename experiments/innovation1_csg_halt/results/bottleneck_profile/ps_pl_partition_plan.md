# PS/PL Task Partition Plan

This design borrows the edge-deployment system partitioning idea from ViT4Mal without
copying its image model.

## Processing System (PS)

- Read UNSW-NB15 CSV files or `sample_inputs.npy`.
- Apply the saved OneHotEncoder, median imputation, StandardScaler, padding, and reshape.
- Schedule samples and transfer `[8, 24]` tensors to the accelerator.
- Receive two logits and apply argmax.
- Calculate binary anomaly-detection Accuracy, Precision, Recall, F1, and Confusion Matrix.
- Interpret `label=0` as normal and `label=1` as anomaly/attack.

## Programmable Logic (PL)

- Deploy only the Linear Transformer inference core.
- Fixed input shape: `[8, 24]`.
- Fixed output shape: `[2]` logits.
- No CSV parsing, sklearn preprocessing, sample scheduling, or metric calculation in PL.

## Relation to ViT4Mal

ViT4Mal partitions an edge image-malware Transformer system. CSG-HALT transfers that
system-level principle to UNSW-NB15 tabular network anomaly detection, while the optimized
hardware object is a softmax-free Linear Attention kernel rather than a ViT encoder.
