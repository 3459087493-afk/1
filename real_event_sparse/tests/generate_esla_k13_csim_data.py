#!/usr/bin/env python3
"""Generate binary CSIM vectors from the validated phi(K)-K13 reference."""

from __future__ import annotations

import struct
import sys
from pathlib import Path

import numpy as np
import torch


PROJECT_ROOT = Path(__file__).resolve().parents[2]
ESLA_ROOT = PROJECT_ROOT / "real_event_sparse"
sys.path.insert(0, str(ESLA_ROOT / "scripts"))
sys.path.insert(0, str(ESLA_ROOT / "pytorch"))

from run_esla_software_sweep import TEST_DATA, load_model  # noqa: E402
from esla_reference import (  # noqa: E402
    ESLASoftwareReference,
    compute_token_scores,
    select_active_tokens,
)


OUTPUT = ESLA_ROOT / "tests" / "esla_k13_csim_data.bin"
MAGIC = 0x45534C41
SEQ_LEN = 16
ACTIVE_TOKEN_NUM = 13


def main() -> None:
    test = np.load(TEST_DATA)
    inputs = torch.from_numpy(test["X"]).float()
    labels = np.asarray(test["y"], dtype=np.int32)
    reference = ESLASoftwareReference(load_model())
    dense_logits = reference.dense_forward(inputs).cpu().numpy().astype(np.float32)
    embeddings, raw_keys = reference.prepare_scoring_state(inputs)
    scores = compute_token_scores(raw_keys, "phi_k")
    selection = select_active_tokens(
        scores,
        "topk",
        target_active_ratio=ACTIVE_TOKEN_NUM / SEQ_LEN,
        min_active_tokens=1,
    )
    if not np.all(selection.active_token_num == ACTIVE_TOKEN_NUM):
        raise AssertionError("Python reference did not generate fixed K=13")
    sparse_logits = reference.compact_forward(
        embeddings, raw_keys, selection
    ).cpu().numpy().astype(np.float32)
    active_indices = np.stack(
        [idx.cpu().numpy() for idx in selection.active_indices], axis=0
    ).astype(np.int32)

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    with OUTPUT.open("wb") as handle:
        handle.write(struct.pack("<Ii", MAGIC, inputs.shape[0]))
        handle.write(np.asarray(inputs, dtype=np.float32).tobytes(order="C"))
        handle.write(labels.tobytes(order="C"))
        handle.write(sparse_logits.tobytes(order="C"))
        handle.write(dense_logits.tobytes(order="C"))
        handle.write(active_indices.tobytes(order="C"))
    print(f"Wrote {inputs.shape[0]} samples to {OUTPUT}")
    print(f"Python K13 accuracy={(np.argmax(sparse_logits, axis=1) == labels).mean():.9f}")


if __name__ == "__main__":
    main()

