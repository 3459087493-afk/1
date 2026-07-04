"""Software reference for Q16-ESLA token-compacted Linear Attention.

The selection stage scores every token from K or phi(K). After selection, samples
are grouped by their exact active length and gathered into tensors of shape
[batch_with_same_length, active_len, d_model]. No padded dense tensor or zero
mask is used in the sparse attention path.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, List, Sequence, Tuple

import numpy as np
import torch
from torch import Tensor, nn


VALID_SCORE_TYPES = ("k", "phi_k")
VALID_SELECTION_TYPES = ("topk", "threshold")


@dataclass(frozen=True)
class SelectionResult:
    """Compacted token indices and their actual per-sample lengths."""

    active_indices: Tuple[Tensor, ...]
    active_token_num: np.ndarray


def feature_map(x: Tensor) -> Tensor:
    """The feature map used by the dense Linear Transformer."""

    return torch.nn.functional.elu(x) + 1.0


def compute_token_scores(k: Tensor, score_type: str) -> Tensor:
    """Return one importance score per token from K or phi(K)."""

    if score_type == "k":
        score_source = k
    elif score_type == "phi_k":
        score_source = feature_map(k)
    else:
        raise ValueError(f"Unknown score_type={score_type!r}; expected {VALID_SCORE_TYPES}")
    return score_source.abs().mean(dim=-1)


def select_active_tokens(
    scores: Tensor,
    selection_type: str,
    *,
    target_active_ratio: float,
    threshold: float | None = None,
    min_active_tokens: int = 1,
) -> SelectionResult:
    """Build an ordered active-token list for every sample.

    Top-k uses ceil(ratio * sequence length). Threshold selection keeps every
    score >= threshold and falls back to the highest-scoring tokens only when
    fewer than min_active_tokens survive. Returned indices are sorted into
    original token order before compaction.
    """

    if scores.ndim != 2:
        raise ValueError(f"Expected scores [batch, seq], got {tuple(scores.shape)}")
    if not 0.0 < target_active_ratio <= 1.0:
        raise ValueError("target_active_ratio must be in (0, 1]")
    if min_active_tokens < 1 or min_active_tokens > scores.shape[1]:
        raise ValueError("min_active_tokens must be between 1 and sequence length")

    seq_len = scores.shape[1]
    active: List[Tensor] = []

    if selection_type == "topk":
        k = max(min_active_tokens, int(np.ceil(target_active_ratio * seq_len)))
        k = min(k, seq_len)
        for row in scores:
            idx = torch.topk(row, k=k, largest=True, sorted=False).indices
            active.append(torch.sort(idx).values)
    elif selection_type == "threshold":
        if threshold is None or not np.isfinite(threshold):
            raise ValueError("A finite threshold is required for threshold selection")
        for row in scores:
            idx = torch.nonzero(row >= threshold, as_tuple=False).flatten()
            if idx.numel() < min_active_tokens:
                idx = torch.topk(
                    row, k=min_active_tokens, largest=True, sorted=False
                ).indices
            active.append(torch.sort(idx).values)
    else:
        raise ValueError(
            f"Unknown selection_type={selection_type!r}; "
            f"expected {VALID_SELECTION_TYPES}"
        )

    counts = np.asarray([idx.numel() for idx in active], dtype=np.int64)
    return SelectionResult(tuple(active), counts)


def calibrate_threshold(calibration_scores: Tensor, target_active_ratio: float) -> float:
    """Choose a global threshold from an unlabeled calibration score percentile."""

    if not 0.0 < target_active_ratio <= 1.0:
        raise ValueError("target_active_ratio must be in (0, 1]")
    percentile = 100.0 * (1.0 - target_active_ratio)
    return float(np.percentile(calibration_scores.detach().cpu().numpy(), percentile))


class ESLASoftwareReference:
    """Run dense scoring followed by genuinely compacted token computation."""

    def __init__(self, dense_model: nn.Module):
        self.model = dense_model.eval()
        if len(self.model.layers) != 1:
            raise ValueError("This reference currently supports exactly one encoder layer")

    @torch.no_grad()
    def dense_forward(self, inputs: Tensor, batch_size: int = 256) -> Tensor:
        outputs = []
        for start in range(0, inputs.shape[0], batch_size):
            outputs.append(self.model(inputs[start : start + batch_size]))
        return torch.cat(outputs, dim=0)

    @torch.no_grad()
    def prepare_scoring_state(
        self, inputs: Tensor, batch_size: int = 256
    ) -> Tuple[Tensor, Tensor]:
        """Compute the mandatory dense scoring stage: embedding and raw K."""

        embeddings = []
        keys = []
        attention = self.model.layers[0].attention
        for start in range(0, inputs.shape[0], batch_size):
            batch = inputs[start : start + batch_size]
            emb = self.model.input_projection(batch) + self.model.position_embedding
            embeddings.append(emb)
            keys.append(attention.key(emb))
        return torch.cat(embeddings, dim=0), torch.cat(keys, dim=0)

    @torch.no_grad()
    def compact_forward(
        self,
        embeddings: Tensor,
        raw_keys: Tensor,
        selection: SelectionResult,
        batch_size: int = 256,
    ) -> Tensor:
        """Run the model after selection only on physically compacted tokens.

        Samples are grouped by exact active length. Each group is gathered to a
        contiguous [group, active_len, d_model] tensor, so no inactive or padded
        token enters Q/V, attention, output projection, norms, FFN, or pooling.
        """

        if embeddings.shape != raw_keys.shape:
            raise ValueError("embeddings and raw_keys must have identical [N,S,D] shape")
        if embeddings.shape[0] != len(selection.active_indices):
            raise ValueError("Selection sample count does not match scoring state")

        result = torch.empty(
            (embeddings.shape[0], self.model.classifier.out_features),
            dtype=embeddings.dtype,
            device=embeddings.device,
        )
        groups: Dict[int, List[int]] = {}
        for sample_id, active_len in enumerate(selection.active_token_num.tolist()):
            groups.setdefault(int(active_len), []).append(sample_id)

        for active_len, sample_ids in sorted(groups.items()):
            if active_len <= 0 or active_len > embeddings.shape[1]:
                raise AssertionError(f"Invalid compacted active_len={active_len}")
            for start in range(0, len(sample_ids), batch_size):
                ids = sample_ids[start : start + batch_size]
                sample_tensor = torch.as_tensor(ids, dtype=torch.long, device=embeddings.device)
                index = torch.stack(
                    [selection.active_indices[i] for i in ids], dim=0
                ).to(device=embeddings.device)
                gather_index = index.unsqueeze(-1).expand(-1, -1, embeddings.shape[-1])
                compact_emb = torch.gather(embeddings[sample_tensor], 1, gather_index)
                compact_k = torch.gather(raw_keys[sample_tensor], 1, gather_index)
                if compact_emb.shape[1] != active_len:
                    raise AssertionError("Compaction produced an unexpected token dimension")
                result[sample_tensor] = self._forward_compacted(compact_emb, compact_k)
        return result

    def _forward_compacted(self, emb: Tensor, raw_k: Tensor) -> Tensor:
        attention = self.model.layers[0].attention
        layer = self.model.layers[0]

        query = feature_map(attention.query(emb))
        key = feature_map(raw_k)
        value = attention.value(emb)
        key_value = torch.matmul(key.transpose(-2, -1), value)
        key_sum = key.sum(dim=1).unsqueeze(-1)
        normalizer = torch.matmul(query, key_sum).clamp_min(attention.eps)
        attended = torch.matmul(query, key_value) / normalizer

        x = layer.norm1(emb + layer.dropout(attention.output(attended)))
        x = layer.norm2(x + layer.dropout(layer.feedforward(x)))
        pooled = self.model.output_norm(x.mean(dim=1))
        return self.model.classifier(pooled)


def estimated_mac_reduction(
    mean_active_tokens: float,
    *,
    seq_len: int,
    input_dim: int,
    d_model: int,
    ff_dim: int,
    num_classes: int,
) -> float:
    """Estimate MAC reduction while charging dense embedding+K scoring overhead.

    Dense scoring is unavoidable for the requested K/phi(K) importance scores.
    The selected K is reused, while Q, V, attention, output projection, FFN and
    active-token pooling operate on the compacted token count.
    """

    s = float(seq_len)
    t = float(mean_active_tokens)
    i = float(input_dim)
    d = float(d_model)
    f = float(ff_dim)
    c = float(num_classes)

    dense = (
        s * d * i
        + 3.0 * s * d * d
        + s * d * d
        + s * d
        + s * d * d
        + s * d * d
        + 2.0 * s * d * f
        + c * d
    )
    sparse = (
        s * d * i
        + s * d * d  # dense K scoring
        + 2.0 * t * d * d  # compact Q and V; selected K is reused
        + t * d * d
        + t * d
        + t * d * d
        + t * d * d
        + 2.0 * t * d * f
        + c * d
    )
    return float(max(0.0, 1.0 - sparse / dense))

