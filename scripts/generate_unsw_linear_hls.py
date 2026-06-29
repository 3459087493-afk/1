import argparse
import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

import numpy as np
import torch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
RESULTS_DIR = PROJECT_ROOT / "results" / "linear_unsw_baseline"
HLS_RESULTS_DIR = RESULTS_DIR / "hls"
ONNX_DIR = RESULTS_DIR / "onnx"
HLS_PROJECT_DIR = PROJECT_ROOT / "vitis_hls" / "unsw_linear_transformer_hls"
HLS_SRC_DIR = HLS_PROJECT_DIR / "src"

CHECKPOINT_PATH = RESULTS_DIR / "best_model.pt"
ONNX_PATH = ONNX_DIR / "unsw_linear_transformer.onnx"
PREPROCESS_INFO_PATH = RESULTS_DIR / "preprocess_info.json"
MODEL_CONFIG_PATH = RESULTS_DIR / "model_config.json"
SAMPLE_INPUTS_PATH = RESULTS_DIR / "sample_inputs.npy"
SAMPLE_LABELS_PATH = RESULTS_DIR / "sample_labels.npy"

SEQ_LEN = 8
INPUT_DIM = 24
D_MODEL = 16
FF_DIM = 32
NUM_CLASSES = 2
NUM_TEST_SAMPLES = 16
MAX_ERROR_THRESHOLD = 1e-3

os.environ.setdefault("MPLCONFIGDIR", "/tmp/matplotlib-cym")
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from src.transformer import LinearUNSWAnomalyDetector


EXPECTED_STATE_KEYS = (
    "position_embedding",
    "input_projection.weight",
    "input_projection.bias",
    "layers.0.attention.query.weight",
    "layers.0.attention.key.weight",
    "layers.0.attention.value.weight",
    "layers.0.attention.output.weight",
    "layers.0.attention.output.bias",
    "layers.0.feedforward.0.weight",
    "layers.0.feedforward.0.bias",
    "layers.0.feedforward.3.weight",
    "layers.0.feedforward.3.bias",
    "layers.0.norm1.weight",
    "layers.0.norm1.bias",
    "layers.0.norm2.weight",
    "layers.0.norm2.bias",
    "output_norm.weight",
    "output_norm.bias",
    "classifier.weight",
    "classifier.bias",
)


def load_json(path):
    with path.open("r", encoding="utf-8") as file:
        return json.load(file)


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
    raise KeyError("No supported state dict was found in the checkpoint")


def load_model_and_state():
    checkpoint = torch_load_compatible(CHECKPOINT_PATH)
    state_dict, checkpoint_config, checkpoint_format = extract_state_dict(checkpoint)
    model_config = checkpoint_config or load_json(MODEL_CONFIG_PATH)
    missing = [key for key in EXPECTED_STATE_KEYS if key not in state_dict]
    unexpected = [key for key in state_dict if key not in EXPECTED_STATE_KEYS]
    if missing or unexpected:
        raise KeyError(f"State dict mismatch. Missing={missing}, unexpected={unexpected}")
    expected_config = {
        "input_dim": INPUT_DIM,
        "seq_len": SEQ_LEN,
        "d_model": D_MODEL,
        "dim_feedforward": FF_DIM,
        "num_layers": 1,
        "num_classes": NUM_CLASSES,
    }
    for key, expected_value in expected_config.items():
        if int(model_config[key]) != expected_value:
            raise ValueError(f"Expected {key}={expected_value}, got {model_config[key]}")

    model = LinearUNSWAnomalyDetector(**model_config).cpu()
    model.load_state_dict(state_dict, strict=True)
    model.eval()
    return model, state_dict, model_config, checkpoint_format


def load_test_data(model):
    inputs = np.load(SAMPLE_INPUTS_PATH)
    labels = np.load(SAMPLE_LABELS_PATH)
    if inputs.ndim == 2:
        inputs = inputs[np.newaxis, ...]
    inputs = np.ascontiguousarray(inputs[:NUM_TEST_SAMPLES], dtype=np.float32)
    labels = np.asarray(labels[:NUM_TEST_SAMPLES], dtype=np.int64)
    if inputs.shape != (NUM_TEST_SAMPLES, SEQ_LEN, INPUT_DIM):
        raise ValueError(f"Expected test inputs {(NUM_TEST_SAMPLES, SEQ_LEN, INPUT_DIM)}, got {inputs.shape}")
    with torch.no_grad():
        logits = model(torch.from_numpy(inputs)).cpu().numpy().astype(np.float32)
    predictions = np.argmax(logits, axis=1).astype(np.int32)

    HLS_RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    np.save(HLS_RESULTS_DIR / "hls_test_inputs.npy", inputs)
    np.save(HLS_RESULTS_DIR / "hls_reference_logits.npy", logits)
    return inputs, labels, logits, predictions


def c_identifier(state_key):
    return re.sub(r"[^A-Za-z0-9_]", "_", state_key).upper()


def format_float(value):
    return f"{float(value):.9e}f"


def format_initializer(array, indent=0):
    array = np.asarray(array)
    if array.ndim == 1:
        return "{" + ", ".join(format_float(value) for value in array) + "}"
    child_indent = indent + 4
    children = [format_initializer(child, child_indent) for child in array]
    separator = ",\n" + " " * child_indent
    return "{\n" + " " * child_indent + separator.join(children) + "\n" + " " * indent + "}"


def format_c_array(name, array, const=True):
    array = np.asarray(array)
    dimensions = "".join(f"[{size}]" for size in array.shape)
    qualifier = "static const " if const else "static "
    return f"{qualifier}float {name}{dimensions} = {format_initializer(array)};"


def write_text_if_changed(path, text):
    if path.is_file() and path.read_text(encoding="utf-8") == text:
        return False
    path.write_text(text, encoding="utf-8")
    return True


def export_weights(state_dict):
    HLS_SRC_DIR.mkdir(parents=True, exist_ok=True)
    report_entries = []
    lines = [
        "#ifndef UNSW_LINEAR_TRANSFORMER_WEIGHTS_H",
        "#define UNSW_LINEAR_TRANSFORMER_WEIGHTS_H",
        "",
        "// Generated from results/linear_unsw_baseline/best_model.pt",
        "// Linear weights retain PyTorch layout: [out_features][in_features].",
        "",
    ]
    total_parameters = 0
    for state_key in EXPECTED_STATE_KEYS:
        tensor = state_dict[state_key].detach().cpu().numpy().astype(np.float32)
        array_name = c_identifier(state_key)
        parameter_count = int(tensor.size)
        total_parameters += parameter_count
        lines.extend([format_c_array(array_name, tensor), ""])
        report_entries.append(
            {
                "state_dict_key": state_key,
                "tensor_shape": list(tensor.shape),
                "c_array_name": array_name,
                "parameter_count": parameter_count,
                "layout": "PyTorch native; Linear matrices are [out_features][in_features]",
            }
        )
    lines.extend(["#endif", ""])
    weights_path = HLS_SRC_DIR / "weights.h"
    write_text_if_changed(weights_path, "\n".join(lines))

    report = {
        "checkpoint_path": str(CHECKPOINT_PATH),
        "weights_header": str(weights_path),
        "tensor_count": len(report_entries),
        "total_parameter_count": total_parameters,
        "tensors": report_entries,
    }
    HLS_RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    (HLS_RESULTS_DIR / "hls_weight_export_report.json").write_text(
        json.dumps(report, indent=2), encoding="utf-8"
    )
    return report


def write_hls_header():
    text = """#ifndef UNSW_LINEAR_TRANSFORMER_H
#define UNSW_LINEAR_TRANSFORMER_H

#define UNSW_SEQ_LEN 8
#define UNSW_INPUT_DIM 24
#define UNSW_D_MODEL 16
#define UNSW_FF_DIM 32
#define UNSW_NUM_CLASSES 2

void unsw_linear_transformer(
    float input[UNSW_SEQ_LEN][UNSW_INPUT_DIM],
    float logits[UNSW_NUM_CLASSES]
);

#endif
"""
    write_text_if_changed(HLS_SRC_DIR / "unsw_linear_transformer.h", text)


def write_hls_source():
    text = r'''#include "unsw_linear_transformer.h"
#include "weights.h"

#include <cmath>

static float elu_plus_one(float value) {
    return value >= 0.0f ? value + 1.0f : std::exp(value);
}

static void layer_norm_2d(
    const float input[UNSW_SEQ_LEN][UNSW_D_MODEL],
    float output[UNSW_SEQ_LEN][UNSW_D_MODEL],
    const float weight[UNSW_D_MODEL],
    const float bias[UNSW_D_MODEL]
) {
    const float epsilon = 1.0e-5f;
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        float mean = 0.0f;
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            mean += input[sequence][feature];
        }
        mean /= static_cast<float>(UNSW_D_MODEL);

        float variance = 0.0f;
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            const float centered = input[sequence][feature] - mean;
            variance += centered * centered;
        }
        variance /= static_cast<float>(UNSW_D_MODEL);
        const float inverse_std = 1.0f / std::sqrt(variance + epsilon);

        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            const float normalized = (input[sequence][feature] - mean) * inverse_std;
            output[sequence][feature] = normalized * weight[feature] + bias[feature];
        }
    }
}

static void layer_norm_1d(
    const float input[UNSW_D_MODEL],
    float output[UNSW_D_MODEL],
    const float weight[UNSW_D_MODEL],
    const float bias[UNSW_D_MODEL]
) {
    const float epsilon = 1.0e-5f;
    float mean = 0.0f;
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        mean += input[feature];
    }
    mean /= static_cast<float>(UNSW_D_MODEL);

    float variance = 0.0f;
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        const float centered = input[feature] - mean;
        variance += centered * centered;
    }
    variance /= static_cast<float>(UNSW_D_MODEL);
    const float inverse_std = 1.0f / std::sqrt(variance + epsilon);

    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        const float normalized = (input[feature] - mean) * inverse_std;
        output[feature] = normalized * weight[feature] + bias[feature];
    }
}

void unsw_linear_transformer(
    float input[UNSW_SEQ_LEN][UNSW_INPUT_DIM],
    float logits[UNSW_NUM_CLASSES]
) {
    float embedded[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            float sum = INPUT_PROJECTION_BIAS[output_feature];
            for (int input_feature = 0; input_feature < UNSW_INPUT_DIM; ++input_feature) {
                sum += input[sequence][input_feature]
                    * INPUT_PROJECTION_WEIGHT[output_feature][input_feature];
            }
            embedded[sequence][output_feature] = sum
                + POSITION_EMBEDDING[0][sequence][output_feature];
        }
    }

    float query[UNSW_SEQ_LEN][UNSW_D_MODEL];
    float key[UNSW_SEQ_LEN][UNSW_D_MODEL];
    float value[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            float query_sum = 0.0f;
            float key_sum = 0.0f;
            float value_sum = 0.0f;
            for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
                const float element = embedded[sequence][input_feature];
                query_sum += element
                    * LAYERS_0_ATTENTION_QUERY_WEIGHT[output_feature][input_feature];
                key_sum += element
                    * LAYERS_0_ATTENTION_KEY_WEIGHT[output_feature][input_feature];
                value_sum += element
                    * LAYERS_0_ATTENTION_VALUE_WEIGHT[output_feature][input_feature];
            }
            query[sequence][output_feature] = elu_plus_one(query_sum);
            key[sequence][output_feature] = elu_plus_one(key_sum);
            value[sequence][output_feature] = value_sum;
        }
    }

    float key_value[UNSW_D_MODEL][UNSW_D_MODEL];
    for (int key_feature = 0; key_feature < UNSW_D_MODEL; ++key_feature) {
        for (int value_feature = 0; value_feature < UNSW_D_MODEL; ++value_feature) {
            float sum = 0.0f;
            for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
                sum += key[sequence][key_feature] * value[sequence][value_feature];
            }
            key_value[key_feature][value_feature] = sum;
        }
    }

    float key_sum[UNSW_D_MODEL];
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        float sum = 0.0f;
        for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
            sum += key[sequence][feature];
        }
        key_sum[feature] = sum;
    }

    float attention[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        float denominator = 0.0f;
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            denominator += query[sequence][feature] * key_sum[feature];
        }
        if (denominator < 1.0e-6f) {
            denominator = 1.0e-6f;
        }
        for (int value_feature = 0; value_feature < UNSW_D_MODEL; ++value_feature) {
            float numerator = 0.0f;
            for (int key_feature = 0; key_feature < UNSW_D_MODEL; ++key_feature) {
                numerator += query[sequence][key_feature]
                    * key_value[key_feature][value_feature];
            }
            attention[sequence][value_feature] = numerator / denominator;
        }
    }

    float attention_output[UNSW_SEQ_LEN][UNSW_D_MODEL];
    float residual1[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            float sum = LAYERS_0_ATTENTION_OUTPUT_BIAS[output_feature];
            for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
                sum += attention[sequence][input_feature]
                    * LAYERS_0_ATTENTION_OUTPUT_WEIGHT[output_feature][input_feature];
            }
            attention_output[sequence][output_feature] = sum;
            residual1[sequence][output_feature] = embedded[sequence][output_feature] + sum;
        }
    }

    float norm1[UNSW_SEQ_LEN][UNSW_D_MODEL];
    layer_norm_2d(
        residual1,
        norm1,
        LAYERS_0_NORM1_WEIGHT,
        LAYERS_0_NORM1_BIAS
    );

    float feedforward_hidden[UNSW_SEQ_LEN][UNSW_FF_DIM];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_FF_DIM; ++output_feature) {
            float sum = LAYERS_0_FEEDFORWARD_0_BIAS[output_feature];
            for (int input_feature = 0; input_feature < UNSW_D_MODEL; ++input_feature) {
                sum += norm1[sequence][input_feature]
                    * LAYERS_0_FEEDFORWARD_0_WEIGHT[output_feature][input_feature];
            }
            feedforward_hidden[sequence][output_feature] = sum > 0.0f ? sum : 0.0f;
        }
    }

    float residual2[UNSW_SEQ_LEN][UNSW_D_MODEL];
    for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
        for (int output_feature = 0; output_feature < UNSW_D_MODEL; ++output_feature) {
            float sum = LAYERS_0_FEEDFORWARD_3_BIAS[output_feature];
            for (int input_feature = 0; input_feature < UNSW_FF_DIM; ++input_feature) {
                sum += feedforward_hidden[sequence][input_feature]
                    * LAYERS_0_FEEDFORWARD_3_WEIGHT[output_feature][input_feature];
            }
            residual2[sequence][output_feature] = norm1[sequence][output_feature] + sum;
        }
    }

    float norm2[UNSW_SEQ_LEN][UNSW_D_MODEL];
    layer_norm_2d(
        residual2,
        norm2,
        LAYERS_0_NORM2_WEIGHT,
        LAYERS_0_NORM2_BIAS
    );

    float pooled[UNSW_D_MODEL];
    for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
        float sum = 0.0f;
        for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
            sum += norm2[sequence][feature];
        }
        pooled[feature] = sum / static_cast<float>(UNSW_SEQ_LEN);
    }

    float normalized_output[UNSW_D_MODEL];
    layer_norm_1d(pooled, normalized_output, OUTPUT_NORM_WEIGHT, OUTPUT_NORM_BIAS);

    for (int output_class = 0; output_class < UNSW_NUM_CLASSES; ++output_class) {
        float sum = CLASSIFIER_BIAS[output_class];
        for (int feature = 0; feature < UNSW_D_MODEL; ++feature) {
            sum += normalized_output[feature] * CLASSIFIER_WEIGHT[output_class][feature];
        }
        logits[output_class] = sum;
    }
}
'''
    write_text_if_changed(HLS_SRC_DIR / "unsw_linear_transformer.cpp", text)


def write_test_vectors(inputs, labels, logits, predictions):
    lines = [
        "#ifndef UNSW_LINEAR_TRANSFORMER_TEST_VECTORS_H",
        "#define UNSW_LINEAR_TRANSFORMER_TEST_VECTORS_H",
        "",
        '#include "unsw_linear_transformer.h"',
        "",
        f"#define UNSW_NUM_TEST_SAMPLES {NUM_TEST_SAMPLES}",
        "",
        format_c_array("test_inputs", inputs),
        "",
        format_c_array("expected_logits", logits),
        "",
        "static const int expected_labels[UNSW_NUM_TEST_SAMPLES] = {"
        + ", ".join(str(int(value)) for value in labels)
        + "};",
        "static const int expected_predictions[UNSW_NUM_TEST_SAMPLES] = {"
        + ", ".join(str(int(value)) for value in predictions)
        + "};",
        "",
        "#endif",
        "",
    ]
    write_text_if_changed(HLS_SRC_DIR / "test_vectors.h", "\n".join(lines))


def write_testbench():
    text = r'''#include "unsw_linear_transformer.h"
#include "test_vectors.h"

#include <cmath>
#include <iomanip>
#include <iostream>

int main() {
    float maximum_absolute_error = 0.0f;
    double absolute_error_sum = 0.0;
    int prediction_matches = 0;

    std::cout << std::scientific << std::setprecision(9);
    for (int sample = 0; sample < UNSW_NUM_TEST_SAMPLES; ++sample) {
        float input[UNSW_SEQ_LEN][UNSW_INPUT_DIM];
        float actual_logits[UNSW_NUM_CLASSES];
        for (int sequence = 0; sequence < UNSW_SEQ_LEN; ++sequence) {
            for (int feature = 0; feature < UNSW_INPUT_DIM; ++feature) {
                input[sequence][feature] = test_inputs[sample][sequence][feature];
            }
        }

        unsw_linear_transformer(input, actual_logits);

        float sample_max_error = 0.0f;
        for (int output_class = 0; output_class < UNSW_NUM_CLASSES; ++output_class) {
            const float error = std::fabs(
                actual_logits[output_class] - expected_logits[sample][output_class]
            );
            absolute_error_sum += error;
            if (error > sample_max_error) {
                sample_max_error = error;
            }
            if (error > maximum_absolute_error) {
                maximum_absolute_error = error;
            }
        }

        const int actual_prediction = actual_logits[1] > actual_logits[0] ? 1 : 0;
        const int expected_prediction = expected_predictions[sample];
        const bool prediction_match = actual_prediction == expected_prediction;
        if (prediction_match) {
            ++prediction_matches;
        }

        std::cout
            << "sample=" << sample
            << " expected_logits=[" << expected_logits[sample][0]
            << "," << expected_logits[sample][1] << "]"
            << " actual_logits=[" << actual_logits[0]
            << "," << actual_logits[1] << "]"
            << " max_abs_error=" << sample_max_error
            << " expected_prediction=" << expected_prediction
            << " actual_prediction=" << actual_prediction
            << " true_label=" << expected_labels[sample]
            << " prediction_match=" << (prediction_match ? "true" : "false")
            << std::endl;
    }

    const double mean_absolute_error = absolute_error_sum
        / static_cast<double>(UNSW_NUM_TEST_SAMPLES * UNSW_NUM_CLASSES);
    const double prediction_match_rate = static_cast<double>(prediction_matches)
        / static_cast<double>(UNSW_NUM_TEST_SAMPLES);

    std::cout
        << "CSIM_METRICS max_abs_error=" << maximum_absolute_error
        << " mean_abs_error=" << mean_absolute_error
        << " prediction_match_rate=" << prediction_match_rate
        << std::endl;

    if (maximum_absolute_error > 1.0e-3f) {
        std::cerr << "CSIM FAIL: max_abs_error exceeds 1e-3" << std::endl;
        return 1;
    }
    if (prediction_match_rate < 1.0) {
        std::cerr << "CSIM FAIL: prediction match rate is below 1.0" << std::endl;
        return 1;
    }

    std::cout << "CSIM PASS" << std::endl;
    return 0;
}
'''
    write_text_if_changed(HLS_SRC_DIR / "testbench.cpp", text)


def write_tcl_scripts():
    common = """open_project -reset unsw_linear_transformer_prj
set_top unsw_linear_transformer
add_files src/unsw_linear_transformer.cpp
add_files src/unsw_linear_transformer.h
add_files src/weights.h
add_files -tb src/testbench.cpp
add_files -tb src/test_vectors.h
open_solution "solution1"
set_part xc7z020clg400-1
create_clock -period 10 -name default
"""
    write_text_if_changed(HLS_PROJECT_DIR / "run_csim.tcl", common + "csim_design\nexit\n")
    write_text_if_changed(HLS_PROJECT_DIR / "run_csynth.tcl", common + "csynth_design\nexit\n")


def generate_project_files(inputs, labels, logits, predictions):
    HLS_SRC_DIR.mkdir(parents=True, exist_ok=True)
    write_hls_header()
    write_hls_source()
    write_test_vectors(inputs, labels, logits, predictions)
    write_testbench()
    write_tcl_scripts()


def parse_csim_metrics(output):
    pattern = re.compile(
        r"CSIM_METRICS\s+max_abs_error=([0-9eE+\-.]+)\s+"
        r"mean_abs_error=([0-9eE+\-.]+)\s+"
        r"prediction_match_rate=([0-9eE+\-.]+)"
    )
    match = pattern.search(output)
    if match is None:
        return None
    return {
        "max_abs_error": float(match.group(1)),
        "mean_abs_error": float(match.group(2)),
        "prediction_match_rate": float(match.group(3)),
    }


def load_current_csim_result():
    csim_log = (
        HLS_PROJECT_DIR
        / "unsw_linear_transformer_prj"
        / "solution1"
        / "csim"
        / "report"
        / "unsw_linear_transformer_csim.log"
    )
    source_files = [path for path in generated_project_files() if path.name != "README.md"]
    if not csim_log.is_file() or any(not path.is_file() for path in source_files):
        return None
    if csim_log.stat().st_mtime < max(path.stat().st_mtime for path in source_files):
        return None

    csim_output = csim_log.read_text(encoding="utf-8", errors="replace")
    vitis_log = HLS_PROJECT_DIR / "vitis_hls.log"
    if vitis_log.is_file():
        output = (
            vitis_log.read_text(encoding="utf-8", errors="replace")
            + "\n\n--- Vitis HLS CSIM testbench output ---\n"
            + csim_output
        )
    else:
        output = csim_output
    metrics = parse_csim_metrics(csim_output)
    passed = bool(
        "CSIM PASS" in csim_output
        and metrics is not None
        and metrics["max_abs_error"] <= MAX_ERROR_THRESHOLD
        and metrics["prediction_match_rate"] == 1.0
    )
    (HLS_RESULTS_DIR / "hls_csim_output.txt").write_text(output, encoding="utf-8")
    installed_vitis_hls = Path("/tools/Xilinx/Vitis_HLS/2022.2/bin/vitis_hls")
    vitis_hls_command = shutil.which("vitis_hls")
    if vitis_hls_command is None and installed_vitis_hls.is_file():
        vitis_hls_command = str(installed_vitis_hls)
    return {
        "vitis_hls_available": True,
        "vitis_hls_command": vitis_hls_command,
        "csim_executed": True,
        "csim_passed": passed,
        "return_code": 0 if passed else 1,
        "metrics": metrics,
        "reason": "CSIM PASS (current Vitis HLS log verified)" if passed else "Existing CSIM log failed validation",
        "csim_log": str(csim_log),
    }


def run_csim(enabled=True):
    HLS_RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    output_path = HLS_RESULTS_DIR / "hls_csim_output.txt"
    vitis_hls = shutil.which("vitis_hls")
    if not enabled:
        output = "C simulation not requested.\n"
        output_path.write_text(output, encoding="utf-8")
        return {
            "vitis_hls_available": vitis_hls is not None,
            "csim_executed": False,
            "csim_passed": False,
            "return_code": None,
            "metrics": None,
            "reason": "C simulation disabled by --no-csim",
        }
    current_result = load_current_csim_result()
    if current_result is not None:
        return current_result
    if vitis_hls is None:
        output = "HLS files generated. vitis_hls command not available. C simulation not executed.\n"
        output_path.write_text(output, encoding="utf-8")
        return {
            "vitis_hls_available": False,
            "csim_executed": False,
            "csim_passed": False,
            "return_code": None,
            "metrics": None,
            "reason": "vitis_hls command not available",
        }

    process = subprocess.run(
        [vitis_hls, "-f", "run_csim.tcl"],
        cwd=HLS_PROJECT_DIR,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        check=False,
    )
    output_path.write_text(process.stdout, encoding="utf-8")
    metrics = parse_csim_metrics(process.stdout)
    passed = bool(
        process.returncode == 0
        and "CSIM PASS" in process.stdout
        and metrics is not None
        and metrics["max_abs_error"] <= MAX_ERROR_THRESHOLD
        and metrics["prediction_match_rate"] == 1.0
    )
    return {
        "vitis_hls_available": True,
        "vitis_hls_command": vitis_hls,
        "csim_executed": True,
        "csim_passed": passed,
        "return_code": process.returncode,
        "metrics": metrics,
        "reason": "CSIM PASS" if passed else "Vitis HLS C simulation failed validation",
    }


def generated_project_files():
    return [
        HLS_SRC_DIR / "unsw_linear_transformer.h",
        HLS_SRC_DIR / "unsw_linear_transformer.cpp",
        HLS_SRC_DIR / "weights.h",
        HLS_SRC_DIR / "test_vectors.h",
        HLS_SRC_DIR / "testbench.cpp",
        HLS_PROJECT_DIR / "run_csim.tcl",
        HLS_PROJECT_DIR / "run_csynth.tcl",
        HLS_PROJECT_DIR / "README.md",
    ]


def write_reports(weight_report, csim_report, checkpoint_format):
    HLS_RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    (HLS_RESULTS_DIR / "hls_csim_report.json").write_text(
        json.dumps(csim_report, indent=2), encoding="utf-8"
    )

    metrics = csim_report.get("metrics") or {}
    max_error = metrics.get("max_abs_error")
    mean_error = metrics.get("mean_abs_error")
    match_rate = metrics.get("prediction_match_rate")
    can_enter_csynth = bool(csim_report["csim_passed"])

    files = generated_project_files()
    (HLS_RESULTS_DIR / "generated_file_list.txt").write_text(
        "\n".join(str(path.relative_to(PROJECT_ROOT)) for path in files) + "\n",
        encoding="utf-8",
    )
    file_lines = "\n".join(f"- `{path.relative_to(PROJECT_ROOT)}`" for path in files)
    summary = f"""# UNSW-NB15 Linear Transformer HLS Codegen and CSIM

- Checkpoint: `{CHECKPOINT_PATH}`
- Checkpoint format: `{checkpoint_format}`
- ONNX reference: `{ONNX_PATH}`
- Test inputs: `{SAMPLE_INPUTS_PATH}`
- HLS top function: `unsw_linear_transformer`
- Input shape: `[8, 24]`
- Output shape: `[2]`
- Arithmetic: `float`
- Exported tensors: `{weight_report['tensor_count']}`
- Exported parameters: `{weight_report['total_parameter_count']}`

## Generated HLS Files

{file_lines}

## C Simulation

- `vitis_hls` available: `{csim_report['vitis_hls_available']}`
- C simulation executed: `{csim_report['csim_executed']}`
- C simulation passed: `{csim_report['csim_passed']}`
- Maximum absolute error: `{max_error}`
- Mean absolute error: `{mean_error}`
- Prediction match rate: `{match_rate}`
- Can enter `csynth_design`: `{can_enter_csynth}`
- Status: `{csim_report['reason']}`

## Next Step

Run `csynth_design` only after C simulation passes. Vivado, bitstream generation,
and PYNQ execution are outside this stage and have not been run.
"""
    (HLS_RESULTS_DIR / "hls_codegen_summary.md").write_text(summary, encoding="utf-8")

    readme = f"""# UNSW Linear Transformer Float HLS

This project reproduces `LinearUNSWAnomalyDetector` from `{CHECKPOINT_PATH}`.

- Input: `float input[8][24]`
- Output: `float logits[2]`
- Top function: `unsw_linear_transformer`
- Arithmetic: float
- Goal: functional C simulation equivalence before resource optimization
- C simulation passed: `{csim_report['csim_passed']}`

Run C simulation:

```bash
vitis_hls -f run_csim.tcl
```

Run synthesis in the next stage only after CSIM passes:

```bash
vitis_hls -f run_csynth.tcl
```

No Vivado project, bitstream, or PYNQ deployment is generated by this project.
"""
    (HLS_PROJECT_DIR / "README.md").write_text(readme, encoding="utf-8")


def generate_all(run_csim_enabled=True):
    for required_path in (
        CHECKPOINT_PATH,
        ONNX_PATH,
        PREPROCESS_INFO_PATH,
        MODEL_CONFIG_PATH,
        SAMPLE_INPUTS_PATH,
        SAMPLE_LABELS_PATH,
    ):
        if not required_path.is_file():
            raise FileNotFoundError(f"Missing required input: {required_path}")

    preprocess_info = load_json(PREPROCESS_INFO_PATH)
    if (preprocess_info["seq_len"], preprocess_info["input_dim"]) != (SEQ_LEN, INPUT_DIM):
        raise ValueError("Preprocessing metadata does not describe [8, 24] model inputs")

    model, state_dict, model_config, checkpoint_format = load_model_and_state()
    inputs, labels, logits, predictions = load_test_data(model)
    weight_report = export_weights(state_dict)
    generate_project_files(inputs, labels, logits, predictions)
    csim_report = run_csim(enabled=run_csim_enabled)
    write_reports(weight_report, csim_report, checkpoint_format)
    return {
        "model_config": model_config,
        "checkpoint_format": checkpoint_format,
        "weight_report": weight_report,
        "csim_report": csim_report,
        "test_inputs": inputs,
        "reference_logits": logits,
        "labels": labels,
        "predictions": predictions,
    }


def parse_args():
    parser = argparse.ArgumentParser(
        description="Generate and optionally run the UNSW float Linear Transformer HLS C simulation."
    )
    parser.add_argument(
        "--no-csim",
        action="store_true",
        help="Generate all files but do not invoke vitis_hls.",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    result = generate_all(run_csim_enabled=not args.no_csim)
    print("HLS project:", HLS_PROJECT_DIR)
    print("Top function: unsw_linear_transformer")
    print("Input shape: [8, 24]")
    print("Output shape: [2]")
    print("Exported parameters:", result["weight_report"]["total_parameter_count"])
    print("C simulation report:", result["csim_report"])
    print("Summary:", HLS_RESULTS_DIR / "hls_codegen_summary.md")
    if result["csim_report"]["csim_executed"] and not result["csim_report"]["csim_passed"]:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
