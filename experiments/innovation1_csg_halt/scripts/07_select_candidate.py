import json
import sys
from pathlib import Path

import pandas as pd


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import RESULTS_DIR, ensure_dir, load_json, write_json


OUTPUT_DIR = RESULTS_DIR / "final_selection"
LIMITS = {"BRAM_18K": 280, "DSP48E": 220, "FF": 106400, "LUT": 53200}


def main():
    ensure_dir(OUTPUT_DIR)
    generated = pd.read_csv(RESULTS_DIR / "hls_generation" / "generated_variants.csv")
    references = pd.read_csv(RESULTS_DIR / "hls_generation" / "reference_logits_summary.csv")
    csim = pd.read_csv(RESULTS_DIR / "hls_csim" / "csim_results.csv")
    csynth = pd.read_csv(RESULTS_DIR / "hls_csynth" / "csynth_results.csv")
    active_eval = pd.read_csv(
        RESULTS_DIR / "active_channel_selection" / "active_channel_eval.csv"
    )
    if "active_87p5" not in set(active_eval["candidate"]):
        raise RuntimeError("Stage 4 active_87p5 evaluation is missing")
    thresholds = load_json(RESULTS_DIR / "pytorch_calibration" / "thresholds.json")
    threshold_id = thresholds.get("best_config_id")
    threshold = thresholds.get("thresholds", {}).get(threshold_id, {})

    frame = generated.merge(references, on="variant", how="left")
    frame = frame.merge(csim, on="variant", how="left", suffixes=("", "_csim"))
    frame = frame.merge(csynth, on="variant", how="left", suffixes=("", "_csynth"))
    frame["threshold_method"] = threshold.get("method")
    frame["BRAM_util_pct"] = 100.0 * frame["BRAM_18K"] / LIMITS["BRAM_18K"]
    frame["DSP_util_pct"] = 100.0 * frame["DSP48E"] / LIMITS["DSP48E"]
    frame["FF_util_pct"] = 100.0 * frame["FF"] / LIMITS["FF"]
    frame["LUT_util_pct"] = 100.0 * frame["LUT"] / LIMITS["LUT"]
    frame["recommended_for_export_ip"] = (
        frame["csim_status"].eq("PASS")
        & frame["csynth_status"].eq("PASS")
        & frame["BRAM_18K"].le(LIMITS["BRAM_18K"])
        & frame["DSP48E"].le(LIMITS["DSP48E"])
        & frame["FF"].le(LIMITS["FF"])
        & frame["LUT"].le(LIMITS["LUT"])
        & frame["f1_delta_vs_original"].ge(-0.01)
        & frame["prediction_match_rate_vs_original"].ge(0.99)
        & frame["prediction_flip_count"].eq(0)
        & (frame["timing_met"].fillna(False) | frame["estimated_clock_ns"].le(10.0))
    )
    requested = [
        "variant", "active_ratio", "active_q_channels", "active_k_channels",
        "threshold_method", "fixed_point_mode", "feature_map_mode", "scheduling_mode",
        "csim_status", "csynth_status", "max_abs_error_hls_vs_reference",
        "prediction_flip_count", "prediction_match_rate_hls_vs_reference",
        "accuracy", "precision", "recall", "f1",
        "f1_delta_vs_original", "prediction_match_rate_vs_original", "latency_max",
        "interval_max", "estimated_clock_ns", "BRAM_18K", "DSP48E", "FF", "LUT",
        "BRAM_util_pct", "DSP_util_pct", "FF_util_pct", "LUT_util_pct",
        "pynq_resource_fit", "recommended_for_export_ip",
    ]
    comparison = frame.loc[:, requested]
    comparison.to_csv(OUTPUT_DIR / "final_comparison_table.csv", index=False)
    eligible = comparison[comparison["recommended_for_export_ip"]].copy()
    if not eligible.empty:
        eligible["resource_score"] = (
            eligible["DSP_util_pct"] + eligible["LUT_util_pct"]
            + eligible["BRAM_util_pct"] + eligible["FF_util_pct"]
        )
        eligible = eligible.sort_values(
            ["f1", "prediction_match_rate_vs_original", "resource_score", "latency_max"],
            ascending=[False, False, True, True],
        )
        selected = json.loads(eligible.iloc[0].to_json())
        status = "candidate_selected"
    else:
        selected = None
        status = "no_candidate_meets_all_constraints"
    write_json(
        OUTPUT_DIR / "selected_candidate.json",
        {"status": status, "selected_candidate": selected, "selection_limits": LIMITS},
    )

    baseline = comparison.loc[comparison["variant"] == "v00_float_reference"]
    baseline_reason = (
        "The copied float reference remains above PYNQ-Z2 limits."
        if baseline.empty or not bool(baseline.iloc[0].get("pynq_resource_fit", False))
        else "The copied float reference fits in this run; compare against the protected baseline report."
    )
    successful = comparison.loc[comparison["csynth_status"] == "PASS"].copy()
    lowest_resource = None
    lowest_latency = None
    if not successful.empty:
        successful["resource_score"] = (
            successful["BRAM_util_pct"] + successful["DSP_util_pct"]
            + successful["FF_util_pct"] + successful["LUT_util_pct"]
        )
        lowest_resource = successful.sort_values("resource_score").iloc[0]["variant"]
        lowest_latency = successful.sort_values("latency_max").iloc[0]["variant"]

    def variant_line(name):
        row = comparison.loc[comparison["variant"] == name]
        if row.empty:
            return f"- `{name}`: no result"
        row = row.iloc[0]
        return (
            f"- `{name}`: latency={row['latency_max']}, BRAM={row['BRAM_18K']}, "
            f"DSP={row['DSP48E']}, FF={row['FF']}, LUT={row['LUT']}, "
            f"resource_fit={row['pynq_resource_fit']}"
        )

    def delta_line(source_name, target_name):
        source = comparison.loc[comparison["variant"] == source_name].iloc[0]
        target = comparison.loc[comparison["variant"] == target_name].iloc[0]
        return (
            f"- `{source_name}` -> `{target_name}`: "
            f"latency {int(target['latency_max'] - source['latency_max']):+d}, "
            f"BRAM {int(target['BRAM_18K'] - source['BRAM_18K']):+d}, "
            f"DSP {int(target['DSP48E'] - source['DSP48E']):+d}, "
            f"FF {int(target['FF'] - source['FF']):+d}, "
            f"LUT {int(target['LUT'] - source['LUT']):+d}."
        )

    summary = f"""# CSG-HALT Final Candidate Selection

- Selection status: **{status}**
- Selected candidate: `{selected['variant'] if selected else None}`
- Float baseline: {baseline_reason}
- Lowest aggregate resource usage: `{lowest_resource}`
- Lowest latency: `{lowest_latency}`

## Measured Results

{variant_line('v00_float_reference')}
{variant_line('v01_static_sparse_87p5_float')}
{variant_line('v02_sparse_87p5_mixed_fixed')}
{variant_line('v03_full_csg_halt')}

## Incremental Effects

{delta_line('v00_float_reference', 'v01_static_sparse_87p5_float')}
{delta_line('v01_static_sparse_87p5_float', 'v02_sparse_87p5_mixed_fixed')}
{delta_line('v02_sparse_87p5_mixed_fixed', 'v03_full_csg_halt')}

## Interpretation

- `v00` is the copied float reference and cannot be deployed if it exceeds PYNQ-Z2 limits.
- `v01` isolates the hardware effect of active_87p5 static sparse Linear Attention.
- `v02` adds mixed fixed-point specialization. Its CSIM difference is fixed-point numerical
  error, with prediction flip count zero.
- `v03` is the full current CSG-HALT path: static sparse attention, mixed fixed-point,
  feature-map approximation, and resource-aware scheduling. Its prediction flip count is zero.
- `active_87p5` resource benefit is accepted only when its CSYNTH report shows an actual
  reduction; loop-bound source changes alone are not counted as a hardware result.
- v01 lowers latency, BRAM, and FF slightly, but leaves DSP unchanged and increases LUT. Thus
  active_87p5 alone is functionally valid but insufficient for PYNQ-Z2 resource fit.
- v02 has the lowest latency and lower BRAM, but current mixed fixed-point increases DSP, FF,
  and LUT substantially. It is not a resource reduction in this implementation.
- v03 increases latency, DSP, FF, and LUT relative to v02 while BRAM remains unchanged. The
  current full scheduling/PWL combination therefore does not improve hardware cost.

If no candidate meets every constraint, the next iteration should test `active_75` or
`active_62p5`, use more aggressive mixed fixed-point, simplify the feature-map approximation,
limit multiplier allocation, remove unnecessary array partitioning, and optimize numerator,
denominator, and output-projection loops. Export IP / Vivado is recommended only when
`recommended_for_export_ip` is true; neither step is run here.
"""
    (OUTPUT_DIR / "final_selection_summary.md").write_text(summary, encoding="utf-8")
    print(status, selected["variant"] if selected else None)


if __name__ == "__main__":
    main()
