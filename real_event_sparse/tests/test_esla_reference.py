"""Small invariants for the Q16-ESLA software compaction path."""

import sys
from pathlib import Path

import torch


sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "pytorch"))

from esla_reference import compute_token_scores, select_active_tokens


def test_topk_returns_compacted_sorted_indices() -> None:
    scores = torch.tensor([[0.1, 0.9, 0.2, 0.8]])
    result = select_active_tokens(
        scores, "topk", target_active_ratio=0.5, min_active_tokens=1
    )
    assert result.active_token_num.tolist() == [2]
    assert result.active_indices[0].tolist() == [1, 3]


def test_threshold_never_returns_empty_list() -> None:
    scores = torch.tensor([[0.1, 0.2, 0.3, 0.4]])
    result = select_active_tokens(
        scores,
        "threshold",
        target_active_ratio=0.5,
        threshold=1.0,
        min_active_tokens=1,
    )
    assert result.active_token_num.tolist() == [1]
    assert result.active_indices[0].tolist() == [3]


def test_k_and_phi_k_scores_have_token_shape() -> None:
    raw_k = torch.randn(3, 5, 7)
    assert compute_token_scores(raw_k, "k").shape == (3, 5)
    assert compute_token_scores(raw_k, "phi_k").shape == (3, 5)

