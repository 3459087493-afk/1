import json
import re
import sys
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import BASELINE_HLS, BASELINE_RESULTS, RESULTS_DIR, ensure_dir, load_json, write_json


OUTPUT_DIR = RESULTS_DIR / "bottleneck_profile"
METRICS_PATH = BASELINE_RESULTS / "hls" / "csynth" / "csynth_metrics.json"
CSYNTH_LOG = BASELINE_RESULTS / "hls" / "csynth" / "hls_csynth_output.txt"


def main():
    ensure_dir(OUTPUT_DIR)
    metrics = load_json(METRICS_PATH)
    source = (BASELINE_HLS / "src" / "unsw_linear_transformer.cpp").read_text(encoding="utf-8")
    log_text = CSYNTH_LOG.read_text(encoding="utf-8", errors="replace")
    warning_count = len(re.findall(r"WARNING:", log_text))
    ii_violation_count = len(re.findall(r"II Violation", log_text))
    operator_counts = {
        "exp_calls_in_source": source.count("std::exp"),
        "sqrt_calls_in_source": source.count("std::sqrt"),
        "division_expressions_in_source": source.count(" / "),
        "vitis_warning_count": warning_count,
        "ii_violation_count": ii_violation_count,
    }
    profile = {
        "latency_max_cycles": metrics["latency_max_cycles"],
        "interval_max_cycles": metrics["interval_max_cycles"],
        "estimated_clock_period_ns": metrics["estimated_clock_period_ns"],
        "BRAM_18K": metrics["BRAM_18K"],
        "DSP48E": metrics["DSP48E"],
        "FF": metrics["FF"],
        "LUT": metrics["LUT"],
        "resource_utilization": metrics["resource_utilization"],
        "dsp_over_limit": metrics["DSP48E"] > 220,
        "lut_over_limit": metrics["LUT"] > 53200,
        "operator_and_schedule_signals": operator_counts,
    }
    write_json(OUTPUT_DIR / "bottleneck_profile.json", profile)

    markdown = f"""# Float HLS Baseline Bottleneck Profile

## Measured Baseline

| Metric | Value |
|---|---:|
| Latency max | {metrics['latency_max_cycles']} cycles |
| Interval max | {metrics['interval_max_cycles']} cycles |
| Estimated clock | {metrics['estimated_clock_period_ns']} ns |
| BRAM_18K | {metrics['BRAM_18K']} / 280 ({metrics['resource_utilization']['BRAM_18K']['utilization_percent']:.2f}%) |
| DSP48E | {metrics['DSP48E']} / 220 ({metrics['resource_utilization']['DSP48E']['utilization_percent']:.2f}%) |
| FF | {metrics['FF']} / 106400 ({metrics['resource_utilization']['FF']['utilization_percent']:.2f}%) |
| LUT | {metrics['LUT']} / 53200 ({metrics['resource_utilization']['LUT']['utilization_percent']:.2f}%) |

The float baseline is functionally correct and meets the 10 ns target, but DSP and LUT
exceed PYNQ-Z2 capacity. It must not proceed directly to Vivado or board evaluation.

## Likely Hardware Bottlenecks

1. Dense Q/K/V projections replicate floating-point multiply/add operators.
2. The `ELU+1` feature map requires floating-point exponential hardware.
3. `K^T V` and the numerator perform dense Linear Attention accumulations.
4. The denominator combines dense Q/K channels and floating-point division.
5. The attention output projection and classifier retain dense floating-point paths.
6. Automatic loop unrolling and array partitioning replicate operators aggressively.
7. The log contains {ii_violation_count} II-violation messages and {warning_count} warnings,
   showing memory-port/dependence pressure in addition to resource overuse.

## Innovation-1 Direction

The next step is calibration-guided sparse Linear Attention hardware generation, not
immediate Vivado integration. Dynamic event gates are used only to discover important
`phi(Q)`/`phi(K)` channels; the later HLS kernel will use static active-channel loop bounds.
"""
    (OUTPUT_DIR / "bottleneck_profile.md").write_text(markdown, encoding="utf-8")

    partition = """# PS/PL Task Partition Plan

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
"""
    (OUTPUT_DIR / "ps_pl_partition_plan.md").write_text(partition, encoding="utf-8")
    print(json.dumps(profile, indent=2))
    print("Profile:", OUTPUT_DIR / "bottleneck_profile.md")
    print("PS/PL plan:", OUTPUT_DIR / "ps_pl_partition_plan.md")


if __name__ == "__main__":
    main()
