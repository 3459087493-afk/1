import json
import sys
from pathlib import Path

import pandas as pd


STAGE9_ROOT = Path(__file__).resolve().parents[1]
EXP_ROOT = STAGE9_ROOT.parent
RESULTS_DIR = STAGE9_ROOT / "results" / "diagnosis"
CSYNTH_DIR = EXP_ROOT / "results" / "hls_csynth"
VARIANTS_DIR = EXP_ROOT / "hls_variants"
LIMITS = {"BRAM_18K": 280, "DSP48E": 220, "FF": 106400, "LUT": 53200}


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2), encoding="utf-8")


def delta(source, target):
    fields = ("latency_max", "BRAM_18K", "DSP48E", "FF", "LUT")
    return {field: int(target[field] - source[field]) for field in fields}


def source_signals(variant):
    cpp = (VARIANTS_DIR / variant / "src" / "unsw_linear_transformer.cpp").read_text()
    header = (VARIANTS_DIR / variant / "src" / "unsw_linear_transformer.h").read_text()
    return {
        "active_index_references": cpp.count("ACTIVE_K_CHANNELS") + cpp.count("Q_ACTIVE_MASK"),
        "float_mentions": cpp.count("float"),
        "fixed_mentions": cpp.count("data_t") + cpp.count("attn_acc_t") + cpp.count("acc_t"),
        "pipeline_pragmas": cpp.count("#pragma HLS PIPELINE"),
        "unroll_pragmas": cpp.count("#pragma HLS UNROLL"),
        "array_partition_pragmas": cpp.count("#pragma HLS ARRAY_PARTITION"),
        "allocation_pragmas": cpp.count("#pragma HLS ALLOCATION"),
        "ap_fixed_typedefs": header.count("typedef ap_fixed"),
    }


def main():
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    frame = pd.read_csv(CSYNTH_DIR / "csynth_results.csv").set_index("variant")
    expected = [
        "v00_float_reference",
        "v01_static_sparse_87p5_float",
        "v02_sparse_87p5_mixed_fixed",
        "v03_full_csg_halt",
    ]
    missing = [name for name in expected if name not in frame.index]
    if missing:
        raise RuntimeError(f"Missing CSYNTH results: {missing}")
    rows = {name: frame.loc[name].to_dict() for name in expected}
    deltas = {
        "v00_to_v01": delta(rows[expected[0]], rows[expected[1]]),
        "v01_to_v02": delta(rows[expected[1]], rows[expected[2]]),
        "v02_to_v03": delta(rows[expected[2]], rows[expected[3]]),
    }
    signals = {name: source_signals(name) for name in expected}
    report_data = {
        "board": "PYNQ-Z2",
        "limits": LIMITS,
        "variants": rows,
        "incremental_deltas": deltas,
        "source_signals": signals,
        "diagnosis": {
            "v00_to_v01": (
                "Active 87.5% is conservative; projections remain dense, while compile-time "
                "channel-index selection and compact staging add control/mux LUT cost."
            ),
            "v01_to_v02": (
                "Mixed float/ap_fixed boundaries, 24-bit attention accumulators, conversion "
                "logic, and operator replication reduce latency but increase DSP/LUT/FF."
            ),
            "v02_to_v03": (
                "PWL and current scheduling do not target dense projections/output paths; "
                "allocation/pipeline directives add or retain parallel hardware."
            ),
        },
        "next_priorities": [
            "Evaluate active_75, active_62p5, active_50 in PyTorch first",
            "Use compile-time compact active arrays without runtime ACTIVE_IDX muxing",
            "Use consistent fixed point inside inner loops and convert only at top boundaries",
            "Limit multiplier allocation and avoid maximum parallelism",
            "Generate HLS only for a ratio that passes the quality gate",
        ],
    }
    write_json(RESULTS_DIR / "stage9_resource_diagnosis.json", report_data)

    table_rows = []
    for name in expected:
        row = rows[name]
        table_rows.append(
            f"| {name} | {int(row['latency_max'])} | {int(row['BRAM_18K'])} | "
            f"{int(row['DSP48E'])} | {int(row['FF'])} | {int(row['LUT'])} | "
            f"{bool(row['pynq_resource_fit'])} |"
        )
    d01, d12, d23 = deltas["v00_to_v01"], deltas["v01_to_v02"], deltas["v02_to_v03"]
    report = f"""# Stage 9 Resource Failure Diagnosis

## Total Resource Comparison

| Variant | Latency max | BRAM | DSP | FF | LUT | PYNQ-Z2 fit |
|---|---:|---:|---:|---:|---:|---:|
{chr(10).join(table_rows)}

PYNQ-Z2 limits are BRAM={LIMITS['BRAM_18K']}, DSP={LIMITS['DSP48E']},
FF={LIMITS['FF']}, and LUT={LIMITS['LUT']}. No current variant fits.

## v00 to v01: Static Sparse 87.5%

- Delta: latency {d01['latency_max']:+d}, BRAM {d01['BRAM_18K']:+d}, DSP
  {d01['DSP48E']:+d}, FF {d01['FF']:+d}, LUT {d01['LUT']:+d}.
- Latency, BRAM, and FF decrease slightly; DSP is unchanged and LUT increases.
- Likely causes: active_87p5 is conservative, Q/K/V projections remain dense, and active
  channel index/control staging adds LUT muxing. This is an evidence-based hypothesis, not a
  post-route attribution.

## v01 to v02: Mixed Fixed Point

- Delta: latency {d12['latency_max']:+d}, BRAM {d12['BRAM_18K']:+d}, DSP
  {d12['DSP48E']:+d}, FF {d12['FF']:+d}, LUT {d12['LUT']:+d}.
- Latency and BRAM decrease, but DSP, LUT, and FF increase substantially.
- Likely causes: repeated float/ap_fixed conversion boundaries, 24-bit fixed multipliers and
  accumulators, operator replication, and pipeline scheduling. Merely introducing ap_fixed
  does not guarantee fewer DSPs.

## v02 to v03: Current Full Method

- Delta: latency {d23['latency_max']:+d}, BRAM {d23['BRAM_18K']:+d}, DSP
  {d23['DSP48E']:+d}, FF {d23['FF']:+d}, LUT {d23['LUT']:+d}.
- The current full method does not save resources. PWL feature-map approximation does not
  address dense projection/output bottlenecks, and scheduling pragmas may retain or create
  more parallel hardware.

## Source Locations to Inspect

1. Q projection and K projection: dense `UNSW_D_MODEL x UNSW_D_MODEL` products.
2. V projection: remains full-dimensional by design.
3. `elu_plus_one` / PWL feature map.
4. `key_value`, numerator, and denominator active reductions.
5. Attention output projection and classifier.
6. Float/fixed conversion at sparse arrays and attention output.
7. ARRAY_PARTITION, PIPELINE, UNROLL, and multiplier ALLOCATION pragmas.

## Second-Round Priorities

- Evaluate active_75, active_62p5, active_50 (and exploratory active_37p5) before HLS.
- Generate compile-time compact arrays instead of runtime ACTIVE_IDX selection.
- Keep inner arithmetic consistently fixed; pre-convert weights and convert only at top I/O.
- Limit multiplier allocation and schedule for DSP/LUT constraints rather than maximum unroll.
- Generate second-round HLS only when the official-test PyTorch quality gate passes.
"""
    (RESULTS_DIR / "stage9_resource_diagnosis.md").write_text(report, encoding="utf-8")
    print("Diagnosis:", RESULTS_DIR / "stage9_resource_diagnosis.md")


if __name__ == "__main__":
    main()
