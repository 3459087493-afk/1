import re
import sys
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import EXP_ROOT, RESULTS_DIR, ensure_dir, write_json


BASELINE_COPY = EXP_ROOT / "copied_baseline" / "unsw_linear_transformer_hls_float_copy"
OUTPUT_DIR = RESULTS_DIR / "hls_generation"
REQUIRED_FILES = (
    "unsw_linear_transformer.cpp",
    "unsw_linear_transformer.h",
    "weights.h",
    "testbench.cpp",
    "test_vectors.h",
    "run_csim.tcl",
    "run_csynth.tcl",
)


def locate(name):
    matches = sorted(BASELINE_COPY.rglob(name))
    if len(matches) != 1:
        raise RuntimeError(f"Expected one {name}, found {len(matches)}: {matches}")
    return matches[0]


def find_line(lines, pattern):
    regex = re.compile(pattern)
    for number, line in enumerate(lines, start=1):
        if regex.search(line):
            return number, line.strip()
    return None


def location(lines, start_pattern, end_pattern=None):
    start = find_line(lines, start_pattern)
    if start is None:
        return None
    if end_pattern is None:
        return {"start_line": start[0], "end_line": start[0], "source": start[1]}
    end = None
    for number, line in enumerate(lines[start[0] :], start=start[0] + 1):
        if re.search(end_pattern, line):
            end = (number, line.strip())
            break
    return {
        "start_line": start[0],
        "end_line": end[0] if end else start[0],
        "source": start[1],
    }


def define_value(header, name):
    match = re.search(rf"^\s*#define\s+{re.escape(name)}\s+(\d+)\s*$", header, re.MULTILINE)
    return int(match.group(1)) if match else None


def main():
    ensure_dir(OUTPUT_DIR)
    files = {name: locate(name) for name in REQUIRED_FILES}
    source = files["unsw_linear_transformer.cpp"].read_text(encoding="utf-8")
    header = files["unsw_linear_transformer.h"].read_text(encoding="utf-8")
    lines = source.splitlines()

    top_match = re.search(r"\bvoid\s+(\w+)\s*\(\s*float\s+input", source)
    top_function = top_match.group(1) if top_match else None
    locations = {
        "q_projection_location": location(lines, r"float query\[", r"query\[sequence\]\[output_feature\]"),
        "k_projection_location": location(lines, r"float key\[", r"key\[sequence\]\[output_feature\]"),
        "v_projection_location": location(lines, r"float value\[", r"value\[sequence\]\[output_feature\]"),
        "feature_map_location": location(lines, r"static float elu_plus_one", r"^}"),
        "key_value_location": location(lines, r"float key_value\[", r"key_value\[key_feature\]\[value_feature\]"),
        "denominator_location": location(lines, r"float denominator =", r"denominator = 1\.0e-6f"),
        "numerator_location": location(lines, r"float numerator =", r"attention\[sequence\]\[value_feature\]"),
        "output_projection_location": location(lines, r"float attention_output\[", r"residual1\[sequence\]\[output_feature\]"),
        "classifier_location": location(lines, r"for \(int output_class", r"logits\[output_class\]"),
    }
    required_locations = (
        "q_projection_location",
        "k_projection_location",
        "v_projection_location",
        "feature_map_location",
        "key_value_location",
        "denominator_location",
        "numerator_location",
        "output_projection_location",
        "classifier_location",
    )
    dimensions = {
        "seq_len": define_value(header, "UNSW_SEQ_LEN"),
        "input_dim": define_value(header, "UNSW_INPUT_DIM"),
        "attention_dim": define_value(header, "UNSW_D_MODEL"),
    }
    safe = bool(
        top_function
        and all(value is not None for value in dimensions.values())
        and all(locations[name] is not None for name in required_locations)
    )
    candidate_loops = [
        {
            "name": "key_value_key_feature",
            "original_bound": "UNSW_D_MODEL",
            "candidate_bound": "UNSW_ACTIVE_DIM",
            "safe": True,
        },
        {
            "name": "key_sum_feature",
            "original_bound": "UNSW_D_MODEL",
            "candidate_bound": "UNSW_ACTIVE_DIM",
            "safe": True,
        },
        {
            "name": "denominator_feature",
            "original_bound": "UNSW_D_MODEL",
            "candidate_bound": "UNSW_ACTIVE_DIM",
            "safe": True,
        },
        {
            "name": "numerator_key_feature",
            "original_bound": "UNSW_D_MODEL",
            "candidate_bound": "UNSW_ACTIVE_DIM",
            "safe": True,
        },
        {
            "name": "q_k_v_projection_output_feature",
            "original_bound": "UNSW_D_MODEL",
            "candidate_bound": None,
            "safe": False,
            "reason": "Keep weight layout and full V/output dimensions unchanged in v01.",
        },
    ]
    document = {
        "top_function": top_function,
        "source_files": {name: str(path) for name, path in files.items()},
        "attention_dim": dimensions["attention_dim"],
        "active_dim": 14,
        "seq_len": dimensions["seq_len"],
        "input_dim": dimensions["input_dim"],
        "input_shape": [dimensions["seq_len"], dimensions["input_dim"]],
        "output_shape": [2],
        "candidate_loops": candidate_loops,
        **locations,
        "safe_to_generate_variants": safe,
    }
    write_json(OUTPUT_DIR / "hls_source_map.json", document)

    def loc_text(name):
        value = locations[name]
        return "not found" if value is None else f"lines {value['start_line']}-{value['end_line']}"

    missing = [name for name in required_locations if locations[name] is None]
    report = f"""# HLS Linear Attention Source Map

- Baseline copy: `{BASELINE_COPY}`
- Top function: `{top_function}`
- Input shape: `[{dimensions['seq_len']}, {dimensions['input_dim']}]`
- Output shape: `[2]`
- Sequence length: `{dimensions['seq_len']}`
- Block/input dimension: `{dimensions['input_dim']}`
- Attention dimension: `{dimensions['attention_dim']}`
- Planned active dimension: `14`
- Safe to generate variants: **{str(safe).lower()}**

## Located Operations

| Operation | Actual source location |
|---|---|
| Q projection | {loc_text('q_projection_location')} |
| K projection | {loc_text('k_projection_location')} |
| V projection | {loc_text('v_projection_location')} |
| ELU+1 feature map | {loc_text('feature_map_location')} |
| K^T V accumulation | {loc_text('key_value_location')} |
| denominator | {loc_text('denominator_location')} |
| numerator | {loc_text('numerator_location')} |
| output projection | {loc_text('output_projection_location')} |
| classifier | {loc_text('classifier_location')} |

## v01 Safe Scope

The compact dimension may replace the `key_feature`/feature reductions in `key_value`,
`key_sum`, denominator, and numerator. Q/K/V projections remain 16-dimensional in v01,
as do V, attention output, residual, normalization, feed-forward, and classifier paths.

Q and K have different selected index sets. The generated compact loop therefore uses the
K index list as its physical dimension and sets compact Q entries to zero when that same
channel is absent from the Q set. It must not pair unrelated Q and K indices by list position.

## Risk Notes

- Static sparse arithmetic must match independent Q/K masks from Stage 4.
- Projection pruning is deferred because it changes weight addressing and is not required
  to demonstrate sparse attention accumulation.
- Mixed fixed-point and feature-map approximation require variant-specific reference logits.
- HLS resource improvement is unknown until CSIM PASS variants complete CSYNTH.
- Missing required markers: `{missing}`
"""
    (OUTPUT_DIR / "hls_source_map.md").write_text(report, encoding="utf-8")
    print("Source map:", OUTPUT_DIR / "hls_source_map.md")
    print("safe_to_generate_variants:", safe)
    if not safe:
        raise SystemExit(2)


if __name__ == "__main__":
    main()
