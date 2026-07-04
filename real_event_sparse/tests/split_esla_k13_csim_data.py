#!/usr/bin/env python3
"""Split the generated 3444-sample CSIM binary without changing sample data."""

from __future__ import annotations

import struct
from pathlib import Path

import numpy as np


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "tests" / "esla_k13_csim_data.bin"
OUTPUT_DIR = ROOT / "tests" / "esla_k13_csim_chunks"
MAGIC = 0x45534C41
SEQ_LEN = 16
INPUT_DIM = 64
N_CLASSES = 2
ACTIVE_TOKEN_NUM = 13
CHUNK_SIZE = 400


def main() -> None:
    with SOURCE.open("rb") as handle:
        magic, count = struct.unpack("<Ii", handle.read(8))
        if magic != MAGIC:
            raise RuntimeError("Invalid source CSIM data magic")
        inputs = np.fromfile(
            handle, dtype=np.float32, count=count * SEQ_LEN * INPUT_DIM
        ).reshape(count, SEQ_LEN, INPUT_DIM)
        labels = np.fromfile(handle, dtype=np.int32, count=count)
        sparse_logits = np.fromfile(
            handle, dtype=np.float32, count=count * N_CLASSES
        ).reshape(count, N_CLASSES)
        dense_logits = np.fromfile(
            handle, dtype=np.float32, count=count * N_CLASSES
        ).reshape(count, N_CLASSES)
        indices = np.fromfile(
            handle, dtype=np.int32, count=count * ACTIVE_TOKEN_NUM
        ).reshape(count, ACTIVE_TOKEN_NUM)

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    manifest = []
    for start in range(0, count, CHUNK_SIZE):
        end = min(start + CHUNK_SIZE, count)
        path = OUTPUT_DIR / f"chunk_{start:04d}_{end:04d}.bin"
        with path.open("wb") as handle:
            handle.write(struct.pack("<Ii", MAGIC, end - start))
            handle.write(inputs[start:end].tobytes(order="C"))
            handle.write(labels[start:end].tobytes(order="C"))
            handle.write(sparse_logits[start:end].tobytes(order="C"))
            handle.write(dense_logits[start:end].tobytes(order="C"))
            handle.write(indices[start:end].tobytes(order="C"))
        manifest.append((path.name, start, end, int(labels[start:end].sum())))

    manifest_path = OUTPUT_DIR / "manifest.csv"
    with manifest_path.open("w") as handle:
        handle.write("filename,start,end,positive_labels\n")
        for filename, start, end, positives in manifest:
            handle.write(f"{filename},{start},{end},{positives}\n")
    print(f"Wrote {len(manifest)} chunks covering {count} samples")


if __name__ == "__main__":
    main()

