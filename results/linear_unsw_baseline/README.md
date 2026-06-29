# UNSW-NB15 Linear Transformer Baseline

- Data: `UNSW_NB15_training-set.csv` for train/validation and `UNSW_NB15_testing-set.csv` for final testing.
- Split: 85% train and 15% validation from the training CSV, stratified by `label`.
- Preprocessing: train-only median imputation plus StandardScaler for numeric features;
  train-only constant imputation plus OneHotEncoder for categorical features.
- Input: `192` encoded features, padded to `192` and reshaped to
  `[batch, 8, 24]`.
- Model: one kernelized Linear Transformer encoder block with `d_model=16`
  and a two-logit classifier.
- Best validation epoch: `20`.
- Test accuracy: `0.848066`.
- Test precision: `0.786189`.
- Test recall: `0.994529`.
- Test F1: `0.878171`.

The saved preprocessor, model configuration, and conversion samples are the starting point
for a later model-conversion experiment. No conversion or hardware build is performed here.
