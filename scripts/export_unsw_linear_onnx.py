import json
import sys
from collections import Counter
from pathlib import Path

import numpy as np
import pandas as pd
import torch

try:
    import onnx
    import onnxruntime as ort
except ModuleNotFoundError as error:
    raise SystemExit(
        "Missing ONNX dependencies. Install them with: pip install onnx onnxruntime"
    ) from error


PROJECT_ROOT = Path(__file__).resolve().parents[1]
RESULTS_DIR = PROJECT_ROOT / "results" / "linear_unsw_baseline"
ONNX_DIR = RESULTS_DIR / "onnx"
CHECKPOINT_PATH = RESULTS_DIR / "best_model.pt"
PREPROCESS_INFO_PATH = RESULTS_DIR / "preprocess_info.json"
MODEL_CONFIG_PATH = RESULTS_DIR / "model_config.json"
SAMPLE_INPUTS_PATH = RESULTS_DIR / "sample_inputs.npy"
SAMPLE_LABELS_PATH = RESULTS_DIR / "sample_labels.npy"
ONNX_MODEL_PATH = ONNX_DIR / "unsw_linear_transformer.onnx"

if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from src.transformer import LinearUNSWAnomalyDetector


def load_json(path):
    with path.open("r", encoding="utf-8") as file:
        return json.load(file)


def load_preprocess_info():
    if not PREPROCESS_INFO_PATH.is_file():
        raise FileNotFoundError(f"Missing preprocessing metadata: {PREPROCESS_INFO_PATH}")
    info = load_json(PREPROCESS_INFO_PATH)
    expected_shape = (int(info["seq_len"]), int(info["input_dim"]))
    if expected_shape != (8, 24):
        raise ValueError(f"Expected model sample shape (8, 24), got {expected_shape}")
    return info


def load_samples(expected_sample_shape):
    if not SAMPLE_INPUTS_PATH.is_file() or not SAMPLE_LABELS_PATH.is_file():
        raise FileNotFoundError(
            f"Required sample files are missing: {SAMPLE_INPUTS_PATH}, {SAMPLE_LABELS_PATH}"
        )

    inputs = np.load(SAMPLE_INPUTS_PATH)
    labels = np.load(SAMPLE_LABELS_PATH)
    if inputs.ndim == 2:
        inputs = inputs[np.newaxis, ...]
    if inputs.ndim != 3:
        raise ValueError(f"Expected sample_inputs with 2 or 3 dimensions, got {inputs.shape}")
    if tuple(inputs.shape[1:]) != tuple(expected_sample_shape):
        raise ValueError(
            f"Expected sample shape {tuple(expected_sample_shape)}, got {tuple(inputs.shape[1:])}"
        )
    if len(labels) < len(inputs):
        raise ValueError(f"Only {len(labels)} labels are available for {len(inputs)} inputs")

    inputs = np.ascontiguousarray(inputs, dtype=np.float32)
    labels = np.asarray(labels, dtype=np.int64).reshape(-1)
    return inputs, labels


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
    raise KeyError("Checkpoint has no model_state_dict, state_dict, model, or raw state_dict")


def load_model():
    if not CHECKPOINT_PATH.is_file():
        raise FileNotFoundError(f"Missing checkpoint: {CHECKPOINT_PATH}")
    checkpoint = torch_load_compatible(CHECKPOINT_PATH)
    state_dict, checkpoint_config, checkpoint_format = extract_state_dict(checkpoint)
    model_config = checkpoint_config or load_json(MODEL_CONFIG_PATH)
    model_config = {key: value for key, value in model_config.items()}

    model = LinearUNSWAnomalyDetector(**model_config).cpu()
    model.load_state_dict(state_dict, strict=True)
    model.eval()
    return model, model_config, checkpoint_format


@torch.no_grad()
def pytorch_inference(model, inputs):
    tensor = torch.from_numpy(np.ascontiguousarray(inputs, dtype=np.float32)).cpu()
    return model(tensor).cpu().numpy()


def export_onnx(model, dummy_input):
    ONNX_DIR.mkdir(parents=True, exist_ok=True)
    dummy_tensor = torch.from_numpy(np.ascontiguousarray(dummy_input, dtype=np.float32)).cpu()
    if tuple(dummy_tensor.shape) != (1, 8, 24):
        raise ValueError(f"ONNX export input must be [1, 8, 24], got {tuple(dummy_tensor.shape)}")

    print("Dummy input shape:", tuple(dummy_tensor.shape))
    errors = []
    for opset_version in (13, 11):
        try:
            torch.onnx.export(
                model,
                dummy_tensor,
                str(ONNX_MODEL_PATH),
                input_names=["input"],
                output_names=["logits"],
                opset_version=opset_version,
                do_constant_folding=True,
            )
            print("ONNX saved to:", ONNX_MODEL_PATH)
            return opset_version
        except Exception as error:
            errors.append(f"opset {opset_version}: {type(error).__name__}: {error}")
            print(f"ONNX export with opset {opset_version} failed: {error}")
    raise RuntimeError("ONNX export failed. " + " | ".join(errors))


def check_onnx_model():
    model = onnx.load(str(ONNX_MODEL_PATH))
    onnx.checker.check_model(model)
    op_counts = Counter(node.op_type for node in model.graph.node)
    graph_stats = pd.DataFrame(sorted(op_counts.items()), columns=["op_type", "count"])
    graph_stats.to_csv(ONNX_DIR / "onnx_graph_stats.csv", index=False)
    return model, op_counts


def create_onnx_session():
    return ort.InferenceSession(str(ONNX_MODEL_PATH), providers=["CPUExecutionProvider"])


def onnx_inference_fixed_batch(session, inputs):
    inputs = np.ascontiguousarray(inputs, dtype=np.float32)
    outputs = [session.run(["logits"], {"input": sample[None, ...]})[0] for sample in inputs]
    return np.concatenate(outputs, axis=0)


def error_metrics(reference, candidate):
    difference = np.asarray(reference, dtype=np.float64) - np.asarray(candidate, dtype=np.float64)
    return {
        "max_abs_error": float(np.max(np.abs(difference))),
        "mean_abs_error": float(np.mean(np.abs(difference))),
        "rmse": float(np.sqrt(np.mean(np.square(difference)))),
    }


def save_validation_results(
    model_config,
    checkpoint_format,
    opset_version,
    op_counts,
    labels,
    pytorch_one,
    onnx_one,
    pytorch_first100,
    onnx_first100,
):
    one_metrics = error_metrics(pytorch_one, onnx_one)
    first100_metrics = error_metrics(pytorch_first100, onnx_first100)
    pytorch_one_prediction = int(np.argmax(pytorch_one, axis=1)[0])
    onnx_one_prediction = int(np.argmax(onnx_one, axis=1)[0])
    pytorch_predictions = np.argmax(pytorch_first100, axis=1)
    onnx_predictions = np.argmax(onnx_first100, axis=1)
    match_rate = float(np.mean(pytorch_predictions == onnx_predictions))
    logits_allclose = bool(
        np.allclose(pytorch_first100, onnx_first100, rtol=1e-4, atol=1e-5)
    )
    can_proceed = bool(logits_allclose and match_rate == 1.0)

    np.save(ONNX_DIR / "pytorch_one_sample_logits.npy", pytorch_one)
    np.save(ONNX_DIR / "onnx_one_sample_logits.npy", onnx_one)
    np.save(ONNX_DIR / "pytorch_first100_logits.npy", pytorch_first100)
    np.save(ONNX_DIR / "onnx_first100_logits.npy", onnx_first100)

    report = {
        "checkpoint_path": str(CHECKPOINT_PATH),
        "checkpoint_format": checkpoint_format,
        "model_class": "LinearUNSWAnomalyDetector",
        "model_config": model_config,
        "input_shape": [1, 8, 24],
        "output_shape": list(pytorch_one.shape),
        "onnx_path": str(ONNX_MODEL_PATH),
        "onnx_opset_version": int(opset_version),
        "onnx_operator_counts": dict(sorted(op_counts.items())),
        "single_sample": {
            "pytorch_logits": pytorch_one.tolist(),
            "onnx_logits": onnx_one.tolist(),
            **one_metrics,
            "pytorch_predicted_label": pytorch_one_prediction,
            "onnx_predicted_label": onnx_one_prediction,
            "true_label": int(labels[0]),
            "prediction_match": pytorch_one_prediction == onnx_one_prediction,
        },
        "first100": {
            **first100_metrics,
            "prediction_match_rate": match_rate,
            "logits_allclose_rtol_1e-4_atol_1e-5": logits_allclose,
        },
        "can_proceed_to_hls_vivado_pynq": can_proceed,
        "environment": {
            "torch": torch.__version__,
            "onnx": onnx.__version__,
            "onnxruntime": ort.__version__,
        },
    }
    (ONNX_DIR / "onnx_validation_report.json").write_text(
        json.dumps(report, indent=2), encoding="utf-8"
    )

    operator_lines = "\n".join(
        f"| `{op_type}` | {count} |" for op_type, count in sorted(op_counts.items())
    )
    summary = f"""# UNSW-NB15 Linear Transformer ONNX Validation

- Checkpoint: `{CHECKPOINT_PATH}`
- Checkpoint format: `{checkpoint_format}`
- Model class: `LinearUNSWAnomalyDetector`
- Input shape: `[1, 8, 24]`
- Output shape: `{list(pytorch_one.shape)}`
- ONNX model: `{ONNX_MODEL_PATH}`
- ONNX opset: `{opset_version}`

## ONNX Operators

| op_type | count |
|---|---:|
{operator_lines}

## Single Sample

- PyTorch logits: `{pytorch_one.tolist()}`
- ONNX logits: `{onnx_one.tolist()}`
- Maximum absolute error: `{one_metrics['max_abs_error']:.12g}`
- Mean absolute error: `{one_metrics['mean_abs_error']:.12g}`
- RMSE: `{one_metrics['rmse']:.12g}`
- PyTorch prediction: `{pytorch_one_prediction}`
- ONNX prediction: `{onnx_one_prediction}`
- True label: `{int(labels[0])}`
- Prediction match: `{pytorch_one_prediction == onnx_one_prediction}`

## First 100 Samples

- Maximum absolute error: `{first100_metrics['max_abs_error']:.12g}`
- Mean absolute error: `{first100_metrics['mean_abs_error']:.12g}`
- RMSE: `{first100_metrics['rmse']:.12g}`
- Prediction match rate: `{match_rate:.6f}`
- Logits allclose (`rtol=1e-4`, `atol=1e-5`): `{logits_allclose}`

## Next Step

- Can proceed to HLS / Vivado / PYNQ preparation: `{can_proceed}`
- No HLS, Vivado, FPGA, or PYNQ operation was performed in this export step.
"""
    (ONNX_DIR / "onnx_validation_summary.md").write_text(summary, encoding="utf-8")
    return report


def main():
    print("Project root:", PROJECT_ROOT)
    preprocess_info = load_preprocess_info()
    expected_sample_shape = (preprocess_info["seq_len"], preprocess_info["input_dim"])
    inputs, labels = load_samples(expected_sample_shape)
    print("Sample inputs:", inputs.shape, inputs.dtype)
    print("Sample labels:", labels.shape, labels.dtype)

    model, model_config, checkpoint_format = load_model()
    print("Model class: LinearUNSWAnomalyDetector")
    print("Checkpoint format:", checkpoint_format)
    print("Model config:", model_config)

    one_input = inputs[:1]
    first100_inputs = inputs[: min(100, len(inputs))]
    pytorch_one = pytorch_inference(model, one_input)
    pytorch_first100 = pytorch_inference(model, first100_inputs)
    print("PyTorch input shape:", one_input.shape)
    print("PyTorch logits shape:", pytorch_one.shape)
    print("PyTorch logits:", pytorch_one)
    print("PyTorch predicted label:", int(np.argmax(pytorch_one, axis=1)[0]))
    print("True label:", int(labels[0]))

    opset_version = export_onnx(model, one_input)
    onnx_model, op_counts = check_onnx_model()
    print("ONNX checker: passed")
    print("ONNX operators:", dict(sorted(op_counts.items())))
    if onnx_model.opset_import[0].version != opset_version:
        raise RuntimeError("Exported ONNX opset does not match the requested version")

    session = create_onnx_session()
    onnx_one = onnx_inference_fixed_batch(session, one_input)
    onnx_first100 = onnx_inference_fixed_batch(session, first100_inputs)
    report = save_validation_results(
        model_config=model_config,
        checkpoint_format=checkpoint_format,
        opset_version=opset_version,
        op_counts=op_counts,
        labels=labels,
        pytorch_one=pytorch_one,
        onnx_one=onnx_one,
        pytorch_first100=pytorch_first100,
        onnx_first100=onnx_first100,
    )

    print("ONNX single-sample logits:", onnx_one)
    print("Single-sample errors:", report["single_sample"])
    print("First-100 errors:", report["first100"])
    print("Can proceed to HLS/Vivado/PYNQ preparation:", report["can_proceed_to_hls_vivado_pynq"])
    print("Validation report:", ONNX_DIR / "onnx_validation_report.json")
    print("Validation summary:", ONNX_DIR / "onnx_validation_summary.md")


if __name__ == "__main__":
    main()
