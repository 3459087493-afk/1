import argparse
import csv
import json
import os
import re
import shutil
import subprocess
import xml.etree.ElementTree as ET
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parents[1]
HLS_PROJECT_DIR = PROJECT_ROOT / "vitis_hls" / "unsw_linear_transformer_hls"
HLS_SOLUTION_DIR = HLS_PROJECT_DIR / "unsw_linear_transformer_prj" / "solution1"
CSYNTH_RESULTS_DIR = (
    PROJECT_ROOT / "results" / "linear_unsw_baseline" / "hls" / "csynth"
)
CSIM_REPORT_PATH = (
    PROJECT_ROOT / "results" / "linear_unsw_baseline" / "hls" / "hls_csim_report.json"
)
RUN_CSYNTH_TCL = HLS_PROJECT_DIR / "run_csynth.tcl"
TOP_FUNCTION = "unsw_linear_transformer"
TARGET_PART = "xc7z020clg400-1"
TARGET_CLOCK_NS = 10.0

PYNQ_Z2_CAPACITY = {
    "BRAM_18K": 280,
    "DSP48E": 220,
    "FF": 106400,
    "LUT": 53200,
}

REQUIRED_PROJECT_FILES = (
    HLS_PROJECT_DIR / "src" / "unsw_linear_transformer.h",
    HLS_PROJECT_DIR / "src" / "unsw_linear_transformer.cpp",
    HLS_PROJECT_DIR / "src" / "weights.h",
    HLS_PROJECT_DIR / "src" / "test_vectors.h",
    HLS_PROJECT_DIR / "src" / "testbench.cpp",
    RUN_CSYNTH_TCL,
)


def load_json(path):
    with path.open("r", encoding="utf-8") as file:
        return json.load(file)


def check_project_files():
    missing = [str(path) for path in REQUIRED_PROJECT_FILES if not path.is_file()]
    if missing:
        raise FileNotFoundError("Missing HLS project files: " + ", ".join(missing))
    tcl_text = RUN_CSYNTH_TCL.read_text(encoding="utf-8")
    required_fragments = (
        "set_top unsw_linear_transformer",
        "set_part xc7z020clg400-1",
        "create_clock -period 10 -name default",
        "csynth_design",
    )
    missing_fragments = [item for item in required_fragments if item not in tcl_text]
    if missing_fragments:
        raise ValueError(f"run_csynth.tcl is missing: {missing_fragments}")
    if "export_design" in tcl_text:
        raise ValueError("run_csynth.tcl must not call export_design in this stage")
    return [str(path) for path in REQUIRED_PROJECT_FILES]


def check_csim_passed():
    if not CSIM_REPORT_PATH.is_file():
        raise FileNotFoundError(f"Missing CSIM report: {CSIM_REPORT_PATH}")
    report = load_json(CSIM_REPORT_PATH)
    if not report.get("csim_passed", False):
        raise RuntimeError("CSIM has not passed; csynth_design is not allowed")
    return report


def find_csynth_report():
    candidates = sorted(
        HLS_PROJECT_DIR.glob("**/*csynth.rpt"),
        key=lambda path: path.stat().st_mtime,
        reverse=True,
    )
    return candidates[0] if candidates else None


def find_csynth_xml(report_path=None):
    search_root = report_path.parent if report_path is not None else HLS_SOLUTION_DIR
    candidates = sorted(
        search_root.glob("*csynth.xml"),
        key=lambda path: path.stat().st_mtime,
        reverse=True,
    )
    if not candidates:
        candidates = sorted(
            HLS_PROJECT_DIR.glob("**/*csynth.xml"),
            key=lambda path: path.stat().st_mtime,
            reverse=True,
        )
    return candidates[0] if candidates else None


def synthesis_inputs_mtime():
    return max(path.stat().st_mtime for path in REQUIRED_PROJECT_FILES)


def report_is_current(report_path):
    return report_path is not None and report_path.stat().st_mtime >= synthesis_inputs_mtime()


def known_vitis_hls_command():
    command = shutil.which("vitis_hls")
    if command:
        return command
    known_path = Path("/tools/Xilinx/Vitis_HLS/2022.2/bin/vitis_hls")
    return str(known_path) if known_path.is_file() else None


def run_csynth(force=False):
    CSYNTH_RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    output_path = CSYNTH_RESULTS_DIR / "hls_csynth_output.txt"
    existing_report = find_csynth_report()
    if not force and report_is_current(existing_report):
        vitis_log = HLS_PROJECT_DIR / "vitis_hls.log"
        output = (
            vitis_log.read_text(encoding="utf-8", errors="replace")
            if vitis_log.is_file()
            else "Current csynth report found; Vitis terminal log is unavailable.\n"
        )
        output_path.write_text(output, encoding="utf-8")
        return {
            "vitis_hls_available": known_vitis_hls_command() is not None,
            "vitis_hls_command": known_vitis_hls_command(),
            "csynth_executed": True,
            "csynth_reused": True,
            "return_code": 0,
            "report_path": str(existing_report),
            "reason": "Current csynth report reused",
        }

    command = known_vitis_hls_command()
    if command is None:
        message = "vitis_hls command not available, csynth not executed.\n"
        output_path.write_text(message, encoding="utf-8")
        return {
            "vitis_hls_available": False,
            "vitis_hls_command": None,
            "csynth_executed": False,
            "csynth_reused": False,
            "return_code": None,
            "report_path": None,
            "reason": message.strip(),
        }

    settings = Path("/tools/Xilinx/Vitis_HLS/2022.2/settings64.sh")
    if settings.is_file():
        shell_command = (
            "unset DEBUG && "
            f"source {settings} && "
            "vitis_hls -f run_csynth.tcl"
        )
        process = subprocess.run(
            ["/bin/bash", "-lc", shell_command],
            cwd=HLS_PROJECT_DIR,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            check=False,
        )
    else:
        process = subprocess.run(
            [command, "-f", "run_csynth.tcl"],
            cwd=HLS_PROJECT_DIR,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            check=False,
        )
    output_path.write_text(process.stdout, encoding="utf-8")
    report_path = find_csynth_report()
    succeeded = bool(process.returncode == 0 and report_is_current(report_path))
    return {
        "vitis_hls_available": True,
        "vitis_hls_command": command,
        "csynth_executed": True,
        "csynth_reused": False,
        "return_code": process.returncode,
        "report_path": str(report_path) if report_path else None,
        "reason": "csynth_design completed" if succeeded else "csynth_design failed",
    }


def xml_text(root, path, default=None):
    element = root.find(path)
    if element is None or element.text is None:
        return default
    return element.text.strip()


def parse_int(value):
    if value in (None, "", "undef", "?", "N/A"):
        return None
    return int(float(str(value).replace(",", "")))


def parse_float(value):
    if value in (None, "", "undef", "?", "N/A"):
        return None
    return float(str(value).replace(",", ""))


def parse_csynth_xml(xml_path):
    root = ET.parse(xml_path).getroot()
    prefix = "./"
    metrics = {
        "solution_name": HLS_SOLUTION_DIR.name,
        "top_function": xml_text(root, prefix + "UserAssignments/TopModelName", TOP_FUNCTION),
        "target_part": xml_text(root, prefix + "UserAssignments/Part", TARGET_PART),
        "target_clock_period_ns": parse_float(
            xml_text(root, prefix + "UserAssignments/TargetClockPeriod", TARGET_CLOCK_NS)
        ),
        "estimated_clock_period_ns": parse_float(
            xml_text(
                root,
                prefix + "PerformanceEstimates/SummaryOfTimingAnalysis/EstimatedClockPeriod",
            )
        ),
        "latency_min_cycles": parse_int(
            xml_text(root, prefix + "PerformanceEstimates/SummaryOfOverallLatency/Best-caseLatency")
        ),
        "latency_max_cycles": parse_int(
            xml_text(root, prefix + "PerformanceEstimates/SummaryOfOverallLatency/Worst-caseLatency")
        ),
        "interval_min_cycles": parse_int(
            xml_text(root, prefix + "PerformanceEstimates/SummaryOfOverallLatency/Interval-min")
        ),
        "interval_max_cycles": parse_int(
            xml_text(root, prefix + "PerformanceEstimates/SummaryOfOverallLatency/Interval-max")
        ),
        "BRAM_18K": parse_int(xml_text(root, prefix + "AreaEstimates/Resources/BRAM_18K")),
        "DSP48E": parse_int(
            xml_text(root, prefix + "AreaEstimates/Resources/DSP48E")
            or xml_text(root, prefix + "AreaEstimates/Resources/DSP")
        ),
        "FF": parse_int(xml_text(root, prefix + "AreaEstimates/Resources/FF")),
        "LUT": parse_int(xml_text(root, prefix + "AreaEstimates/Resources/LUT")),
        "URAM": parse_int(xml_text(root, prefix + "AreaEstimates/Resources/URAM", 0)),
        "metrics_source": str(xml_path),
    }
    return metrics


def parse_csynth_rpt(report_path):
    text = report_path.read_text(encoding="utf-8", errors="replace")
    xml_path = find_csynth_xml(report_path)
    metrics = parse_csynth_xml(xml_path) if xml_path is not None else {
        "solution_name": HLS_SOLUTION_DIR.name,
        "top_function": TOP_FUNCTION,
        "target_part": TARGET_PART,
        "target_clock_period_ns": TARGET_CLOCK_NS,
        "estimated_clock_period_ns": None,
        "latency_min_cycles": None,
        "latency_max_cycles": None,
        "interval_min_cycles": None,
        "interval_max_cycles": None,
        "BRAM_18K": None,
        "DSP48E": None,
        "FF": None,
        "LUT": None,
        "URAM": None,
        "metrics_source": str(report_path),
    }

    if metrics["estimated_clock_period_ns"] is None:
        timing_match = re.search(
            r"\|\s*ap_clk\s*\|\s*([0-9.]+)\s*\|\s*([0-9.]+)", text
        )
        if timing_match:
            metrics["target_clock_period_ns"] = float(timing_match.group(1))
            metrics["estimated_clock_period_ns"] = float(timing_match.group(2))

    metrics["report_path"] = str(report_path)
    metrics["xml_path"] = str(xml_path) if xml_path else None
    metrics["report_warning_count"] = len(re.findall(r"\bWARNING\b", text, flags=re.IGNORECASE))
    metrics["report_error_count"] = len(re.findall(r"\bERROR\b", text, flags=re.IGNORECASE))
    return metrics


def analyze_log(output_path):
    text = output_path.read_text(encoding="utf-8", errors="replace") if output_path.is_file() else ""
    warning_lines = [line for line in text.splitlines() if "WARNING" in line.upper()]
    error_lines = [line for line in text.splitlines() if "ERROR" in line.upper()]
    return {
        "warning_count": len(warning_lines),
        "error_count": len(error_lines),
        "warning_lines": warning_lines,
        "error_lines": error_lines,
        "last_80_lines": text.splitlines()[-80:],
    }


def add_board_assessment(metrics, csynth_succeeded):
    utilization = {}
    resource_over_limit = False
    for resource, capacity in PYNQ_Z2_CAPACITY.items():
        used = metrics.get(resource)
        percent = None if used is None else 100.0 * used / capacity
        utilization[resource] = {
            "used": used,
            "capacity": capacity,
            "utilization_percent": percent,
        }
        if percent is None or percent > 100.0:
            resource_over_limit = True

    high_pressure = any(
        utilization[name]["utilization_percent"] is None
        or utilization[name]["utilization_percent"] > 80.0
        for name in ("DSP48E", "LUT")
    )
    estimated = metrics.get("estimated_clock_period_ns")
    target = metrics.get("target_clock_period_ns")
    timing_violation = estimated is None or target is None or estimated > target
    can_continue = bool(
        csynth_succeeded
        and not resource_over_limit
        and not high_pressure
        and not timing_violation
    )
    metrics.update(
        {
            "pynq_z2_capacity": PYNQ_Z2_CAPACITY,
            "resource_utilization": utilization,
            "resource_over_limit": resource_over_limit,
            "dsp_or_lut_over_80_percent": high_pressure,
            "timing_violation": timing_violation,
            "can_continue_to_export_ip_vivado": can_continue,
        }
    )
    if not csynth_succeeded:
        recommendation = "Stop: csynth_design did not succeed. Fix synthesis errors before any hardware step."
    elif resource_over_limit:
        recommendation = (
            "Stop: the float design exceeds PYNQ-Z2 resources. Convert to ap_fixed and/or optimize the structure "
            "before board accuracy testing."
        )
    elif high_pressure:
        recommendation = (
            "Stop before Vivado: DSP or LUT utilization is above 80%. Apply ap_fixed and structural optimization."
        )
    elif timing_violation:
        recommendation = "Stop before export IP: estimated clock period exceeds the 10 ns target. Optimize timing."
    else:
        recommendation = "Resources and timing are acceptable for proceeding to AXI interface and export IP work."
    metrics["recommendation"] = recommendation
    return metrics


def copy_report(report_path):
    destination = CSYNTH_RESULTS_DIR / "unsw_linear_transformer_csynth.rpt"
    shutil.copy2(report_path, destination)
    return destination


def save_metrics(metrics):
    json_path = CSYNTH_RESULTS_DIR / "csynth_metrics.json"
    csv_path = CSYNTH_RESULTS_DIR / "csynth_metrics.csv"
    json_path.write_text(json.dumps(metrics, indent=2), encoding="utf-8")

    flat = {key: value for key, value in metrics.items() if not isinstance(value, (dict, list))}
    for resource, detail in metrics.get("resource_utilization", {}).items():
        flat[f"{resource}_capacity"] = detail["capacity"]
        flat[f"{resource}_utilization_percent"] = detail["utilization_percent"]
    with csv_path.open("w", encoding="utf-8", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=list(flat.keys()))
        writer.writeheader()
        writer.writerow(flat)
    return json_path, csv_path


def format_metric(value):
    return "unavailable" if value is None else str(value)


def write_summary(metrics, csim_report, csynth_status, log_analysis):
    utilization = metrics.get("resource_utilization", {})
    resource_lines = []
    for resource in ("BRAM_18K", "DSP48E", "FF", "LUT"):
        detail = utilization.get(resource, {})
        percent = detail.get("utilization_percent")
        percent_text = "unavailable" if percent is None else f"{percent:.3f}%"
        resource_lines.append(
            f"| {resource} | {detail.get('used')} | {detail.get('capacity')} | {percent_text} |"
        )

    if metrics.get("can_continue_to_export_ip_vivado"):
        board_flow = """The current float design can continue into the board-integration flow:

1. Add PYNQ-callable AXI interface pragmas to the HLS top function.
2. Run `export_design` to package the HLS IP.
3. Integrate the IP in Vivado and generate the bitstream.
4. Export the `.bit` and `.hwh` files.
5. Write a PYNQ Python program that loads the overlay.
6. Load `sample_inputs.npy` and `sample_labels.npy`.
7. Send each sample to the FPGA and read two output logits.
8. Apply `argmax` to obtain binary anomaly predictions.
9. Compare predictions with labels (`0=normal`, `1=anomaly/attack`).
10. Report board accuracy, precision, recall, F1, and confusion matrix.

Board validation should first use 16 samples for FPGA/CSIM/PyTorch alignment, then 256
samples for initial binary anomaly-detection metrics. Extend to the full test set only after
correctness and throughput are acceptable."""
    else:
        board_flow = """The current float design must not proceed directly to board accuracy testing.
First apply `ap_fixed` quantization and/or structural optimization, repeat CSIM and csynth,
and only continue when PYNQ-Z2 resource and timing checks pass. Board accuracy, precision,
recall, F1, and confusion matrix would not be meaningful before a deployable design exists.

After an optimized design passes resource and timing checks, board validation should use:

1. 16 samples to verify FPGA logits and predictions against HLS CSIM and PyTorch.
2. 256 samples to calculate initial binary anomaly-detection accuracy, precision, recall,
   F1, and confusion matrix from `sample_inputs.npy` and `sample_labels.npy`.
3. The full UNSW-NB15 test set only after correctness and throughput are acceptable."""

    failure_tail = ""
    if not csynth_status.get("csynth_succeeded", False):
        tail = "\n".join(log_analysis.get("last_80_lines", []))
        failure_tail = f"""

## Failure Log Tail

```text
{tail}
```

Possible causes include unsupported floating-point math, excessive arrays/resources,
non-synthesizable C++, or expensive exp/div/matrix operations. Do not continue to export IP.
"""

    summary = f"""# UNSW-NB15 Linear Transformer HLS CSYNTH Summary

- HLS project: `{HLS_PROJECT_DIR}`
- Top function: `{TOP_FUNCTION}`
- Task: binary anomaly detection (`0=normal`, `1=anomaly/attack`)
- Input shape: `[8, 24]`
- Output shape: `[2]`
- CSIM passed: `{csim_report.get('csim_passed', False)}`
- csynth executed: `{csynth_status.get('csynth_executed', False)}`
- csynth successful: `{csynth_status.get('csynth_succeeded', False)}`
- Target part: `{format_metric(metrics.get('target_part'))}`
- Target clock period: `{format_metric(metrics.get('target_clock_period_ns'))}` ns
- Estimated clock period: `{format_metric(metrics.get('estimated_clock_period_ns'))}` ns
- Latency min/max: `{format_metric(metrics.get('latency_min_cycles'))}` / `{format_metric(metrics.get('latency_max_cycles'))}` cycles
- Interval min/max: `{format_metric(metrics.get('interval_min_cycles'))}` / `{format_metric(metrics.get('interval_max_cycles'))}` cycles
- Timing violation: `{metrics.get('timing_violation')}`
- Resource over limit: `{metrics.get('resource_over_limit')}`
- DSP or LUT over 80%: `{metrics.get('dsp_or_lut_over_80_percent')}`

## PYNQ-Z2 Resource Assessment

| Resource | Used | Capacity | Utilization |
|---|---:|---:|---:|
{os.linesep.join(resource_lines)}

## Decision

- Can continue to export IP / Vivado: `{metrics.get('can_continue_to_export_ip_vivado')}`
- Recommendation: {metrics.get('recommendation')}

## Board-Accuracy Roadmap

{board_flow}
{failure_tail}
"""
    summary_path = CSYNTH_RESULTS_DIR / "csynth_summary.md"
    summary_path.write_text(summary, encoding="utf-8")
    return summary_path


def write_generated_file_list():
    files = [
        CSYNTH_RESULTS_DIR / "hls_csynth_output.txt",
        CSYNTH_RESULTS_DIR / "unsw_linear_transformer_csynth.rpt",
        CSYNTH_RESULTS_DIR / "csynth_metrics.json",
        CSYNTH_RESULTS_DIR / "csynth_metrics.csv",
        CSYNTH_RESULTS_DIR / "csynth_summary.md",
        CSYNTH_RESULTS_DIR / "generated_file_list.txt",
    ]
    path = CSYNTH_RESULTS_DIR / "generated_file_list.txt"
    path.write_text(
        "\n".join(str(item.relative_to(PROJECT_ROOT)) for item in files) + "\n",
        encoding="utf-8",
    )
    return files


def save_failure_reports(csynth_status, csim_report, log_analysis):
    metrics = {
        "solution_name": HLS_SOLUTION_DIR.name,
        "top_function": TOP_FUNCTION,
        "target_part": TARGET_PART,
        "target_clock_period_ns": TARGET_CLOCK_NS,
        "estimated_clock_period_ns": None,
        "latency_min_cycles": None,
        "latency_max_cycles": None,
        "interval_min_cycles": None,
        "interval_max_cycles": None,
        "BRAM_18K": None,
        "DSP48E": None,
        "FF": None,
        "LUT": None,
        "URAM": None,
        "report_warning_count": 0,
        "report_error_count": log_analysis["error_count"],
    }
    metrics = add_board_assessment(metrics, csynth_succeeded=False)
    metrics["failure_stage"] = "csynth_design"
    metrics["failure_reason"] = csynth_status.get("reason")
    metrics["last_80_log_lines"] = log_analysis["last_80_lines"]
    save_metrics(metrics)
    write_summary(metrics, csim_report, {**csynth_status, "csynth_succeeded": False}, log_analysis)
    write_generated_file_list()
    return metrics


def run_pipeline(force=False):
    CSYNTH_RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    project_files = check_project_files()
    csim_report = check_csim_passed()
    csynth_status = run_csynth(force=force)
    output_path = CSYNTH_RESULTS_DIR / "hls_csynth_output.txt"
    log_analysis = analyze_log(output_path)
    report_path = Path(csynth_status["report_path"]) if csynth_status.get("report_path") else None
    csynth_succeeded = bool(
        csynth_status.get("return_code") == 0
        and report_path is not None
        and report_is_current(report_path)
    )
    csynth_status["csynth_succeeded"] = csynth_succeeded

    if not csynth_succeeded:
        metrics = save_failure_reports(csynth_status, csim_report, log_analysis)
        return {
            "project_files": project_files,
            "csim_report": csim_report,
            "csynth_status": csynth_status,
            "metrics": metrics,
            "log_analysis": log_analysis,
        }

    copied_report = copy_report(report_path)
    metrics = parse_csynth_rpt(report_path)
    metrics["copied_report_path"] = str(copied_report)
    metrics["log_warning_count"] = log_analysis["warning_count"]
    metrics["log_error_count"] = log_analysis["error_count"]
    metrics = add_board_assessment(metrics, csynth_succeeded=True)
    save_metrics(metrics)
    write_summary(metrics, csim_report, csynth_status, log_analysis)
    write_generated_file_list()
    return {
        "project_files": project_files,
        "csim_report": csim_report,
        "csynth_status": csynth_status,
        "metrics": metrics,
        "log_analysis": log_analysis,
    }


def parse_args():
    parser = argparse.ArgumentParser(description="Run and analyze UNSW Linear Transformer HLS csynth.")
    parser.add_argument("--force", action="store_true", help="Run csynth even if a current report exists.")
    return parser.parse_args()


def main():
    args = parse_args()
    result = run_pipeline(force=args.force)
    print("CSIM passed:", result["csim_report"].get("csim_passed"))
    print("csynth status:", result["csynth_status"])
    print("metrics:", json.dumps(result["metrics"], indent=2))
    print("summary:", CSYNTH_RESULTS_DIR / "csynth_summary.md")
    if not result["csynth_status"].get("csynth_succeeded", False):
        raise SystemExit(1)


if __name__ == "__main__":
    main()
