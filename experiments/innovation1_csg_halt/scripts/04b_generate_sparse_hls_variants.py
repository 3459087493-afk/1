import json
import shutil
import sys
from pathlib import Path

import pandas as pd


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import EXP_ROOT, RESULTS_DIR, ensure_dir, load_json, write_json


BASELINE_COPY = EXP_ROOT / "copied_baseline" / "unsw_linear_transformer_hls_float_copy"
VARIANTS_DIR = EXP_ROOT / "hls_variants"
OUTPUT_DIR = RESULTS_DIR / "hls_generation"
ACTIVE_SET_PATH = RESULTS_DIR / "active_channel_selection" / "active_channel_sets.json"
SOURCE_MAP_PATH = OUTPUT_DIR / "hls_source_map.json"

VARIANTS = (
    {
        "variant": "v00_float_reference",
        "fixed_point_mode": "float",
        "feature_map_mode": "elu_plus_one",
        "scheduling_mode": "baseline",
        "reference_name": "original_float_reference_logits.npy",
    },
    {
        "variant": "v01_static_sparse_87p5_float",
        "fixed_point_mode": "float",
        "feature_map_mode": "elu_plus_one",
        "scheduling_mode": "baseline_sparse_loop_bounds",
        "reference_name": "static_sparse_87p5_float_reference_logits.npy",
    },
    {
        "variant": "v02_sparse_87p5_mixed_fixed",
        "fixed_point_mode": "mixed_ap_fixed_16_18_24",
        "feature_map_mode": "elu_plus_one_float_projection",
        "scheduling_mode": "baseline_sparse_loop_bounds",
        "reference_name": "sparse_87p5_mixed_fixed_reference_logits.npy",
    },
    {
        "variant": "v03_full_csg_halt",
        "fixed_point_mode": "mixed_ap_fixed_16_18_24",
        "feature_map_mode": "pwl_elu_plus_one_3_segment",
        "scheduling_mode": "resource_aware_limited_operators_pipeline",
        "reference_name": "full_csg_halt_reference_logits.npy",
    },
)


def add_header_configuration(header, fixed, tolerance):
    additions = ["", "#define UNSW_ACTIVE_DIM 14", f"#define UNSW_CSIM_TOLERANCE {tolerance}f"]
    if fixed:
        additions.extend(
            [
                "",
                "#include <ap_fixed.h>",
                "typedef ap_fixed<16, 6> data_t;",
                "typedef ap_fixed<18, 8> acc_t;",
                "typedef ap_fixed<24, 10> attn_acc_t;",
            ]
        )
    marker = "#define UNSW_NUM_CLASSES 2"
    if marker not in header:
        raise RuntimeError("Header dimension marker not found")
    return header.replace(marker, marker + "\n" + "\n".join(additions), 1)


def sparse_block(fixed=False, scheduled=False):
    value_type = "data_t" if fixed else "float"
    accumulator_type = "attn_acc_t" if fixed else "float"
    schedule_top = ""
    schedule_compact = ""
    if scheduled:
        schedule_top = """
    // Bound shared arithmetic to target PYNQ-Z2 resources instead of full unrolling.
    #pragma HLS ALLOCATION operation instances=mul limit=32
    #pragma HLS ALLOCATION operation instances=add limit=32
"""
        schedule_compact = """
            // A modest II exposes sequence parallelism without replicating all multipliers.
            #pragma HLS PIPELINE II=2
"""
    return f"""{schedule_top}
    // Compact K channels form the physical sparse reduction dimension. Q entries are
    // zeroed when the same channel is absent from the independently calibrated Q set.
    {value_type} sparse_query[UNSW_SEQ_LEN][UNSW_ACTIVE_DIM];
    {value_type} sparse_key[UNSW_SEQ_LEN][UNSW_ACTIVE_DIM];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {{
        for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {{{schedule_compact}
            const int channel = ACTIVE_K_CHANNELS[active_feature];
            sparse_key[sequence][active_feature] = key[sequence][channel];
            sparse_query[sequence][active_feature] = Q_ACTIVE_MASK[channel]
                ? query[sequence][channel] : 0.0f;
        }}
    }}

    {accumulator_type} key_value[UNSW_ACTIVE_DIM][UNSW_D_MODEL];
    for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {{
        for (int value_feature = 0; value_feature < UNSW_D_MODEL; ++value_feature) {{
            {accumulator_type} sum = 0.0f;
            for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {{
                sum += sparse_key[sequence][active_feature] * value[sequence][value_feature];
            }}
            key_value[active_feature][value_feature] = sum;
        }}
    }}

    {accumulator_type} key_sum[UNSW_ACTIVE_DIM];
    for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {{
        {accumulator_type} sum = 0.0f;
        for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {{
            sum += sparse_key[sequence][active_feature];
        }}
        key_sum[active_feature] = sum;
    }}

    float attention[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {{
        {accumulator_type} denominator = 0.0f;
        for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {{
            denominator += sparse_query[sequence][active_feature] * key_sum[active_feature];
        }}
        if (denominator < 1.0e-6f) {{
            denominator = 1.0e-6f;
        }}
        for (int value_feature = 0; value_feature < UNSW_D_MODEL; ++value_feature) {{
            {accumulator_type} numerator = 0.0f;
            for (int active_feature = 0; active_feature < UNSW_ACTIVE_DIM; ++active_feature) {{
                numerator += sparse_query[sequence][active_feature]
                    * key_value[active_feature][value_feature];
            }}
            attention[sequence][value_feature] = static_cast<float>(numerator / denominator);
        }}
    }}

"""


def generate_sparse_source(source, q_channels, k_channels, fixed=False, pwl_map=False, scheduled=False):
    start_marker = "    float key_value[UNSW_D_MODEL][UNSW_D_MODEL];"
    end_marker = "    float attention_output[UNSW_SEQ_LEN][UNSW_D_MODEL];"
    start = source.find(start_marker)
    end = source.find(end_marker)
    if start < 0 or end < 0 or end <= start:
        raise RuntimeError("Could not isolate baseline Linear Attention accumulation block")
    q_mask = [1 if channel in q_channels else 0 for channel in range(16)]
    constants = (
        "\nstatic const int ACTIVE_Q_CHANNELS[UNSW_ACTIVE_DIM] = {"
        + ", ".join(map(str, q_channels))
        + "};\nstatic const int ACTIVE_K_CHANNELS[UNSW_ACTIVE_DIM] = {"
        + ", ".join(map(str, k_channels))
        + "};\nstatic const bool Q_ACTIVE_MASK[UNSW_D_MODEL] = {"
        + ", ".join("true" if value else "false" for value in q_mask)
        + "};\n"
    )
    include_marker = '#include "weights.h"\n'
    source = source.replace(include_marker, include_marker + constants, 1)
    # Recompute markers after inserting constants.
    start = source.find(start_marker)
    end = source.find(end_marker)
    source = source[:start] + sparse_block(fixed=fixed, scheduled=scheduled) + source[end:]
    if pwl_map:
        old = "return value >= 0.0f ? value + 1.0f : std::exp(value);"
        new = """if (value >= 0.0f) {
        return value + 1.0f;
    }
    if (value >= -1.0f) {
        return 1.0f + 0.63212056f * value;
    }
    if (value >= -2.0f) {
        return 0.6004236f + 0.2325442f * value;
    }
    return 0.1353353f;"""
        if old not in source:
            raise RuntimeError("ELU+1 feature-map implementation not found")
        source = source.replace(old, new, 1)
    return source


def configure_testbench(text):
    old = "if (maximum_absolute_error > 1.0e-3f)"
    if old not in text:
        raise RuntimeError("CSIM tolerance statement not found")
    text = text.replace(old, "if (maximum_absolute_error > UNSW_CSIM_TOLERANCE)", 1)
    declaration = "        float sample_max_error = 0.0f;"
    text = text.replace(
        declaration,
        declaration + "\n        float class_absolute_error[UNSW_NUM_CLASSES] = {0.0f, 0.0f};",
        1,
    )
    error_end = """            );
            absolute_error_sum += error;"""
    text = text.replace(
        error_end,
        """            );
            class_absolute_error[output_class] = error;
            absolute_error_sum += error;""",
        1,
    )
    output_marker = '            << " max_abs_error=" << sample_max_error'
    text = text.replace(
        output_marker,
        '            << " abs_error=[" << class_absolute_error[0]\n'
        '            << "," << class_absolute_error[1] << "]"\n'
        + output_marker,
        1,
    )
    return text


def readme(config, q_channels, k_channels, path, active_ratio):
    difference = {
        "v00_float_reference": "Exact copied float computation; only CSIM tolerance is named in the header.",
        "v01_static_sparse_87p5_float": "Float accumulation with a real 14-entry compact attention reduction.",
        "v02_sparse_87p5_mixed_fixed": "v01 plus mixed ap_fixed types inside the sparse attention accumulation.",
        "v03_full_csg_halt": "v02 plus a three-segment PWL ELU+1 approximation and bounded resource-aware scheduling pragmas.",
    }[config["variant"]]
    sparse_note = """Q and K sets differ. The compact physical dimension follows K indices, while compact Q is
zero for K channels absent from the Q set. This preserves the Stage 4 independent-mask
semantics; unrelated Q/K channels are never paired by list position. Q/K/V projections stay
16-dimensional in this first version. Sparse hardware is introduced in K^T V, key sum,
denominator, and numerator reductions.""" if config["variant"] != "v00_float_reference" else (
        "This is the untouched float computation reference with all 16 Q/K channels."
    )
    return f"""# {config['variant']}

- Active channel ratio: `{active_ratio}` (`{len(q_channels)}/16`)
- Active Q channels: `{q_channels}`
- Active K channels: `{k_channels}`
- Fixed-point mode: `{config['fixed_point_mode']}`
- Feature-map mode: `{config['feature_map_mode']}`
- Scheduling mode: `{config['scheduling_mode']}`
- Difference from float baseline: {difference}
- PyTorch reference logits: `../../results/hls_generation/reference_logits/{config['reference_name']}`

{sparse_note}

## Commands

```bash
cd {path}
source /tools/Xilinx/Vitis_HLS/2022.2/settings64.sh
vitis_hls -f run_csim.tcl
vitis_hls -f run_csynth.tcl
```

Run `04c_generate_variant_reference_logits.py` before CSIM so `test_vectors.h` contains the
variant-specific expected logits. No result in this README claims CSIM or CSYNTH success.
"""


def main():
    source_map = load_json(SOURCE_MAP_PATH)
    if not source_map.get("safe_to_generate_variants"):
        raise RuntimeError("04a source inspection did not authorize variant generation")
    active_document = load_json(ACTIVE_SET_PATH)
    selected = active_document.get("selected_candidate")
    if not selected or selected.get("candidate") != "active_87p5":
        raise RuntimeError(f"Expected selected active_87p5, got: {selected}")
    active = active_document["sets"]["active_87p5"]
    q_channels = active["q_channels"]
    k_channels = active["k_channels"]
    if len(q_channels) != 14 or len(k_channels) != 14:
        raise RuntimeError("active_87p5 must contain 14 Q and 14 K channels")

    ensure_dir(VARIANTS_DIR)
    ensure_dir(OUTPUT_DIR)
    rows = []
    for config in VARIANTS:
        destination = VARIANTS_DIR / config["variant"]
        if destination.exists():
            shutil.rmtree(destination)
        shutil.copytree(BASELINE_COPY, destination)
        cpp_path = destination / "src" / "unsw_linear_transformer.cpp"
        header_path = destination / "src" / "unsw_linear_transformer.h"
        testbench_path = destination / "src" / "testbench.cpp"
        source = cpp_path.read_text(encoding="utf-8")
        header = header_path.read_text(encoding="utf-8")

        is_fixed = config["variant"] in ("v02_sparse_87p5_mixed_fixed", "v03_full_csg_halt")
        is_sparse = config["variant"] != "v00_float_reference"
        variant_q_channels = q_channels if is_sparse else list(range(16))
        variant_k_channels = k_channels if is_sparse else list(range(16))
        active_ratio = 0.875 if is_sparse else 1.0
        tolerance = "1.0e-2" if is_fixed else "1.0e-3"
        header = add_header_configuration(header, fixed=is_fixed, tolerance=tolerance)
        if is_sparse:
            source = generate_sparse_source(
                source,
                q_channels,
                k_channels,
                fixed=is_fixed,
                pwl_map=config["variant"] == "v03_full_csg_halt",
                scheduled=config["variant"] == "v03_full_csg_halt",
            )
        cpp_path.write_text(source, encoding="utf-8")
        header_path.write_text(header, encoding="utf-8")
        testbench_path.write_text(
            configure_testbench(testbench_path.read_text(encoding="utf-8")), encoding="utf-8"
        )
        variant_config = {
            **config,
            "active_ratio": active_ratio,
            "active_dim": 14 if is_sparse else 16,
            "attention_dim": 16,
            "active_q_channels": variant_q_channels,
            "active_k_channels": variant_k_channels,
            "csim_tolerance": float(tolerance),
            "generated_status": "generated_not_validated",
            "source_map": str(SOURCE_MAP_PATH),
        }
        write_json(destination / "variant_config.json", variant_config)
        (destination / "README.md").write_text(
            readme(
                config,
                variant_q_channels,
                variant_k_channels,
                destination,
                active_ratio,
            ),
            encoding="utf-8",
        )
        rows.append(
            {
                "variant": config["variant"],
                "path": str(destination),
                "active_ratio": active_ratio,
                "active_q_channels": json.dumps(variant_q_channels),
                "active_k_channels": json.dumps(variant_k_channels),
                "fixed_point_mode": config["fixed_point_mode"],
                "feature_map_mode": config["feature_map_mode"],
                "scheduling_mode": config["scheduling_mode"],
                "generated_status": "generated_not_validated",
                "notes": "CSIM and CSYNTH not run",
            }
        )
    pd.DataFrame(rows).to_csv(OUTPUT_DIR / "generated_variants.csv", index=False)
    print(pd.DataFrame(rows).to_string(index=False))
    print("Generated variants:", VARIANTS_DIR)


if __name__ == "__main__":
    main()
