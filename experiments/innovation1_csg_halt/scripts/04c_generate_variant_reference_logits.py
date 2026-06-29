import re
import sys
from pathlib import Path

import numpy as np
import pandas as pd
import torch


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from common import (
    EXP_ROOT,
    RESULTS_DIR,
    classification_metrics,
    compare_to_original,
    denominator_statistics,
    ensure_dir,
    extract_linear_attention_tensors,
    finish_forward,
    load_json,
    load_model,
    load_samples,
    write_json,
)


VARIANTS_DIR = EXP_ROOT / "hls_variants"
OUTPUT_DIR = RESULTS_DIR / "hls_generation"
REFERENCE_DIR = OUTPUT_DIR / "reference_logits"
ACTIVE_SET_PATH = RESULTS_DIR / "active_channel_selection" / "active_channel_sets.json"
REFERENCE_NAMES = {
    "v00_float_reference": "original_float_reference_logits.npy",
    "v01_static_sparse_87p5_float": "static_sparse_87p5_float_reference_logits.npy",
    "v02_sparse_87p5_mixed_fixed": "sparse_87p5_mixed_fixed_reference_logits.npy",
    "v03_full_csg_halt": "full_csg_halt_reference_logits.npy",
}


def static_masks(tensors, q_channels, k_channels):
    q_mask = torch.zeros_like(tensors["phi_q"], dtype=torch.bool)
    k_mask = torch.zeros_like(tensors["phi_k"], dtype=torch.bool)
    q_mask[:, :, q_channels] = True
    k_mask[:, :, k_channels] = True
    return q_mask, k_mask


def pwl_elu_plus_one(values):
    return torch.where(
        values >= 0,
        values + 1.0,
        torch.where(
            values >= -1,
            1.0 + 0.63212056 * values,
            torch.where(
                values >= -2,
                0.6004236 + 0.2325442 * values,
                torch.full_like(values, 0.1353353),
            ),
        ),
    )


def replace_test_references(path, logits):
    text = path.read_text(encoding="utf-8")
    selected = np.asarray(logits[:16], dtype=np.float32)
    predictions = selected.argmax(axis=1)
    logits_rows = ",\n".join(
        "    {" + ", ".join(f"{float(value):.9e}f" for value in row) + "}" for row in selected
    )
    logits_block = f"static const float expected_logits[16][2] = {{\n{logits_rows}\n}};"
    text, logits_count = re.subn(
        r"static const float expected_logits\[16\]\[2\] = \{.*?\n\};",
        logits_block,
        text,
        count=1,
        flags=re.DOTALL,
    )
    prediction_block = (
        "static const int expected_predictions[UNSW_NUM_TEST_SAMPLES] = {"
        + ", ".join(map(str, predictions.tolist()))
        + "};"
    )
    text, prediction_count = re.subn(
        r"static const int expected_predictions\[UNSW_NUM_TEST_SAMPLES\] = \{.*?\};",
        prediction_block,
        text,
        count=1,
    )
    if logits_count != 1 or prediction_count != 1:
        raise RuntimeError(f"Could not update test references in {path}")
    path.write_text(text, encoding="utf-8")


def main():
    ensure_dir(REFERENCE_DIR)
    active_document = load_json(ACTIVE_SET_PATH)
    active = active_document["sets"]["active_87p5"]
    model, _, _ = load_model()
    inputs, labels = load_samples(limit=256)
    tensors = extract_linear_attention_tensors(model, inputs)
    original_logits = model(inputs).detach().cpu().numpy()
    q_mask, k_mask = static_masks(tensors, active["q_channels"], active["k_channels"])
    sparse_output = finish_forward(model, tensors, q_mask=q_mask, k_mask=k_mask)
    sparse_logits = sparse_output["logits"].cpu().numpy()

    pwl_tensors = dict(tensors)
    pwl_tensors["phi_q"] = pwl_elu_plus_one(tensors["query_raw"])
    pwl_tensors["phi_k"] = pwl_elu_plus_one(tensors["key_raw"])
    pwl_output = finish_forward(model, pwl_tensors, q_mask=q_mask, k_mask=k_mask)
    pwl_logits = pwl_output["logits"].cpu().numpy()
    original_output = finish_forward(model, tensors)

    references = {
        "v00_float_reference": (original_logits, original_output["denominator_raw"], "exact_float"),
        "v01_static_sparse_87p5_float": (
            sparse_logits,
            sparse_output["denominator_raw"],
            "exact_static_sparse_float",
        ),
        "v02_sparse_87p5_mixed_fixed": (
            sparse_logits,
            sparse_output["denominator_raw"],
            "static_sparse_proxy_for_mixed_fixed",
        ),
        "v03_full_csg_halt": (
            pwl_logits,
            pwl_output["denominator_raw"],
            "exact_three_segment_pwl_float_proxy_before_ap_fixed",
        ),
    }
    rows = []
    metadata = {}
    for variant, (logits, denominator, reference_mode) in references.items():
        reference_path = REFERENCE_DIR / REFERENCE_NAMES[variant]
        np.save(reference_path, np.asarray(logits, dtype=np.float32))
        _, metrics = compare_to_original(labels, original_logits, logits)
        metrics_without_matrix = dict(metrics)
        metrics_without_matrix.pop("confusion_matrix")
        denominator_stats = denominator_statistics(denominator)
        rows.append(
            {
                "variant": variant,
                "reference_file": str(reference_path),
                "num_samples": len(labels),
                **metrics_without_matrix,
            }
        )
        metadata[variant] = {
            "reference_mode": reference_mode,
            "reference_file": str(reference_path),
            "confusion_matrix": metrics["confusion_matrix"],
            **denominator_stats,
            "csim_tolerance": 1e-2 if variant in (
                "v02_sparse_87p5_mixed_fixed",
                "v03_full_csg_halt",
            ) else 1e-3,
        }
        test_vectors = VARIANTS_DIR / variant / "src" / "test_vectors.h"
        if not test_vectors.is_file():
            raise FileNotFoundError(f"Run 04b first; missing {test_vectors}")
        replace_test_references(test_vectors, logits)

    frame = pd.DataFrame(rows)
    frame.to_csv(OUTPUT_DIR / "reference_logits_summary.csv", index=False)
    original_metrics = classification_metrics(labels, original_logits)
    original_metrics.pop("predictions")
    write_json(
        OUTPUT_DIR / "reference_logits_metadata.json",
        {
            "samples": len(labels),
            "original_metrics": original_metrics,
            "variants": metadata,
            "mixed_fixed_note": (
                "v02 uses the static sparse float reference as an allowed pre-CSIM proxy; "
                "the ap_fixed implementation must pass the 1e-2 CSIM tolerance."
            ),
        },
    )
    print(frame.to_string(index=False))
    print("Reference logits:", REFERENCE_DIR)


if __name__ == "__main__":
    main()
