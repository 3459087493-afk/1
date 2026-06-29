import hashlib
import sys
from datetime import datetime, timezone
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import RESULTS_DIR, load_json, write_json


SNAPSHOT_PATH = RESULTS_DIR / "baseline_snapshot" / "baseline_file_hashes.json"
OUTPUT_PATH = RESULTS_DIR / "final_selection" / "integrity_after_stage5_8.json"


def sha256(path):
    digest = hashlib.sha256()
    with path.open("rb") as file:
        for chunk in iter(lambda: file.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main():
    snapshot = load_json(SNAPSHOT_PATH)
    records = []
    mismatches = []
    for label, expected in snapshot["files"].items():
        path = Path(expected["path"])
        exists = path.is_file()
        current = sha256(path) if exists else None
        matches = exists and current == expected["sha256"]
        record = {
            "label": label,
            "path": str(path),
            "expected_sha256": expected["sha256"],
            "current_sha256": current,
            "matches": matches,
        }
        records.append(record)
        if not matches:
            mismatches.append(record)
    result = {
        "checked_at_utc": datetime.now(timezone.utc).isoformat(),
        "integrity_ok": not mismatches,
        "message": (
            "Integrity OK: original baseline files unchanged."
            if not mismatches
            else "Integrity FAILED: protected baseline files changed."
        ),
        "mismatches": mismatches,
        "files": records,
    }
    write_json(OUTPUT_PATH, result)
    print(result["message"])
    print("Report:", OUTPUT_PATH)
    if mismatches:
        raise RuntimeError(f"Protected files changed: {mismatches}")


if __name__ == "__main__":
    main()
