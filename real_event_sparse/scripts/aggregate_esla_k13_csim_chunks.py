#!/usr/bin/env python3
"""Aggregate all chunked executions of the same Q16-ESLA-K13 CSIM binary."""

from __future__ import annotations

import csv
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "tests" / "esla_k13_csim_chunks" / "manifest.csv"
CHUNK_RESULTS = ROOT / "results" / "hls_csim_esla_k13_chunks"
OUTPUT = ROOT / "results" / "hls_csim_esla_k13_metrics.csv"
OUTPUT_LOG = ROOT / "results" / "hls_csim_esla_k13.log"


def main() -> None:
    with MANIFEST.open(newline="") as handle:
        manifest = list(csv.DictReader(handle))

    total = correct = py_match = dense_match = 0
    tp = fp = fn = 0
    nan_samples = inf_samples = 0
    error_sum = 0.0
    max_error = 0.0
    active_index_matches = 0.0
    template = None

    for item in manifest:
        path = CHUNK_RESULTS / item["filename"].replace(".bin", ".csv")
        if not path.exists():
            raise RuntimeError(f"Missing chunk result: {path}")
        with path.open(newline="") as handle:
            rows = list(csv.DictReader(handle))
        if len(rows) != 1:
            raise RuntimeError(f"Expected one row in {path}")
        row = rows[0]
        template = row
        n = int(item["end"]) - int(item["start"])
        positives = int(item["positive_labels"])
        negatives = n - positives
        accuracy = float(row["accuracy"])
        precision = float(row["precision"])
        recall = float(row["recall"])
        chunk_tp = int(round(recall * positives))
        chunk_fn = positives - chunk_tp
        chunk_fp = int(round(chunk_tp / precision - chunk_tp)) if precision else 0
        if chunk_fp < 0 or chunk_fp > negatives:
            raise RuntimeError(f"Invalid reconstructed FP count in {path}")

        total += n
        correct += int(round(accuracy * n))
        py_match += int(round(float(row["prediction_match_rate_vs_python_reference"]) * n))
        dense_match += int(round(float(row["prediction_match_rate_vs_dense"]) * n))
        tp += chunk_tp
        fp += chunk_fp
        fn += chunk_fn
        nan_samples += int(row["nan_samples"])
        inf_samples += int(row["inf_samples"])
        error_sum += float(row["mean_abs_error"]) * n * 2
        max_error = max(max_error, float(row["max_abs_error"]))
        active_index_matches += (
            float(row["active_index_element_match_rate"]) * n * 13
        )

    if total != 3444 or template is None:
        raise RuntimeError(f"Expected 3444 total samples, got {total}")
    precision = tp / (tp + fp) if tp + fp else 0.0
    recall = tp / (tp + fn) if tp + fn else 0.0
    f1 = 2 * precision * recall / (precision + recall) if precision + recall else 0.0

    final = dict(template)
    final.update(
        accuracy=correct / total,
        precision=precision,
        recall=recall,
        f1=f1,
        prediction_match_rate_vs_python_reference=py_match / total,
        prediction_match_rate_vs_dense=dense_match / total,
        max_abs_error=max_error,
        mean_abs_error=error_sum / (total * 2),
        nan_samples=nan_samples,
        inf_samples=inf_samples,
        active_index_element_match_rate=active_index_matches / (total * 13),
    )
    with OUTPUT.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=final.keys())
        writer.writeheader()
        writer.writerow(final)
    log = f"""Q16-ESLA-K13 faithful phi(K) HLS C simulation
====================================================
execution_mode=Vitis_HLS_csim_release_executable_chunked
chunk_reason=execution_environment_single_process_time_limit
chunks={len(manifest)}
samples={total}
dense_token_count={final['dense_token_count']}
active_token_count={final['active_token_count']}
skipped_token_count={final['skipped_token_count']}
dense_kv_mac_count={final['dense_kv_mac_count']}
esla_kv_mac_count={final['esla_kv_mac_count']}
dense_total_mac_estimate={final['dense_total_mac_estimate']}
esla_total_mac_estimate={final['esla_total_mac_estimate']}
mac_reduction_ratio={final['mac_reduction_ratio']}
dense_bram_read_proxy={final['dense_bram_read_proxy']}
esla_bram_read_proxy={final['esla_bram_read_proxy']}
bram_read_reduction_ratio={final['bram_read_reduction_ratio']}
accuracy={final['accuracy']}
precision={final['precision']}
recall={final['recall']}
f1={final['f1']}
prediction_match_rate_vs_python_reference={final['prediction_match_rate_vs_python_reference']}
prediction_match_rate_vs_dense={final['prediction_match_rate_vs_dense']}
active_index_element_match_rate={final['active_index_element_match_rate']}
max_abs_error={final['max_abs_error']}
mean_abs_error={final['mean_abs_error']}
nan_samples={final['nan_samples']}
inf_samples={final['inf_samples']}
all_chunk_status=CSIM_PASS
csynth_run=False
vivado_run=False
pynq_run=False
bitstream_generated=False
====================================================
"""
    OUTPUT_LOG.write_text(log)
    print(f"Aggregated {len(manifest)} chunks and {total} samples into {OUTPUT}")
    print(f"Wrote aggregate log to {OUTPUT_LOG}")


if __name__ == "__main__":
    main()
