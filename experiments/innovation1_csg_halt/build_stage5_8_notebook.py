import json
from pathlib import Path


PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
EXP_ROOT = PROJECT_ROOT / "experiments" / "innovation1_csg_halt"
TARGETS = (
    PROJECT_ROOT / "notebooks" / "UNSW_Innovation1_CSG_HALT_Stage5_8.ipynb",
    EXP_ROOT / "notebooks" / "UNSW_Innovation1_CSG_HALT_Stage5_8.ipynb",
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
    markdown("""# UNSW-NB15 Innovation 1: CSG-HALT Stage 5-8

This notebook is an orchestration and reporting entry point only. Core experiment logic is
implemented by standalone scripts under `experiments/innovation1_csg_halt/scripts`.

Run cells in order. A failed stage prints the last 100 log lines and raises an exception, so
later stages are not executed. CSYNTH itself reads CSIM results and skips every non-PASS variant.
"""),
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
HLS_VARIANTS_DIR = EXP_ROOT / "hls_variants"
LOG_DIR = EXP_ROOT / "logs" / "stage5_8_notebook"
LOG_DIR.mkdir(parents=True, exist_ok=True)
assert EXP_ROOT.exists()
"""),
    code("""def run_script(script_name):
    script = SCRIPT_DIR / script_name
    assert script.is_file(), f"Missing script: {script}"
    result = subprocess.run(
        [sys.executable, str(script)], cwd=PROJECT_ROOT, text=True, capture_output=True
    )
    combined = f"STDOUT:\\n{result.stdout}\\nSTDERR:\\n{result.stderr}"
    log_path = LOG_DIR / f"{script.stem}.log"
    log_path.write_text(combined, encoding="utf-8")
    if result.returncode != 0:
        print("\\n".join(combined.splitlines()[-100:]))
        raise RuntimeError(f"{script_name} failed; log={log_path}")
    print(result.stdout)
    print("Log:", log_path)


def show_markdown(path):
    display(Markdown(Path(path).read_text(encoding="utf-8")))
"""),
    markdown("## Stage 5a: Inspect copied float HLS source"),
    code("""run_script("04a_inspect_hls_attention_kernel.py")
show_markdown(RESULTS_DIR / "hls_generation" / "hls_source_map.md")
pd.json_normalize(json.loads(
    (RESULTS_DIR / "hls_generation" / "hls_source_map.json").read_text(encoding="utf-8")
))
"""),
    markdown("## Stage 5b: Generate isolated HLS variants"),
    code("""run_script("04b_generate_sparse_hls_variants.py")
pd.read_csv(RESULTS_DIR / "hls_generation" / "generated_variants.csv")
"""),
    markdown("## Stage 5c: Generate variant-specific PyTorch references"),
    code("""run_script("04c_generate_variant_reference_logits.py")
pd.read_csv(RESULTS_DIR / "hls_generation" / "reference_logits_summary.csv")
"""),
    markdown("## Stage 6: HLS CSIM"),
    code("""run_script("05_run_sparse_hls_csim.py")
display(pd.read_csv(RESULTS_DIR / "hls_csim" / "csim_results.csv"))
show_markdown(RESULTS_DIR / "hls_csim" / "csim_summary.md")
"""),
    markdown("## Stage 7: HLS CSYNTH (CSIM PASS variants only)"),
    code("""run_script("06_run_sparse_hls_csynth.py")
display(pd.read_csv(RESULTS_DIR / "hls_csynth" / "csynth_results.csv"))
show_markdown(RESULTS_DIR / "hls_csynth" / "csynth_summary.md")
"""),
    markdown("## Stage 8: Multi-objective candidate selection"),
    code("""run_script("07_select_candidate.py")
display(pd.read_csv(RESULTS_DIR / "final_selection" / "final_comparison_table.csv"))
show_markdown(RESULTS_DIR / "final_selection" / "final_selection_summary.md")
display(json.loads(
    (RESULTS_DIR / "final_selection" / "selected_candidate.json").read_text(encoding="utf-8")
))
"""),
    markdown("## Final integrity verification"),
    code("""run_script("08_verify_integrity_after_stage5_8.py")
display(json.loads(
    (RESULTS_DIR / "final_selection" / "integrity_after_stage5_8.json").read_text(encoding="utf-8")
))
"""),
]

notebook = {
    "cells": cells,
    "metadata": {
        "kernelspec": {
            "display_name": "Python 3 (ipykernel)",
            "language": "python",
            "name": "python3",
        },
        "language_info": {"name": "python", "version": "3.10"},
    },
    "nbformat": 4,
    "nbformat_minor": 5,
}
for target in TARGETS:
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(json.dumps(notebook, ensure_ascii=False, indent=1), encoding="utf-8")
    print(target)
