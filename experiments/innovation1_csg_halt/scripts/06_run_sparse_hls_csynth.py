import re
import shutil
import subprocess
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

import pandas as pd


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import RESULTS_DIR, ensure_dir, write_json


OUTPUT_DIR = RESULTS_DIR / "hls_csynth"
LIMITS = {"BRAM_18K": 280, "DSP48E": 220, "FF": 106400, "LUT": 53200}


def first_number(text, patterns, default=None, cast=float):
    for pattern in patterns:
        match = re.search(pattern, text, re.MULTILINE | re.IGNORECASE)
        if match:
            return cast(match.group(1).replace(",", ""))
    return default


def parse_report(text):
    # Vitis 2022.2 text reports vary slightly; accept both table and label forms.
    clock = first_number(text, [r"Estimated\s+Clock\s+Period\s*[:|]\s*([\d.]+)", r"\|\s*ap_clk\s*\|\s*([\d.]+)"])
    latency_row = re.search(
        r"Latency.*?\n.*?\|\s*(\d+)\s*\|\s*(\d+)\s*\|\s*(\d+)\s*\|\s*(\d+)\s*\|",
        text,
        re.DOTALL | re.IGNORECASE,
    )
    resources = {}
    for name, aliases in {
        "BRAM_18K": ("BRAM_18K", "BRAM"),
        "DSP48E": ("DSP48E", "DSP"),
        "FF": ("FF",),
        "LUT": ("LUT",),
        "URAM": ("URAM",),
    }.items():
        patterns = [rf"\|\s*{alias}\s*\|\s*(\d+)" for alias in aliases]
        patterns += [rf"{alias}\s*[:=]\s*(\d+)" for alias in aliases]
        resources[name] = first_number(text, patterns, default=0, cast=int)
    return {
        "latency_min": int(latency_row.group(1)) if latency_row else None,
        "latency_max": int(latency_row.group(2)) if latency_row else None,
        "interval_min": int(latency_row.group(3)) if latency_row else None,
        "interval_max": int(latency_row.group(4)) if latency_row else None,
        "estimated_clock_ns": clock,
        **resources,
        "timing_met": clock is not None and clock <= 10.0,
        "timing_violation": clock is None or clock > 10.0,
    }


def parse_xml(path):
    root = ET.parse(path).getroot()

    def integer(xpath, default=0):
        value = root.findtext(xpath)
        return int(value) if value not in (None, "") else default

    clock_text = root.findtext(
        "./PerformanceEstimates/SummaryOfTimingAnalysis/EstimatedClockPeriod"
    )
    clock = float(clock_text) if clock_text else None
    return {
        "latency_min": integer(
            "./PerformanceEstimates/SummaryOfOverallLatency/Best-caseLatency", None
        ),
        "latency_max": integer(
            "./PerformanceEstimates/SummaryOfOverallLatency/Worst-caseLatency", None
        ),
        "interval_min": integer(
            "./PerformanceEstimates/SummaryOfOverallLatency/Interval-min", None
        ),
        "interval_max": integer(
            "./PerformanceEstimates/SummaryOfOverallLatency/Interval-max", None
        ),
        "estimated_clock_ns": clock,
        "BRAM_18K": integer("./AreaEstimates/Resources/BRAM_18K"),
        "DSP48E": integer("./AreaEstimates/Resources/DSP"),
        "FF": integer("./AreaEstimates/Resources/FF"),
        "LUT": integer("./AreaEstimates/Resources/LUT"),
        "URAM": integer("./AreaEstimates/Resources/URAM"),
        "timing_met": clock is not None and clock <= 10.0,
        "timing_violation": clock is None or clock > 10.0,
    }


def main():
    ensure_dir(OUTPUT_DIR)
    reports_dir = ensure_dir(OUTPUT_DIR / "reports")
    logs_dir = ensure_dir(OUTPUT_DIR / "logs")
    csim = pd.read_csv(RESULTS_DIR / "hls_csim" / "csim_results.csv")
    generated = pd.read_csv(RESULTS_DIR / "hls_generation" / "generated_variants.csv").set_index("variant")
    rows = []
    for variant in csim.loc[csim["csim_status"] == "PASS", "variant"]:
        variant_dir = Path(generated.loc[variant, "path"])
        log_path = logs_dir / f"{variant}_csynth.log"
        command = (
            "unset DEBUG && source /tools/Xilinx/Vitis_HLS/2022.2/settings64.sh "
            "&& vitis_hls -f run_csynth.tcl"
        )
        completed = subprocess.run(
            ["/bin/bash", "-lc", command], cwd=variant_dir, text=True, capture_output=True
        )
        combined = completed.stdout + "\n" + completed.stderr
        log_path.write_text(combined, encoding="utf-8")
        report_candidates = list(variant_dir.rglob("unsw_linear_transformer_csynth.rpt"))
        xml_candidates = list(variant_dir.rglob("unsw_linear_transformer_csynth.xml"))
        report_path = report_candidates[0] if report_candidates else None
        xml_path = xml_candidates[0] if xml_candidates else None
        metrics = parse_xml(xml_path) if xml_path else (
            parse_report(report_path.read_text(errors="replace")) if report_path else {
            "latency_min": None, "latency_max": None, "interval_min": None, "interval_max": None,
            "estimated_clock_ns": None, "BRAM_18K": 0, "DSP48E": 0, "FF": 0, "LUT": 0,
            "URAM": 0, "timing_met": False, "timing_violation": True,
            }
        )
        if report_path:
            shutil.copy2(report_path, reports_dir / f"{variant}_csynth.rpt")
        utilization = {
            "BRAM_util_pct": 100.0 * metrics["BRAM_18K"] / LIMITS["BRAM_18K"],
            "DSP_util_pct": 100.0 * metrics["DSP48E"] / LIMITS["DSP48E"],
            "FF_util_pct": 100.0 * metrics["FF"] / LIMITS["FF"],
            "LUT_util_pct": 100.0 * metrics["LUT"] / LIMITS["LUT"],
        }
        fit = completed.returncode == 0 and all(
            metrics[name] <= limit for name, limit in LIMITS.items()
        )
        rows.append(
            {
                "variant": variant,
                "csynth_status": "PASS" if completed.returncode == 0 and report_path else "FAIL",
                **metrics,
                **utilization,
                "pynq_resource_fit": bool(fit),
                "report_path": str(reports_dir / f"{variant}_csynth.rpt") if report_path else "",
                "log_path": str(log_path),
            }
        )
    frame = pd.DataFrame(rows)
    frame.to_csv(OUTPUT_DIR / "csynth_results.csv", index=False)
    write_json(OUTPUT_DIR / "csynth_results.json", {"limits": LIMITS, "variants": rows})
    if frame.empty:
        table = "No CSIM PASS variant was eligible."
    else:
        try:
            table = frame.to_markdown(index=False)
        except ImportError:
            table = frame.to_string(index=False)
    (OUTPUT_DIR / "csynth_summary.md").write_text(
        "# Sparse HLS CSYNTH Summary\n\n" + table + "\n", encoding="utf-8"
    )


if __name__ == "__main__":
    main()
