# Stage 9 Active-Ratio Sweep

- Dataset: `/home/cym/prj2/finn/notebooks/icl_thesis-master/data/unsw_nb15_raw/UNSW_NB15_testing-set.csv`
- Scope: full official test set (82332 samples)
- Preprocessor: saved training-split-only fit, transform only
- Original test F1: 0.878171
- This is software test-set evaluation, not final PYNQ board accuracy.
- Recommended ratio for second-round HLS: `None`

| Candidate | Accuracy | F1 | F1 delta | Prediction match | Near-zero denom. | Pass |
|---|---:|---:|---:|---:|---:|---:|
| active_87p5 | 0.849184 | 0.878843 | +0.000672 | 0.997182 | 0 | True |
| active_75 | 0.855633 | 0.883136 | +0.004965 | 0.987550 | 0 | False |
| active_62p5 | 0.859338 | 0.885397 | +0.007225 | 0.979765 | 0 | False |
| active_50 | 0.864646 | 0.888535 | +0.010364 | 0.966416 | 0 | False |
| active_37p5 | 0.849925 | 0.878517 | +0.000346 | 0.980506 | 0 | False |

The quality gate requires prediction match >= 0.99, F1 drop <= 0.01, and no near-zero
denominator. If no candidate below active_87p5 passes, second-round HLS generation must stop.
