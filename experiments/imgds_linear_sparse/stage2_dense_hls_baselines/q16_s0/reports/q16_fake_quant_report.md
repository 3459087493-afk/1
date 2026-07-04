# Q16-S0 Fake Quantization Report

## Configuration
- data_type: ap_fixed<16,6>
- range: [-32.0, 31.9990]
- step: 0.000977
- total_bits=16, int_bits=6, frac_bits=10

## Weight-Only Fake Quant Results
- prediction_match_rate vs Q32: 0.995000
- max_logit_error: 0.059360
- mean_logit_error: 0.014068

## Q16 Metrics (weight-only)
- Accuracy:  95.5000%
- Precision: 97.5904%
- Recall:    97.0060%
- F1:        97.2973%
- AUC:       95.8265%

## Pass Criteria
- prediction_match_rate >= 0.99: PASS
