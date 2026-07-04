#!/usr/bin/env python3
"""Create isolated exploratory QKS-v3 HLS projects from QKS-v2 sources."""
from pathlib import Path
import shutil

ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
V2 = ROOT / "experiments/imgds_linear_sparse/final_paper_experiments/experiment1_qks_v2_physical_prune/hls_projects"
OUT = ROOT / "experiments/qks_v3_s0_s10_s20_s30_exploratory_hls"
CONFIGS = [("s0", 16, 16), ("s10", 14, 14), ("s20", 13, 13), ("s30", 11, 11)]

for sparse, tokens, adim in CONFIGS:
    old = f"q16_qksv2_d{adim}"
    new = f"q16_qksv3_{sparse}"
    src0 = V2 / old / "src"
    dst = OUT / new
    src = dst / "src"
    src.mkdir(parents=True, exist_ok=True)

    cpp = (src0 / f"{old}.cpp").read_text()
    hdr = (src0 / f"{old}.h").read_text()
    prm = (src0 / f"qks_v2_params_{old}.h").read_text()

    # Rename accelerator and make every model token dimension compile-time compact.
    cpp = cpp.replace(old, new).replace(f'qks_v2_params_{new}.h', f'qks_v3_params_{new}.h')
    cpp = cpp.replace("SEQ_LEN", "ACTIVE_TOKENS")
    hdr = hdr.replace(old.upper(), new.upper()).replace(old, new)
    hdr = hdr.replace("#define SEQ_LEN   16", f"#define ACTIVE_TOKENS {tokens}")
    hdr = hdr.replace("data_t input[SEQ_LEN][INPUT_DIM],\n    data_t logits[N_CLASSES]",
                      "data_t input[ACTIVE_TOKENS][INPUT_DIM],\n    token_index_t token_indices[ACTIVE_TOKENS],\n    data_t logits[N_CLASSES]")
    hdr = hdr.replace("typedef ap_fixed<24, 10> acc_t;", "typedef ap_fixed<24, 10> acc_t;\ntypedef ap_uint<4> token_index_t;")

    # Add compact-token original-position input and its AXI interfaces.
    cpp = cpp.replace("data_t input[ACTIVE_TOKENS][INPUT_DIM],\n    data_t logits[N_CLASSES]",
                      "data_t input[ACTIVE_TOKENS][INPUT_DIM],\n    token_index_t token_indices[ACTIVE_TOKENS],\n    data_t logits[N_CLASSES]")
    cpp = cpp.replace("#pragma HLS INTERFACE m_axi port=logits offset=slave bundle=gmem1 depth=2",
                      f"#pragma HLS INTERFACE m_axi port=logits offset=slave bundle=gmem1 depth=2\n#pragma HLS INTERFACE m_axi port=token_indices offset=slave bundle=gmem2 depth={tokens}")
    cpp = cpp.replace("#pragma HLS INTERFACE s_axilite port=logits bundle=control",
                      "#pragma HLS INTERFACE s_axilite port=logits bundle=control\n#pragma HLS INTERFACE s_axilite port=token_indices bundle=control")
    cpp = cpp.replace("position_embedding[t * D_MODEL + d]",
                      "position_embedding[int(token_indices[t]) * D_MODEL + d]")

    # Make the exploratory status and bounds impossible to miss in source.
    cpp = (f"// EXPLORATORY ONLY: Phase 1 failed accuracy and full-app monotonicity.\n"
           f"// Real compact input: ACTIVE_TOKENS={tokens}; Q/K physical dimension: ATTN_DIM={adim}.\n" + cpp)
    prm = prm.replace(f"QKSv2-D{adim}", f"QKSv3-{sparse.upper()} exploratory")

    (src / f"{new}.cpp").write_text(cpp)
    (src / f"{new}.h").write_text(hdr)
    (src / f"qks_v3_params_{new}.h").write_text(prm)

    tb = f'''#include "{new}.h"\n#include <cmath>\n#include <iostream>\n\nint main() {{\n    data_t input[ACTIVE_TOKENS][INPUT_DIM];\n    token_index_t indices[ACTIVE_TOKENS];\n    data_t logits[N_CLASSES];\n    for (int t = 0; t < ACTIVE_TOKENS; ++t) {{\n        indices[t] = token_index_t(t);\n        for (int i = 0; i < INPUT_DIM; ++i) input[t][i] = data_t((t + i) % 17 / 32.0f);\n    }}\n    {new}(input, indices, logits);\n    for (int c = 0; c < N_CLASSES; ++c) {{\n        float v = logits[c].to_float();\n        if (!std::isfinite(v)) return 2;\n        std::cout << "logit[" << c << "]=" << v << "\\n";\n    }}\n    std::cout << "CSIM_PASS ACTIVE_TOKENS={tokens} ATTN_DIM={adim}\\n";\n    return 0;\n}}\n'''
    (src / "tb.cpp").write_text(tb)

    tcl = f'''set script_dir [file dirname [file normalize [info script]]]\nopen_project -reset {new}_hls\nset_top {new}\nadd_files "$script_dir/src/{new}.cpp" -cflags "-I$script_dir/src"\nadd_files "$script_dir/src/{new}.h"\nadd_files "$script_dir/src/qks_v3_params_{new}.h"\nadd_files -tb "$script_dir/src/tb.cpp" -cflags "-I$script_dir/src"\nopen_solution -reset solution1 -flow_target vivado\nset_part {{xc7z020-clg400-1}}\ncreate_clock -period 10 -name default\ncsim_design\ncsynth_design\nexit\n'''
    (dst / "run_hls.tcl").write_text(tcl)
    (dst / "ORIGIN.txt").write_text(
        f"Copied/derived from {src0}\nPhase 1 failed; exploratory latency evidence only.\n"
        f"ACTIVE_TOKENS={tokens}\nATTN_DIM={adim}\n")
    print(dst)
