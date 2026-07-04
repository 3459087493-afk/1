"""Small Linear Transformer — configurable d_model / ff_dim.
Does NOT modify src/transformer.py. Imports LinearUNSWAnomalyDetector as backbone.
Architecture: front_linear → pos_embed → LinearEncoderBlock → output_norm → mean_pool → classifier."""
import sys, os, torch, torch.nn as nn

PROJ = '/home/cym/prj2/finn/notebooks/icl_thesis-master'
if PROJ not in sys.path: sys.path.insert(0, PROJ)
from src.transformer import LinearUNSWAnomalyDetector

class SmallLinearTransformer(nn.Module):
    MODEL_FAMILY = "Linear Transformer"

    def __init__(self, d_model=16, ff_dim=32, num_layers=1, input_dim=64, seq_len=16, num_classes=2, dropout=0.1):
        super().__init__()
        self.d_model = d_model; self.ff_dim = ff_dim; self.num_layers = num_layers
        self.input_dim = input_dim; self.seq_len = seq_len; self.num_classes = num_classes
        self.backbone = LinearUNSWAnomalyDetector(
            input_dim=input_dim, seq_len=seq_len, d_model=d_model,
            dim_feedforward=ff_dim, num_layers=num_layers, dropout=dropout, num_classes=num_classes)

    def forward(self, x): return self.backbone(x)

    def parameter_count(self):
        return sum(p.numel() for p in self.backbone.parameters() if p.requires_grad)

    @classmethod
    def model_family(cls): return cls.MODEL_FAMILY

# Pre-defined configs
SMALL_CONFIGS = {
    "q16_main": {"d_model":16,"ff_dim":32,"num_layers":1,"label":"Q16 Main (baseline)"},
    "small_A":  {"d_model":12,"ff_dim":24,"num_layers":1,"label":"Small-A d12/f24"},
    "small_B":  {"d_model":8, "ff_dim":16,"num_layers":1,"label":"Small-B d8/f16"},
    "tiny":     {"d_model":6, "ff_dim":12,"num_layers":1,"label":"Tiny d6/f12 (ablation)"},
}
