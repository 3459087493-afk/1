#!/usr/bin/env python3
"""Lightweight inventory: names plus a bounded text prefix; never parse binaries fully."""
import csv
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent / "artifact_inventory.csv"
EXTS = {".csv", ".md", ".png", ".pdf", ".log", ".rpt", ".cpp", ".h"}
TEXT = {".csv", ".md", ".log", ".rpt", ".cpp", ".h"}


def yn(blob, terms):
    return "yes" if any(t in blob for t in terms) else "no"


def classify(path, blob):
    s = (str(path.relative_to(ROOT)) + " " + blob).lower()
    if "qks_v2" in s or "qksv2" in s:
        exp = "QKS-v2"
    elif "real_event_sparse" in s or "esla" in s:
        exp = "ESLA"
    elif "pynq_sparse_pareto" in s:
        exp = "legacy_sparse_pareto"
    elif "imgds" in s:
        exp = "IMG_DS"
    elif "linear_transformer" in s:
        exp = "Linear_Transformer_reference"
    else:
        exp = "unclear"
    if path.suffix.lower() in {".png", ".pdf"}:
        use = "figure_candidate"
    elif path.suffix.lower() == ".csv":
        use = "table_or_figure_data"
    elif path.suffix.lower() == ".md":
        use = "report_or_text"
    elif path.suffix.lower() == ".rpt":
        use = "HLS_or_Vivado_evidence"
    elif path.suffix.lower() in {".cpp", ".h"}:
        use = "implementation_evidence"
    else:
        use = "run_log"
    archive = "archive_before_real_event_sparse" in s
    generated_logo = path.name == "logo.png"
    usable = "no" if archive or generated_logo else ("yes" if exp != "unclear" else "review")
    notes = []
    if archive: notes.append("archived duplicate/read-only")
    if generated_logo: notes.append("tool logo; not a paper result")
    if "speedup" in s and ("500" in blob or "522" in blob or "562" in blob):
        notes.append("500x-class claim requires preliminary/non-strict label")
    return exp, use, usable, "; ".join(notes)


rows = []
for base in (ROOT / "results", ROOT / "experiments", ROOT / "real_event_sparse", ROOT / "vitis_hls"):
    for p in base.rglob("*"):
        if not p.is_file() or p.suffix.lower() not in EXTS:
            continue
        blob = ""
        if p.suffix.lower() in TEXT:
            try:
                with p.open("r", errors="ignore") as f:
                    blob = "".join(f.readline() for _ in range(40)).lower()
            except OSError:
                pass
        exp, use, usable, notes = classify(p, blob)
        nameblob = (p.name + " " + blob).lower()
        rows.append({
            "file_path": str(p.relative_to(ROOT)), "file_type": p.suffix.lower().lstrip("."),
            "likely_experiment": exp, "likely_use": use,
            "contains_accuracy": yn(nameblob, ["accuracy", "acc"]),
            "contains_precision_recall_f1": yn(nameblob, ["precision", "recall", "f1"]),
            "contains_latency": yn(nameblob, ["latency", "inference time", "runtime"]),
            "contains_resource": yn(nameblob, ["lut", "dsp", "bram", "resource", "utilization"]),
            "contains_hls_tripcount": yn(nameblob, ["trip count", "tripcount", "attn_dim"]),
            "contains_kernel_latency": yn(nameblob, ["kernel_latency", "kernel latency", "kernel_us"]),
            "contains_full_application_latency": yn(nameblob, ["full_application", "full application", "e2e_image"]),
            "contains_sparsity_info": yn(nameblob, ["sparsity", "sparse", "attn_dim"]),
            "usable_for_paper": usable, "notes": notes,
        })

fields = list(rows[0]) if rows else []
with OUT.open("w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=fields); w.writeheader(); w.writerows(rows)
print(f"wrote {len(rows)} rows to {OUT}")
