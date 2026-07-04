#!/usr/bin/env python3
"""Auto-generate the Stage 1 summary Jupyter notebook.

Reads all CSV/PNG/MD outputs from Stage 1 and assembles them into a
self-contained .ipynb file that can be opened directly in Jupyter.
"""

import json
from pathlib import Path

PROJECT_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
EXPERIMENT_DIR = PROJECT_ROOT / "experiments" / "imgds_linear_sparse"
NOTEBOOK_DIR = PROJECT_ROOT / "notebooks"
NOTEBOOK_PATH = NOTEBOOK_DIR / "IMGDS_Linear_Dense_Baseline.ipynb"

# Paths to include
AUDIT_CSV = EXPERIMENT_DIR / "results" / "imgds_audit.csv"
AUDIT_MD = EXPERIMENT_DIR / "reports" / "imgds_audit.md"
PATCH_REPORT_MD = EXPERIMENT_DIR / "reports" / "imgds_patch_split_report.md"
TRAIN_METRICS_CSV = EXPERIMENT_DIR / "results" / "train_metrics.csv"
TEST_METRICS_CSV = EXPERIMENT_DIR / "results" / "test_metrics.csv"
CONFUSION_CSV = EXPERIMENT_DIR / "results" / "confusion_matrix.csv"
TRAINING_CURVES_PNG = EXPERIMENT_DIR / "figures" / "training_curves.png"
ONNX_EXPORT_MD = EXPERIMENT_DIR / "onnx" / "reports" / "onnx_export_report.md"
ONNX_VALIDATION_MD = EXPERIMENT_DIR / "onnx" / "reports" / "onnx_validation_report.md"
ONNX_GRAPH_CSV = EXPERIMENT_DIR / "onnx" / "reports" / "onnx_graph_stats.csv"
ONNX_METRICS_CSV = EXPERIMENT_DIR / "results" / "onnx_metrics.csv"
ONNX_PYTORCH_DIFF_CSV = EXPERIMENT_DIR / "results" / "onnx_pytorch_diff.csv"
CPU_BREAKDOWN_CSV = EXPERIMENT_DIR / "results" / "cpu_end_to_end_breakdown.csv"
REFERENCE_CSV = EXPERIMENT_DIR / "results" / "reference_baselines.csv"
SUMMARY_CSV = EXPERIMENT_DIR / "results" / "stage1_summary_table.csv"


def make_cell(cell_type, source, cell_id=None):
    """Create a Jupyter notebook cell dict."""
    import uuid
    cid = cell_id or str(uuid.uuid4())[:8]
    if isinstance(source, str):
        source = [source]
    return {
        "cell_type": cell_type,
        "metadata": {},
        "source": source,
        "id": cid,
        "outputs": [],
        "execution_count": None,
    }


def read_file_lines(path: Path) -> str:
    """Read file as a python multi-line string."""
    if not path.exists():
        return f"# (File not found: {path})"
    with open(path) as f:
        content = f.read()
    return content


def read_file_raw(path):
    if path.exists():
        with open(path) as f:
            return f.read()
    return f"File not found: {path}"


def csv_display_code(path, title):
    """Generate code cell that reads and displays a CSV as DataFrame."""
    if not path.exists():
        return [f"# {title}\n", f"# CSV not found: {path}\n"]
    return [
        f"# {title}\n",
        f"import pandas as pd\n",
        f"from pathlib import Path\n",
        f"df = pd.read_csv(r'{path}')\n",
        f"print(f'Rows: {{len(df)}}')\n",
        f"df.head(50)\n",
    ]


def md_display_code(path, title):
    """Generate code to display a markdown file."""
    if not path.exists():
        return [f"# {title} — file not found\n"]
    return [
        f"# {title}\n",
        f"from IPython.display import Markdown, display\n",
        f"from pathlib import Path\n",
        f"with open(r'{path}') as f:\n",
        f"    md_text = f.read()\n",
        f"display(Markdown(md_text))\n",
    ]


def png_display_code(path, title):
    """Generate code to display a PNG."""
    if not path.exists():
        return [f"# {title} — file not found\n"]
    return [
        f"# {title}\n",
        f"from IPython.display import Image, display\n",
        f"display(Image(filename=r'{path}'))\n",
    ]


def main():
    NOTEBOOK_DIR.mkdir(parents=True, exist_ok=True)

    cells = []

    # ---- Cell 1: Title ----
    cells.append(make_cell("markdown", [
        "# IMG_DS Linear Transformer Dense Baseline with ONNX Export\n",
        "\n",
        "**Stage 1: Dense Software Baseline + ONNX Export**\n",
        "\n",
        "This notebook summarizes the complete Stage 1 pipeline:\n",
        "1. IMG_DS dataset audit\n",
        "2. Patch data generation (32×32 grayscale → 16 patches of 64 dims)\n",
        "3. Linear Transformer dense baseline training\n",
        "4. Best checkpoint selection\n",
        "5. ONNX export\n",
        "6. ONNX Runtime numerical validation\n",
        "7. CPU end-to-end latency breakdown\n",
        "8. ViT4Mal reference comparison\n",
        "9. Stage 1 summary table\n",
    ]))

    # ---- Cell 2: Experiment Goals ----
    cells.append(make_cell("markdown", [
        "## Experiment Goals\n",
        "\n",
        "| Aspect | Stage 1 | Future Stages |\n",
        "|--------|---------|---------------|\n",
        "| Quantization | ❌ FP32 only | Stage 3: 4/8/16/32 bit |\n",
        "| Sparsity | ❌ Dense only | Stage 4: 0-100% sparse |\n",
        "| HLS Synthesis | ❌ Not performed | Stage 5 |\n",
        "| PYNQ Deployment | ❌ Not performed | Stage 6 |\n",
        "| ONNX Export | ✅ Complete | — |\n",
        "| Software Baseline | ✅ Complete | — |\n",
        "\n",
        "**This stage produces a verified dense software baseline with ONNX export for reference in all later stages.**\n",
    ]))

    # ---- Cell 3: Setup & imports ----
    cells.append(make_cell("code", [
        "import sys\n",
        "from pathlib import Path\n",
        "import pandas as pd\n",
        "import numpy as np\n",
        "import matplotlib.pyplot as plt\n",
        "from IPython.display import Markdown, Image, display\n",
        "\n",
        f"PROJECT_ROOT = Path(r'{PROJECT_ROOT}')\n",
        f"EXP_DIR = Path(r'{EXPERIMENT_DIR}')\n",
        "print(f'Project root: {PROJECT_ROOT}')\n",
        "print(f'Experiment dir: {EXP_DIR}')\n",
    ]))

    # ---- Cell 4: Dataset Audit ----
    cells.append(make_cell("markdown", [
        "## 1. IMG_DS Dataset Audit\n",
        "\n",
        "The IMG_DS dataset comes from the ViT4Mal paper (IoT-android mobile dataset). "
        "Original images are approximately 299×299 RGB. Below is the audit of the dataset as found on disk.\n",
    ]))
    cells.append(make_cell("code", csv_display_code(AUDIT_CSV, "Audit CSV")))
    cells.append(make_cell("code", md_display_code(AUDIT_MD, "Audit Report")))

    # ---- Cell 5: Patch Configuration ----
    cells.append(make_cell("markdown", [
        "## 2. Patch Configuration\n",
        "\n",
        "Images are converted to **grayscale**, resized to **32×32**, and split into **8×8 patches**, "
        "yielding **16 tokens** of **64 dimensions** each.\n",
        "\n",
        "```\n",
        "Raw IMG_DS image\n",
        "  → grayscale\n",
        "  → resize to 32×32\n",
        "  → cut into 8×8 patches\n",
        "  → each image → 16 tokens\n",
        "  → each token → 64 dimensions\n",
        "  → Linear Transformer input shape = [N, 16, 64]\n",
        "```\n",
    ]))
    cells.append(make_cell("code", md_display_code(PATCH_REPORT_MD, "Patch Split Report")))

    # ---- Cell 6: Training Curves ----
    cells.append(make_cell("markdown", [
        "## 3. Training Curves\n",
    ]))
    cells.append(make_cell("code", png_display_code(TRAINING_CURVES_PNG, "Training Curves")))
    cells.append(make_cell("code", csv_display_code(TRAIN_METRICS_CSV, "Training Metrics")))

    # ---- Cell 7: Test Results ----
    cells.append(make_cell("markdown", [
        "## 4. Test Set Results\n",
    ]))
    cells.append(make_cell("code", csv_display_code(TEST_METRICS_CSV, "Test Metrics")))
    cells.append(make_cell("code", csv_display_code(CONFUSION_CSV, "Confusion Matrix")))

    # ---- Cell 8: ONNX Export ----
    cells.append(make_cell("markdown", [
        "## 5. ONNX Export\n",
    ]))
    cells.append(make_cell("code", md_display_code(ONNX_EXPORT_MD, "ONNX Export Report")))

    # ---- Cell 9: ONNX Validation ----
    cells.append(make_cell("markdown", [
        "## 6. ONNX Validation\n",
        "\n",
        "Comparing PyTorch and ONNX Runtime logits to verify numerical correctness.\n",
    ]))
    cells.append(make_cell("code", md_display_code(ONNX_VALIDATION_MD, "ONNX Validation Report")))
    cells.append(make_cell("code", csv_display_code(ONNX_GRAPH_CSV, "ONNX Graph Stats")))
    cells.append(make_cell("code", csv_display_code(ONNX_METRICS_CSV, "ONNX Runtime Metrics")))
    cells.append(make_cell("code", csv_display_code(ONNX_PYTORCH_DIFF_CSV, "PyTorch vs ONNX Logit Differences")))

    # ---- Cell 10: CPU Latency ----
    cells.append(make_cell("markdown", [
        "## 7. CPU End-to-End Latency Breakdown\n",
        "\n",
        "⚠️  These are **CPU** measurements, not PYNQ-Z2 FPGA timing. "
        "FPGA latency will be measured in Stage 6 after HLS synthesis and PYNQ deployment.\n",
    ]))
    cells.append(make_cell("code", csv_display_code(CPU_BREAKDOWN_CSV, "CPU End-to-End Breakdown")))

    # ---- Cell 11: ViT4Mal Reference ----
    cells.append(make_cell("markdown", [
        "## 8. ViT4Mal Reference Baselines\n",
        "\n",
        "From ViT4Mal Table 13 — IMG_DS on PYNQ-Z1 with 16-bit quantization and dense ViT attention.\n",
    ]))
    cells.append(make_cell("code", csv_display_code(REFERENCE_CSV, "ViT4Mal Reference")))

    # ---- Cell 12: Summary Table ----
    cells.append(make_cell("markdown", [
        "## 9. Stage 1 Summary Table\n",
    ]))
    cells.append(make_cell("code", csv_display_code(SUMMARY_CSV, "Stage 1 Summary Table")))

    # ---- Cell 13: Next Stages ----
    cells.append(make_cell("markdown", [
        "## 10. Next Stages\n",
        "\n",
        "| Stage | Description | Status |\n",
        "|-------|-------------|--------|\n",
        "| Stage 1 | Dense software baseline + ONNX export | ✅ Complete |\n",
        "| Stage 2 | Input resolution ablation (32×32 vs 64×64 vs 128×128) | 🔜 Planned |\n",
        "| Stage 3 | Quantization sweep (4/8/16/32 bit) | 🔜 Planned |\n",
        "| Stage 4 | Sparse linear attention (0/10/30/50/70/90/100%) | 🔜 Planned |\n",
        "| Stage 5 | HLS resource estimation and latency | 🔜 Planned |\n",
        "| Stage 6 | PYNQ-Z2 board-level end-to-end evaluation | 🔜 Planned |\n",
        "\n",
        "### Target Pareto Analysis\n",
        "\n",
        "Final deliverables will include:\n",
        "- **Accuracy vs LUT** plot (comparing our Linear Transformer with ViT4Mal)\n",
        "- **Accuracy vs Latency** plot (comparing CPU baseline, HLS estimate, and PYNQ measured)\n",
        "- All configurations swept across quantization levels and sparsity ratios.\n",
    ]))

    # ---- Build notebook JSON ----
    notebook = {
        "nbformat": 4,
        "nbformat_minor": 5,
        "metadata": {
            "kernelspec": {
                "display_name": "Python 3",
                "language": "python",
                "name": "python3",
            },
            "language_info": {
                "name": "python",
                "version": "3.10.0",
            },
        },
        "cells": cells,
    }

    with open(NOTEBOOK_PATH, "w") as f:
        json.dump(notebook, f, indent=1)
    print(f"Notebook saved: {NOTEBOOK_PATH}")
    print(f"  Cells: {len(cells)}")
    print("Notebook generation complete ✓")


if __name__ == "__main__":
    main()
