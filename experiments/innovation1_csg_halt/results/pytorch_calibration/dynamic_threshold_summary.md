# Dynamic-Threshold Spike-Gate Calibration

- Samples: 256
- Task: UNSW-NB15 binary anomaly detection (`0=normal`, `1=anomaly/attack`)
- Original F1 on calibration samples: 0.206349
- No-gate wrapper maximum error: 0
- Tested configurations: 29
- Passing configurations: 5
- Best configuration: `dt_21_homeostatic_0p99`

| Config | F1 | F1 delta | Prediction match | Q active | K active | Pass |
|---|---:|---:|---:|---:|---:|---:|
| dt_21_homeostatic_0p99 | 0.203125 | -0.003224 | 0.992188 | 0.9895 | 0.9901 | True |
| dt_04_percentile_1 | 0.206349 | 0.000000 | 1.000000 | 0.9900 | 0.9900 | True |
| dt_03_percentile_0p5 | 0.206349 | 0.000000 | 1.000000 | 0.9950 | 0.9949 | True |
| dt_02_percentile_0p25 | 0.206349 | 0.000000 | 1.000000 | 0.9975 | 0.9974 | True |
| dt_01_percentile_0p1 | 0.206349 | 0.000000 | 1.000000 | 0.9989 | 0.9990 | True |
| dt_20_dynamic_mad_1p5 | 0.289855 | 0.083506 | 0.738281 | 0.1036 | 0.1049 | False |
| dt_19_dynamic_mad_1p25 | 0.310345 | 0.103996 | 0.734375 | 0.1431 | 0.1620 | False |
| dt_18_dynamic_mad_1p0 | 0.338983 | 0.132634 | 0.738281 | 0.1808 | 0.2220 | False |
| dt_17_dynamic_mad_0p75 | 0.301370 | 0.095021 | 0.792969 | 0.2467 | 0.2906 | False |
| dt_16_dynamic_mad_0p5 | 0.244444 | 0.038095 | 0.804688 | 0.3576 | 0.3615 | False |

The spike-inspired gate is a calibration instrument, not the final HLS implementation.
Only a passing configuration may be used to derive static active-channel sets. The gate
does not remove softmax because this Linear Attention model has no softmax.
