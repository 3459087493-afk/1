# Calibration-Guided Active-Channel Selection

- Dynamic calibration source: `dt_21_homeostatic_0p99`
- Evaluated samples: 256
- Passing static sets: 3
- Passing sparse static sets: 2
- Selected HLS candidate: `active_87p5`

| Candidate | Accuracy | Precision | Recall | F1 | F1 delta | Pred. match | Q active | K active | Pass |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| active_100 | 0.609375 | 0.115044 | 1.000000 | 0.206349 | 0.000000 | 1.000000 | 1.000 | 1.000 | True |
| active_93p75 | 0.609375 | 0.115044 | 1.000000 | 0.206349 | 0.000000 | 1.000000 | 0.938 | 0.938 | True |
| active_87p5 | 0.609375 | 0.115044 | 1.000000 | 0.206349 | 0.000000 | 1.000000 | 0.875 | 0.875 | True |
| active_81p25 | 0.621094 | 0.118182 | 1.000000 | 0.211382 | 0.005033 | 0.988281 | 0.812 | 0.812 | False |
| active_75 | 0.636719 | 0.122642 | 1.000000 | 0.218487 | 0.012138 | 0.972656 | 0.750 | 0.750 | False |
| active_62p5 | 0.664062 | 0.131313 | 1.000000 | 0.232143 | 0.025794 | 0.945312 | 0.625 | 0.625 | False |
| active_50 | 0.679688 | 0.129032 | 0.923077 | 0.226415 | 0.020066 | 0.921875 | 0.500 | 0.500 | False |
| active_37p5 | 0.640625 | 0.123810 | 1.000000 | 0.220339 | 0.013990 | 0.968750 | 0.375 | 0.375 | False |
| active_25 | 0.597656 | 0.112069 | 1.000000 | 0.201550 | -0.004799 | 0.988281 | 0.250 | 0.250 | False |

The selected Q/K indices are static hardware-generation metadata. A future sparse HLS
variant must reduce active loop bounds; multiplying a full 16-channel loop by a mask would
not count as sparse hardware generation.

Selected Q channels: `[0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15]`

Selected K channels: `[0, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15]`
