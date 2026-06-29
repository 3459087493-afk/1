import json
from pathlib import Path


PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
EXP_ROOT = PROJECT_ROOT / "experiments" / "innovation1_csg_halt"
STAGE9_ROOT = EXP_ROOT / "stage9_second_round"
TARGETS = (
    PROJECT_ROOT / "notebooks" / "UNSW_Innovation1_CSG_HALT_Stage9.ipynb",
    STAGE9_ROOT / "notebooks" / "UNSW_Innovation1_CSG_HALT_Stage9.ipynb",
)


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
    markdown("""# UNSW-NB15 Innovation 1: CSG-HALT Stage 9

Resource failure diagnosis and second-round candidate planning. Core logic is implemented in
standalone scripts. This notebook does not generate HLS or run CSIM, CSYNTH, Vivado, export IP,
or board execution.
"""),
    code("""from pathlib import Path
import subprocess
import sys
import pandas as pd
from IPython.display import Markdown, display

PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
EXP_ROOT = PROJECT_ROOT / "experiments" / "innovation1_csg_halt"
STAGE9_ROOT = EXP_ROOT / "stage9_second_round"
SCRIPT_DIR = STAGE9_ROOT / "scripts"
RESULTS_DIR = STAGE9_ROOT / "results"
LOG_DIR = STAGE9_ROOT / "logs" / "notebook"
LOG_DIR.mkdir(parents=True, exist_ok=True)

def run_script(name):
    result = subprocess.run(
        [sys.executable, str(SCRIPT_DIR / name)], cwd=PROJECT_ROOT,
        text=True, capture_output=True
    )
    combined = result.stdout + "\n" + result.stderr
    (LOG_DIR / f"{Path(name).stem}.log").write_text(combined, encoding="utf-8")
    if result.returncode:
        print("\n".join(combined.splitlines()[-100:]))
        raise RuntimeError(f"{name} failed")
    print(result.stdout)

def show_md(path):
    display(Markdown(Path(path).read_text(encoding="utf-8")))
"""),
    markdown("## Stage 5-8 Current Results"),
    code("""display(pd.read_csv(EXP_ROOT / "results" / "final_selection" / "final_comparison_table.csv"))
"""),
    markdown("## Stage 9A: Resource Failure Diagnosis"),
    code("""run_script("09a_resource_failure_diagnosis.py")
show_md(RESULTS_DIR / "diagnosis" / "stage9_resource_diagnosis.md")
"""),
    markdown("## Stage 9B: Official-Test Active-Ratio Sweep"),
    code("""run_script("09b_eval_more_active_ratios.py")
sweep = pd.read_csv(RESULTS_DIR / "active_ratio_sweep" / "stage9_active_ratio_eval.csv")
display(sweep)
show_md(RESULTS_DIR / "active_ratio_sweep" / "stage9_active_ratio_summary.md")
"""),
    markdown("## Stage 9C: Second-Round HLS Plan"),
    code("""run_script("09c_plan_second_round_hls.py")
show_md(RESULTS_DIR / "hls_plan" / "stage9_second_round_hls_plan.md")
"""),
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
    target.write_text(json.dumps(notebook, ensure_ascii=False, indent=1), encoding="utf-8")
    print(target)
