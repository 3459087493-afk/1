import hashlib
import json
import shutil
import sys
from datetime import datetime, timezone
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import BASELINE_HLS, BASELINE_RESULTS, EXP_ROOT, PROJECT_ROOT, RESULTS_DIR, ensure_dir, write_json


OUTPUT_DIR = RESULTS_DIR / "baseline_snapshot"
SNAPSHOT_PATH = OUTPUT_DIR / "baseline_file_hashes.json"
INTEGRITY_PATH = OUTPUT_DIR / "baseline_integrity_check.json"
COPY_DIR = EXP_ROOT / "copied_baseline" / "unsw_linear_transformer_hls_float_copy"


FILES_TO_PROTECT = {
    "best_model.pt": BASELINE_RESULTS / "best_model.pt",
    "sample_inputs.npy": BASELINE_RESULTS / "sample_inputs.npy",
    "sample_labels.npy": BASELINE_RESULTS / "sample_labels.npy",
    "preprocess_info.json": BASELINE_RESULTS / "preprocess_info.json",
    "model_config.json": BASELINE_RESULTS / "model_config.json",
    "unsw_linear_transformer.cpp": BASELINE_HLS / "src" / "unsw_linear_transformer.cpp",
    "unsw_linear_transformer.h": BASELINE_HLS / "src" / "unsw_linear_transformer.h",
    "weights.h": BASELINE_HLS / "src" / "weights.h",
    "testbench.cpp": BASELINE_HLS / "src" / "testbench.cpp",
    "test_vectors.h": BASELINE_HLS / "src" / "test_vectors.h",
    "run_csim.tcl": BASELINE_HLS / "run_csim.tcl",
    "run_csynth.tcl": BASELINE_HLS / "run_csynth.tcl",
    "original_csynth.rpt": BASELINE_RESULTS
    / "hls"
    / "csynth"
    / "unsw_linear_transformer_csynth.rpt",
}


def sha256(path):
    digest = hashlib.sha256()
    with path.open("rb") as file:
        for chunk in iter(lambda: file.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def current_hashes():
    records = {}
    for label, path in FILES_TO_PROTECT.items():
        if not path.is_file():
            raise FileNotFoundError(f"Protected baseline file is missing: {path}")
        records[label] = {
            "path": str(path),
            "relative_path": str(path.relative_to(PROJECT_ROOT)),
            "sha256": sha256(path),
            "size_bytes": path.stat().st_size,
        }
    return records


def copy_source_baseline():
    if COPY_DIR.exists():
        shutil.rmtree(COPY_DIR)
    shutil.copytree(
        BASELINE_HLS,
        COPY_DIR,
        ignore=shutil.ignore_patterns("unsw_linear_transformer_prj", "vitis_hls.log", "*.jou"),
    )


def main():
    ensure_dir(OUTPUT_DIR)
    records = current_hashes()
    now = datetime.now(timezone.utc).isoformat()
    if SNAPSHOT_PATH.is_file():
        snapshot = json.loads(SNAPSHOT_PATH.read_text(encoding="utf-8"))
        expected = snapshot["files"]
        mismatches = {
            label: {
                "expected": expected[label]["sha256"],
                "current": records[label]["sha256"],
            }
            for label in expected
            if expected[label]["sha256"] != records[label]["sha256"]
        }
        integrity = {
            "checked_at_utc": now,
            "integrity_ok": not mismatches,
            "mismatches": mismatches,
            "checked_file_count": len(records),
        }
        write_json(INTEGRITY_PATH, integrity)
        if mismatches:
            raise RuntimeError(f"Protected baseline files changed: {mismatches}")
    else:
        snapshot = {
            "created_at_utc": now,
            "purpose": "Immutable baseline snapshot for Innovation 1 CSG-HALT",
            "files": records,
        }
        write_json(SNAPSHOT_PATH, snapshot)
        write_json(
            INTEGRITY_PATH,
            {
                "checked_at_utc": now,
                "integrity_ok": True,
                "mismatches": {},
                "checked_file_count": len(records),
            },
        )
    copy_source_baseline()
    print("Protected files:", len(records))
    print("Integrity OK: True")
    print("Snapshot:", SNAPSHOT_PATH)
    print("Source-level baseline copy:", COPY_DIR)


if __name__ == "__main__":
    main()
