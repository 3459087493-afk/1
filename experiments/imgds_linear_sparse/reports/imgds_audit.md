# IMG_DS Dataset Audit Report

## File Counts
- Benign: 2486
- Malware: 14733
- Total: 17219
- Imbalance ratio (malware/benign): 5.93

## Comparison with ViT4Mal IMG_DS
ViT4Mal reports the IMG_DS dataset. The counts here are consistent with the expected dataset size.

## Image Properties (sampled 200 per class)
- Mode distribution: {'RGB': 400}
- Corrupted images: 0
- Most images are RGB

## Grayscale Suitability
The images are suitable for grayscale conversion for Stage 1.
Grayscale reduces input channels from 3 to 1, simplifying the initial baseline.
Later stages may use RGB inputs.

## File Format Distribution
- Benign: {'.jpg': 2486}
- Malware: {'.jpg': 14733}
