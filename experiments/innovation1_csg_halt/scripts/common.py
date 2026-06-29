import json
import os
import sys
from pathlib import Path

import numpy as np
import torch
import torch.nn.functional as F
from sklearn.metrics import accuracy_score, confusion_matrix, f1_score, precision_score, recall_score


PROJECT_ROOT = Path(__file__).resolve().parents[3]
EXP_ROOT = PROJECT_ROOT / "experiments" / "innovation1_csg_halt"
SCRIPT_DIR = EXP_ROOT / "scripts"
RESULTS_DIR = EXP_ROOT / "results"
LOGS_DIR = EXP_ROOT / "logs"
BASELINE_RESULTS = PROJECT_ROOT / "results" / "linear_unsw_baseline"
BASELINE_HLS = PROJECT_ROOT / "vitis_hls" / "unsw_linear_transformer_hls"

CHECKPOINT_PATH = BASELINE_RESULTS / "best_model.pt"
SAMPLE_INPUTS_PATH = BASELINE_RESULTS / "sample_inputs.npy"
SAMPLE_LABELS_PATH = BASELINE_RESULTS / "sample_labels.npy"
MODEL_CONFIG_PATH = BASELINE_RESULTS / "model_config.json"
PREPROCESS_INFO_PATH = BASELINE_RESULTS / "preprocess_info.json"

os.environ.setdefault("MPLCONFIGDIR", "/tmp/matplotlib-cym")
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from src.transformer import LinearUNSWAnomalyDetector


def ensure_dir(path):
    path.mkdir(parents=True, exist_ok=True)
    return path


def load_json(path):
    with path.open("r", encoding="utf-8") as file:
        return json.load(file)


def write_json(path, value):
    ensure_dir(path.parent)
    path.write_text(json.dumps(value, indent=2), encoding="utf-8")


def torch_load_compatible(path):
    try:
        return torch.load(path, map_location="cpu", weights_only=False)
    except TypeError:
        return torch.load(path, map_location="cpu")


def extract_state_dict(checkpoint):
    if isinstance(checkpoint, torch.nn.Module):
        return checkpoint.state_dict(), None, "torch.nn.Module"
    if not isinstance(checkpoint, dict):
        raise TypeError(f"Unsupported checkpoint type: {type(checkpoint).__name__}")
    for key in ("model_state_dict", "state_dict", "model"):
        if key not in checkpoint:
            continue
        value = checkpoint[key]
        if isinstance(value, torch.nn.Module):
            value = value.state_dict()
        if isinstance(value, dict):
            return value, checkpoint.get("model_config"), key
    if checkpoint and all(torch.is_tensor(value) for value in checkpoint.values()):
        return checkpoint, None, "raw_state_dict"
    raise KeyError("No state dict found in checkpoint")


def load_model():
    checkpoint = torch_load_compatible(CHECKPOINT_PATH)
    state_dict, checkpoint_config, checkpoint_format = extract_state_dict(checkpoint)
    model_config = checkpoint_config or load_json(MODEL_CONFIG_PATH)
    model = LinearUNSWAnomalyDetector(**model_config).cpu()
    model.load_state_dict(state_dict, strict=True)
    model.eval()
    return model, model_config, checkpoint_format


def load_samples(limit=256):
    inputs = np.load(SAMPLE_INPUTS_PATH)
    labels = np.load(SAMPLE_LABELS_PATH)
    if inputs.ndim == 2:
        inputs = inputs[np.newaxis, ...]
    inputs = np.ascontiguousarray(inputs[:limit], dtype=np.float32)
    labels = np.asarray(labels[:limit], dtype=np.int64)
    return torch.from_numpy(inputs), labels


@torch.no_grad()
def extract_linear_attention_tensors(model, inputs):
    layer = model.layers[0]
    attention = layer.attention
    embedded = model.input_projection(inputs) + model.position_embedding
    query_raw = attention.query(embedded)
    key_raw = attention.key(embedded)
    value = attention.value(embedded)
    phi_q = F.elu(query_raw) + 1.0
    phi_k = F.elu(key_raw) + 1.0
    return {
        "embedded": embedded,
        "query_raw": query_raw,
        "key_raw": key_raw,
        "value": value,
        "phi_q": phi_q,
        "phi_k": phi_k,
    }


def ensure_one_active_per_token(mask, phi):
    mask = mask.to(dtype=torch.bool).clone()
    if mask.shape != phi.shape:
        mask = torch.broadcast_to(mask, phi.shape).clone()
    inactive = ~mask.any(dim=-1, keepdim=True)
    if inactive.any():
        maximum_index = phi.argmax(dim=-1, keepdim=True)
        fallback = torch.zeros_like(mask).scatter_(-1, maximum_index, True)
        mask = torch.where(inactive, fallback, mask)
    return mask


@torch.no_grad()
def finish_forward(model, tensors, q_mask=None, k_mask=None):
    layer = model.layers[0]
    attention_module = layer.attention
    phi_q = tensors["phi_q"]
    phi_k = tensors["phi_k"]
    value = tensors["value"]
    embedded = tensors["embedded"]

    if q_mask is None:
        q_mask = torch.ones_like(phi_q, dtype=torch.bool)
    if k_mask is None:
        k_mask = torch.ones_like(phi_k, dtype=torch.bool)
    q_mask = ensure_one_active_per_token(q_mask, phi_q)
    k_mask = ensure_one_active_per_token(k_mask, phi_k)
    gated_q = phi_q * q_mask.to(phi_q.dtype)
    gated_k = phi_k * k_mask.to(phi_k.dtype)

    key_value = torch.matmul(gated_k.transpose(-2, -1), value)
    key_sum = gated_k.sum(dim=1).unsqueeze(-1)
    denominator_raw = torch.matmul(gated_q, key_sum)
    denominator = denominator_raw.clamp_min(attention_module.eps)
    attended = torch.matmul(gated_q, key_value) / denominator
    attention_output = attention_module.output(attended)

    encoded = layer.norm1(embedded + layer.dropout(attention_output))
    encoded = layer.norm2(encoded + layer.dropout(layer.feedforward(encoded)))
    pooled = model.output_norm(encoded.mean(dim=1))
    logits = model.classifier(pooled)
    return {
        "logits": logits,
        "q_mask": q_mask,
        "k_mask": k_mask,
        "gated_q": gated_q,
        "gated_k": gated_k,
        "denominator_raw": denominator_raw,
        "denominator": denominator,
    }


def classification_metrics(labels, logits):
    predictions = np.asarray(logits).argmax(axis=1)
    matrix = confusion_matrix(labels, predictions, labels=[0, 1])
    return {
        "accuracy": float(accuracy_score(labels, predictions)),
        "precision": float(precision_score(labels, predictions, zero_division=0)),
        "recall": float(recall_score(labels, predictions, zero_division=0)),
        "f1": float(f1_score(labels, predictions, zero_division=0)),
        "confusion_matrix": matrix.tolist(),
        "predictions": predictions,
    }


def compare_to_original(labels, original_logits, candidate_logits):
    original = classification_metrics(labels, original_logits)
    candidate = classification_metrics(labels, candidate_logits)
    difference = np.asarray(candidate_logits, dtype=np.float64) - np.asarray(
        original_logits, dtype=np.float64
    )
    candidate.update(
        {
            "f1_delta_vs_original": candidate["f1"] - original["f1"],
            "prediction_match_rate_vs_original": float(
                np.mean(candidate["predictions"] == original["predictions"])
            ),
            "max_abs_logits_error_vs_original": float(np.max(np.abs(difference))),
            "mean_abs_logits_error_vs_original": float(np.mean(np.abs(difference))),
        }
    )
    candidate.pop("predictions")
    original.pop("predictions")
    return original, candidate


def denominator_statistics(denominator_raw, epsilon=1e-6):
    values = denominator_raw.detach().cpu().numpy()
    return {
        "denominator_min": float(values.min()),
        "denominator_mean": float(values.mean()),
        "denominator_near_zero_count": int(np.count_nonzero(values <= epsilon)),
    }


def minmax_normalize(values):
    values = np.asarray(values, dtype=np.float64)
    minimum = values.min()
    maximum = values.max()
    if maximum - minimum < 1e-12:
        return np.zeros_like(values)
    return (values - minimum) / (maximum - minimum)


def passes_quality_gate(row):
    return bool(
        float(row["prediction_match_rate_vs_original"]) >= 0.99
        and float(row["f1_delta_vs_original"]) >= -0.01
        and int(row["denominator_near_zero_count"]) == 0
    )


def calibrate_homeostatic_thresholds(phi, target_ratio, iterations=40, eta_scale=0.05):
    values = phi.detach()
    channel_values = values.reshape(-1, values.shape[-1])
    initial_quantile = max(0.0, min(1.0, 1.0 - float(target_ratio)))
    # PyTorch 1.13 accepts one reduction dimension in torch.quantile.
    thresholds = torch.quantile(channel_values, initial_quantile, dim=0)
    channel_scale = channel_values.std(dim=0, unbiased=False).clamp_min(1e-4)
    for _ in range(iterations):
        active_rate = (values > thresholds.view(1, 1, -1)).float().mean(dim=(0, 1))
        thresholds = thresholds + eta_scale * channel_scale * (active_rate - target_ratio)
    return thresholds


def build_gate_masks(tensors, method, threshold_param, threshold_record=None):
    phi_q = tensors["phi_q"]
    phi_k = tensors["phi_k"]
    if method == "percentile":
        if threshold_record is None:
            percentile = float(threshold_param)
            q_threshold = float(np.percentile(phi_q.cpu().numpy(), percentile))
            k_threshold = float(np.percentile(phi_k.cpu().numpy(), percentile))
        else:
            q_threshold = float(threshold_record["q_threshold"])
            k_threshold = float(threshold_record["k_threshold"])
        q_mask = phi_q > q_threshold
        k_mask = phi_k > k_threshold
        record = {"q_threshold": q_threshold, "k_threshold": k_threshold}
    elif method == "dynamic_mad":
        alpha = float(threshold_param)
        q_mean = phi_q.mean(dim=-1, keepdim=True)
        k_mean = phi_k.mean(dim=-1, keepdim=True)
        q_mad = (phi_q - q_mean).abs().mean(dim=-1, keepdim=True)
        k_mad = (phi_k - k_mean).abs().mean(dim=-1, keepdim=True)
        q_threshold = q_mean + alpha * q_mad
        k_threshold = k_mean + alpha * k_mad
        q_mask = phi_q > q_threshold
        k_mask = phi_k > k_threshold
        record = {
            "formula": "per_sample_per_token_mean_plus_alpha_mad",
            "alpha": alpha,
        }
    elif method == "homeostatic":
        target_ratio = float(threshold_param)
        if threshold_record is None:
            q_threshold = calibrate_homeostatic_thresholds(phi_q, target_ratio)
            k_threshold = calibrate_homeostatic_thresholds(phi_k, target_ratio)
        else:
            q_threshold = torch.tensor(threshold_record["q_threshold"], dtype=phi_q.dtype)
            k_threshold = torch.tensor(threshold_record["k_threshold"], dtype=phi_k.dtype)
        q_mask = phi_q > q_threshold.view(1, 1, -1)
        k_mask = phi_k > k_threshold.view(1, 1, -1)
        record = {
            "q_threshold": q_threshold.cpu().tolist(),
            "k_threshold": k_threshold.cpu().tolist(),
            "target_active_ratio": target_ratio,
            "iterations": 40,
            "eta_scale": 0.05,
        }
    else:
        raise ValueError(f"Unknown gate method: {method}")
    return q_mask, k_mask, record
