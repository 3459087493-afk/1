import json
import re
import subprocess
import sys
from pathlib import Path

import pandas as pd


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import EXP_ROOT, RESULTS_DIR, ensure_dir, load_json, write_json


GENERATION_DIR = RESULTS_DIR / "hls_generation"
OUTPUT_DIR = RESULTS_DIR / "hls_csim"
VARIANT_ORDER = (
    "v00_float_reference",
    "v01_static_sparse_87p5_float",
    "v02_sparse_87p5_mixed_fixed",
    "v03_full_csg_halt",
)


def parse_csim_metrics(text):
    match = re.search(
        r"CSIM_METRICS\s+max_abs_error=([+\-\deE.]+)\s+"
        r"mean_abs_error=([+\-\deE.]+)\s+prediction_match_rate=([+\-\deE.]+)",
        text,
    )
    if not match:
        return None
    return {
        "max_abs_error_hls_vs_reference": float(match.group(1)),
        "mean_abs_error_hls_vs_reference": float(match.group(2)),
        "prediction_match_rate_hls_vs_reference": float(match.group(3)),
        "prediction_flip_count": len(
            re.findall(r"prediction_flipped=true", text, re.IGNORECASE)
        ),
    }


def main():
    ensure_dir(OUTPUT_DIR)
    logs_dir = ensure_dir(OUTPUT_DIR / "logs")
    generated = pd.read_csv(GENERATION_DIR / "generated_variants.csv").set_index("variant")
    references = pd.read_csv(GENERATION_DIR / "reference_logits_summary.csv").set_index("variant")
    metadata = load_json(GENERATION_DIR / "reference_logits_metadata.json")["variants"]
    rows = []
    for variant in VARIANT_ORDER:
        if variant not in generated.index or generated.loc[variant, "generated_status"] != "generated_not_validated":
            continue
        variant_dir = Path(generated.loc[variant, "path"])
        log_path = logs_dir / f"{variant}_csim.log"
        command = (
            "unset DEBUG && source /tools/Xilinx/Vitis_HLS/2022.2/settings64.sh "
            "&& vitis_hls -f run_csim.tcl"
        )
        completed = subprocess.run(
            ["/bin/bash", "-lc", command],
            cwd=variant_dir,
            text=True,
            capture_output=True,
        )
        combined = completed.stdout + "\n" + completed.stderr
        log_path.write_text(combined, encoding="utf-8")
        parsed = parse_csim_metrics(combined) or {
            "max_abs_error_hls_vs_reference": float("nan"),
            "mean_abs_error_hls_vs_reference": float("nan"),
            "prediction_match_rate_hls_vs_reference": 0.0,
            "prediction_flip_count": -1,
        }
        reference = references.loc[variant]
        tolerance = float(metadata[variant]["csim_tolerance"])
        passed = bool(
            completed.returncode == 0
            and parsed["max_abs_error_hls_vs_reference"] <= tolerance
            and parsed["prediction_match_rate_hls_vs_reference"] == 1.0
            and parsed["prediction_flip_count"] == 0
            and float(reference["f1_delta_vs_original"]) >= -0.01
            and float(reference["prediction_match_rate_vs_original"]) >= 0.99
            and int(metadata[variant]["denominator_near_zero_count"]) == 0
        )
        rows.append(
            {
                "variant": variant,
                "csim_status": "PASS" if passed else "FAIL",
                **parsed,
                "accuracy": float(reference["accuracy"]),
                "precision": float(reference["precision"]),
                "recall": float(reference["recall"]),
                "f1": float(reference["f1"]),
                "f1_delta_vs_original": float(reference["f1_delta_vs_original"]),
                "prediction_match_rate_vs_original": float(
                    reference["prediction_match_rate_vs_original"]
                ),
                "denominator_near_zero_count": int(
                    metadata[variant]["denominator_near_zero_count"]
                ),
                "log_path": str(log_path),
            }
        )
        print(variant, rows[-1]["csim_status"], "log=", log_path)
    frame = pd.DataFrame(rows)
    frame.to_csv(OUTPUT_DIR / "csim_results.csv", index=False)
    write_json(OUTPUT_DIR / "csim_results.json", {"variants": rows})
    if frame.empty:
        table = "No generated variants were found."
    else:
        try:
            table = frame.to_markdown(index=False)
        except ImportError:
            table = frame.to_string(index=False)
    (OUTPUT_DIR / "csim_summary.md").write_text(
        "# Sparse HLS CSIM Summary\n\n" + table + "\n", encoding="utf-8"
    )
    (OUTPUT_DIR / "csim_summary.txt").write_text(
        frame.to_string(index=False) if not frame.empty else "No generated variants were found.",
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
