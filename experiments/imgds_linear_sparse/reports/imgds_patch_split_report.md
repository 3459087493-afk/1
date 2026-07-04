# IMG_DS Patch Split Report

## Configuration
- resize_size: 32
- patch_size: 8
- seq_len: 16
- input_dim: 64
- color_mode: grayscale

## Dataset Shapes
- X_train: (12053, 16, 64)
- X_val:   (1722, 16, 64)
- X_test:  (3444, 16, 64)
- y_train: (12053,)
- y_val:   (1722,)
- y_test:  (3444,)

## Class Distribution
| Split | Benign | Malware | Total |
|-------|--------|---------|-------|
| Train | 1740 | 10313 | 12053 |
| Val   | 249 | 1473 | 1722 |
| Test  | 497 | 2947 | 3444 |

## Why 32×32 grayscale for Stage 1?
1. Lower computational cost for rapid baseline iteration.
2. Single channel (grayscale) reduces input dimension by 3x vs RGB.
3. Smaller input allows faster training and ONNX export validation.
4. Later stages can expand to 64×64 or 128×128 grayscale or RGB.

## Future Extensions
- 64×64 grayscale: seq_len=64 (with patch_size=8) or seq_len=16 (with patch_size=16)
- 128×128 RGB: keep patch_size=8, seq_len=256, input_dim=192
