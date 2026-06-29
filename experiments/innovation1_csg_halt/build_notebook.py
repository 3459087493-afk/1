import json
from pathlib import Path


PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
EXP_ROOT = PROJECT_ROOT / "experiments" / "innovation1_csg_halt"
TARGETS = [
    PROJECT_ROOT / "notebooks" / "UNSW_Innovation1_CSG_HALT.ipynb",
    EXP_ROOT / "notebooks" / "UNSW_Innovation1_CSG_HALT.ipynb",
]


def markdown(source):
    return {"cell_type": "markdown", "metadata": {}, "source": source.splitlines(True)}


def code(source):
    return {
        "cell_type": "code",
        "execution_count": None,
        "metadata": {},
        "outputs": [],
        "source": source.splitlines(True),
    }


cells = [
    markdown("""# UNSW-NB15 Innovation 1: CSG-HALT

**Calibration-guided Sparse Linear Attention Hardware Generation**  
**校准引导的稀疏 Linear Attention 硬件生成方法**

本实验借鉴 ViT4Mal 的边缘 Transformer 系统拆分和硬件约束驱动思想，但不照搬其模型。本实验对象是 UNSW-NB15 binary anomaly detection 的 Linear Transformer core；不改变输入输出 shape、网络层级或权重维度。

当前 notebook 仅执行 Stage 0-4。所有核心逻辑位于 `experiments/innovation1_csg_halt/scripts/`，本 notebook 只调用脚本并展示结果。Stage 5-8 在候选通过校准门槛后另行开展。
"""),
    markdown("## 1. Path configuration"),
    code("""from pathlib import Path
import json
import subprocess
import sys

import pandas as pd
from IPython.display import Markdown, display

PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
EXP_ROOT = PROJECT_ROOT / "experiments" / "innovation1_csg_halt"
SCRIPT_DIR = EXP_ROOT / "scripts"
RESULTS_DIR = EXP_ROOT / "results"
LOG_DIR = EXP_ROOT / "logs" / "notebook_stage_logs"
LOG_DIR.mkdir(parents=True, exist_ok=True)

assert EXP_ROOT.exists(), f"Missing experiment directory: {EXP_ROOT}"
print("PROJECT_ROOT:", PROJECT_ROOT)
print("EXP_ROOT:", EXP_ROOT)
"""),
    markdown("## 2. Stage runner"),
    code("""def run_stage(script_name):
    script = SCRIPT_DIR / script_name
    assert script.exists(), f"Missing stage script: {script}"
    result = subprocess.run(
        [sys.executable, str(script)],
        cwd=PROJECT_ROOT,
        text=True,
        capture_output=True,
    )
    log_path = LOG_DIR / f"{script.stem}.log"
    combined = f"STDOUT:\\n{result.stdout}\\nSTDERR:\\n{result.stderr}"
    log_path.write_text(combined, encoding="utf-8")
    if result.returncode != 0:
        tail = "\\n".join(combined.splitlines()[-80:])
        print(tail)
        raise RuntimeError(f"Stage failed ({result.returncode}): {script_name}; log={log_path}")
    print(result.stdout.strip())
    print("Log:", log_path)
    return result


def show_markdown(path):
    path = Path(path)
    assert path.exists(), f"Missing result: {path}"
    display(Markdown(path.read_text(encoding="utf-8")))
"""),
    markdown("## 3. Stage 0: Snapshot baseline"),
    code("""run_stage("00_snapshot_baseline.py")
snapshot_path = RESULTS_DIR / "baseline_snapshot" / "baseline_file_hashes.json"
snapshot = json.loads(snapshot_path.read_text(encoding="utf-8"))
print("Protected files:", len(snapshot["files"]))
print("Integrity check: True (snapshot script exits nonzero on mismatch)")
pd.DataFrame(snapshot["files"].values()).loc[:, ["path", "sha256", "size_bytes"]]
"""),
    markdown("## 4. Stage 1: Hardware bottleneck profiling"),
    code("""run_stage("01_profile_float_hls_bottleneck.py")
show_markdown(RESULTS_DIR / "bottleneck_profile" / "bottleneck_profile.md")
"""),
    markdown("## 5. Stage 2: PS/PL task partition plan"),
    code("""show_markdown(RESULTS_DIR / "bottleneck_profile" / "ps_pl_partition_plan.md")
"""),
    markdown("## 6. Stage 3: Dynamic-threshold spike-gate calibration"),
    code("""run_stage("02_calibrate_dynamic_threshold_spikegate.py")
dynamic_path = RESULTS_DIR / "pytorch_calibration" / "dynamic_threshold_results.csv"
dynamic_df = pd.read_csv(dynamic_path)
dynamic_df.sort_values(
    ["passes_quality_gate", "prediction_match_rate_vs_original", "f1_delta_vs_original", "q_active_ratio", "k_active_ratio"],
    ascending=[False, False, False, True, True],
).loc[:, [
    "config_id", "method", "threshold_param", "f1", "f1_delta_vs_original",
    "prediction_match_rate_vs_original", "q_active_ratio", "k_active_ratio",
    "denominator_near_zero_count", "passes_quality_gate",
]].head(20)
"""),
    code("""show_markdown(RESULTS_DIR / "pytorch_calibration" / "dynamic_threshold_summary.md")
"""),
    markdown("## 7. Stage 4: Calibration-guided active-channel selection"),
    code("""thresholds = json.loads(
    (RESULTS_DIR / "pytorch_calibration" / "thresholds.json").read_text(encoding="utf-8")
)
if thresholds.get("best_config_id") is None:
    raise RuntimeError(
        "No dynamic configuration meets prediction match >= 0.99, F1 delta >= -0.01, "
        "and denominator_near_zero_count == 0. Stop before HLS."
    )
run_stage("03_select_active_channels.py")
active_df = pd.read_csv(RESULTS_DIR / "active_channel_selection" / "active_channel_eval.csv")
active_df.loc[:, [
    "candidate", "accuracy", "precision", "recall", "f1", "f1_delta_vs_original",
    "prediction_match_rate_vs_original", "q_active_ratio", "k_active_ratio",
    "denominator_near_zero_count", "passes_quality_gate",
]]
"""),
    code("""show_markdown(RESULTS_DIR / "active_channel_selection" / "active_channel_summary.md")
active_sets = json.loads(
    (RESULTS_DIR / "active_channel_selection" / "active_channel_sets.json").read_text(encoding="utf-8")
)
selected = active_sets.get("selected_candidate")
if selected is None:
    raise RuntimeError("No sparse static active-channel set passed. Stop before HLS generation.")
print("Selected sparse candidate:", json.dumps(selected, indent=2))
"""),
    markdown("""## 8. Stage 5-8 status

Deferred in this iteration, by design:

- Stage 5: Generate sparse mixed-fixed-point HLS variants
- Stage 6: HLS CSIM
- Stage 7: HLS CSYNTH
- Stage 8: Multi-objective candidate selection

No existing float HLS source, ONNX file, checkpoint, CSIM report, or CSYNTH report is modified by Stage 0-4.
"""),
    markdown("## 9. Current conclusion"),
    code('''profile = json.loads(
    (RESULTS_DIR / "bottleneck_profile" / "bottleneck_profile.json").read_text(encoding="utf-8")
)
best_dynamic = json.loads(
    (RESULTS_DIR / "pytorch_calibration" / "dynamic_threshold_results.json").read_text(encoding="utf-8")
).get("best_config")
selected_set = active_sets["sets"][selected["candidate"]]

summary = f"""### Stage 0-4 summary

1. **Float baseline cannot enter PYNQ-Z2 implementation unchanged:** DSP {profile['DSP48E']}/220 and LUT {profile['LUT']}/53200 exceed the board budget.
2. **Dynamic spike-gate calibration is useful as an analysis tool:** `{best_dynamic['config_id']}` passes the strict quality gate with prediction match {best_dynamic['prediction_match_rate_vs_original']:.6f} and F1 delta {best_dynamic['f1_delta_vs_original']:.6f}.
3. **Static sparse candidate found:** `{selected['candidate']}` keeps {selected_set['active_count']}/16 Q channels and {selected_set['active_count']}/16 K channels; calibration prediction match is {selected['prediction_match_rate_vs_original']:.6f}, F1 delta is {selected['f1_delta_vs_original']:.6f}, and denominator near-zero count is {selected['denominator_near_zero_count']}.
4. **HLS status:** no sparse HLS variant has been generated or run yet. CSIM/CSYNTH and board feasibility are therefore not claimed.
5. **Next experiment:** generate mixed-fixed-point/feature-map/scheduling variants from the static Q/K indices in a copied HLS workspace, then admit only CSIM PASS variants to CSYNTH.

The 256 stored samples are used here for calibration and prediction-consistency checks. Their metrics are not presented as final PYNQ-Z2 board accuracy.
"""
display(Markdown(summary))
'''),
]

notebook = {
    "cells": cells,
    "metadata": {
        "kernelspec": {"display_name": "Python 3 (ipykernel)", "language": "python", "name": "python3"},
        "language_info": {"name": "python", "version": "3.10"},
    },
    "nbformat": 4,
    "nbformat_minor": 5,
}

for target in TARGETS:
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(json.dumps(notebook, indent=1, ensure_ascii=False), encoding="utf-8")
    print(target)
