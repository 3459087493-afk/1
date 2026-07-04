# Experiment 2 status

## Verdict: PARTIAL_READY_TO_WRITE

The underlying evidence is already present and does not require another HLS/Vivado/PYNQ run. QKS-v2 source physically reduces Q/K attention dimension and uses direct reduced loop bounds; csynth cycles and measured PYNQ kernel latency both decrease monotonically while accuracy remains stable. This is enough to write the sparse-effectiveness experiment.

What is missing is the dedicated Experiment 2 package requested by the thesis structure: mechanism table, consolidated summary, MAC table, figures and formal report. The target directory `results/qks_v2_experiment2_sparsity_effectiveness/` is absent.

The experiment must distinguish kernel evidence from full-application timing. Full-application means are not monotonic because roughly 65% is JPEG decoding and host preprocessing; this does not negate the monotonic PL-kernel result. The preliminary 500× comparison is irrelevant to proving sparsity effectiveness and should not appear as main evidence.
