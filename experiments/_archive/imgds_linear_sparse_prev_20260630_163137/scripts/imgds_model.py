#!/usr/bin/env python3
"""Model wrapper for IMG_DS Linear Transformer Dense Baseline.

Wraps LinearUNSWAnomalyDetector from src/transformer.py without modifying
the original source. Adds ONNX-export compatibility and config hooks for
future quantization/sparsity stages.
"""

import sys
from pathlib import Path

import torch
import torch.nn as nn

# Ensure project root is on sys.path so `import src` works.
_PROJECT_ROOT = Path(__file__).resolve().parents[3]
if str(_PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(_PROJECT_ROOT))

from src.transformer import LinearUNSWAnomalyDetector  # noqa: E402


class LinearIMGDSDenseBaseline(nn.Module):
    """Linear Transformer classifier for IMG_DS patch sequences.

    Input:  [batch, 16, 64]  — 16 patches of 8×8 grayscale pixels flattened.
    Output: [batch, 2]       — logits for Benign (0) / Malware (1).

    Parameters reserved for future stages (not active in Stage 1):
        quant_bits:  None (Stage 1) or int for activation quantization.
        sparsity:    0 (Stage 1) or float for sparse attention ratio.
        return_features: If True, also return the pooled feature vector.
    """

    def __init__(
        self,
        input_dim: int = 64,
        seq_len: int = 16,
        d_model: int = 16,
        dim_feedforward: int = 32,
        num_layers: int = 1,
        dropout: float = 0.1,
        num_classes: int = 2,
        quant_bits: int | None = None,
        sparsity: float = 0.0,
        return_features: bool = False,
    ):
        super().__init__()
        self.input_dim = input_dim
        self.seq_len = seq_len
        self.d_model = d_model
        self.num_classes = num_classes
        self.quant_bits = quant_bits
        self.sparsity = sparsity
        self.return_features = return_features

        if quant_bits is not None:
            raise NotImplementedError("Quantization is reserved for Stage 3.")
        if sparsity > 0:
            raise NotImplementedError("Sparsity is reserved for Stage 4.")

        # Wrap the existing UNSW detector — it expects
        # [batch, seq_len, input_dim] and returns [batch, num_classes].
        self.backbone = LinearUNSWAnomalyDetector(
            input_dim=input_dim,
            seq_len=seq_len,
            d_model=d_model,
            dim_feedforward=dim_feedforward,
            num_layers=num_layers,
            dropout=dropout,
            num_classes=num_classes,
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """Forward pass returning logits.

        Args:
            x: [batch, seq_len, input_dim] float tensor.

        Returns:
            [batch, num_classes] logits tensor (ONNX-compatible).
        """
        if x.ndim != 3:
            raise ValueError(
                f"Expected input shape [batch, seq_len, input_dim], got {tuple(x.shape)}"
            )
        if x.size(1) != self.seq_len or x.size(2) != self.input_dim:
            raise ValueError(
                f"Expected ({self.seq_len}, {self.input_dim}), got {tuple(x.shape[1:])}"
            )

        logits = self.backbone(x)  # [batch, num_classes]

        # ONNX compatibility: return a plain tensor, not a dict or tuple.
        return logits

    def forward_with_features(self, x: torch.Tensor) -> tuple[torch.Tensor, torch.Tensor]:
        """Forward pass that also returns the pooled feature vector.

        Args:
            x: [batch, seq_len, input_dim] float tensor.

        Returns:
            (logits [batch, num_classes], features [batch, d_model])
        """
        if x.ndim != 3:
            raise ValueError(f"Expected [batch, seq_len, input_dim], got {tuple(x.shape)}")

        h = self.backbone.input_projection(x) + self.backbone.position_embedding
        for layer in self.backbone.layers:
            h = layer(h)
        features = self.backbone.output_norm(h.mean(dim=1))  # [batch, d_model]
        logits = self.backbone.classifier(features)           # [batch, num_classes]
        return logits, features

    @property
    def parameter_count(self) -> int:
        return sum(p.numel() for p in self.parameters())

    @property
    def model_size_mb(self) -> float:
        param_size = sum(p.numel() * p.element_size() for p in self.parameters())
        buffer_size = sum(b.numel() * b.element_size() for b in self.buffers())
        return (param_size + buffer_size) / (1024 * 1024)


if __name__ == "__main__":
    # Quick smoke test
    model = LinearIMGDSDenseBaseline(
        input_dim=64, seq_len=16, d_model=16, dim_feedforward=32,
        num_layers=1, dropout=0.1, num_classes=2,
    )
    model.eval()
    x = torch.randn(4, 16, 64)
    with torch.no_grad():
        logits = model(x)
    print(f"Input:  {tuple(x.shape)}")
    print(f"Logits: {tuple(logits.shape)}")
    print(f"Params: {model.parameter_count:,}")
    print(f"Size:   {model.model_size_mb:.4f} MB")
    print("Smoke test PASSED ✓")
