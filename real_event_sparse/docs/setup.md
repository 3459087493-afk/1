# Q16-ESLA 工程初始化说明

## 工程名称

- 方法名称：**Q16-ESLA**
- ESLA：**Event-driven Sparse Linear Attention**
- 工程根目录：`real_event_sparse/`

本工程与实验一完全隔离。实验一的结果、源码、bitstream 和硬件描述文件均不在本目录内修改。

## Baseline 来源

Q16-ESLA 从实验一最稳定的 Q16-S0 dense baseline 建立：

```text
experiments/imgds_linear_sparse/final_paper_experiments/
  experiment1_sparse_board/hls_projects/q16_s0_attn_sparse/
```

Q16-S0 使用 Q16 数据路径、`SEQ_LEN=16`、`INPUT_DIM=64`、`D_MODEL=16`、`FF_DIM=32`。其 `active_channels.h` 中 `ACTIVE_DIM=16`，所以它是未裁剪 Q/K channel 的 dense 起点。

## 当前目录结构

```text
real_event_sparse/
├── docs/
├── pytorch/
├── hls/
│   └── q16_esla/
│       ├── run_hls.tcl
│       └── src/
├── scripts/
├── results/
└── tests/
```

`results/` 和 `tests/` 当前只建立隔离目录，不包含旧实验结果或生成产物。

## 已复制文件

### HLS baseline

来源：实验一 `hls_projects/q16_s0_attn_sparse/`。

| 新工程文件 | 基线用途 |
|---|---|
| `hls/q16_esla/src/imgds_linear_dense_q16.cpp` | Q16 dense kernel 与 Linear Attention 起点 |
| `hls/q16_esla/src/imgds_linear_dense_q16.h` | 固定尺寸、定点类型和 top-level declaration |
| `hls/q16_esla/src/hls_params_q16.h` | Q16 baseline 权重和参数 |
| `hls/q16_esla/src/active_channels.h` | S0 全 16 channel 配置，仅作为基线记录 |
| `hls/q16_esla/src/eval_samples_q16.h` | 原 HLS evaluation samples |
| `hls/q16_esla/src/testbench.cpp` | 原 C simulation testbench |
| `hls/q16_esla/run_hls.tcl` | 原 HLS build/export TCL |

没有复制 Q16-S0 的 HLS solution、综合报告、Vivado project、IP export 或其他生成目录。

### PyTorch baseline

| 新工程文件 | 原始来源 |
|---|---|
| `pytorch/transformer.py` | `src/transformer.py` |

该副本提供 dense Linear Transformer 模型定义。后续 Q16-ESLA reference 应在新目录内实现 Active Token List、Token Compaction 和 reduced loop semantics，不回写原 `src/transformer.py`。

### Scripts baseline/reference

| 新工程文件 | 原始来源/作用 |
|---|---|
| `scripts/build_all_sparse_configs.py` | 实验一 codegen/build 编排参考 |
| `scripts/generate_pynq_scripts.py` | 实验一 PYNQ script generator 参考 |
| `scripts/q16_s0_dense_baseline_pynq_full_test.py` | Q16-S0 PYNQ runner 的只读来源副本 |

这些脚本在新工程中是开发副本，不代表已经支持 ESLA。特别是旧 build script 仍包含实验一 config/path/name，不能把原样运行的输出称为 Q16-ESLA。

### Design documents

| 新工程文件 | 内容 |
|---|---|
| `docs/real_event_sparse_step1_attention_flow.md` | dense/mask sparse 计算、MAC、BRAM 和 loop 审计 |
| `docs/real_event_sparse_step2_architecture_choice.md` | A/B/C 架构对比与 KV-level 主方案选择 |
| `docs/setup.md` | 本初始化清单与修改边界 |

## 后续允许修改的文件

只允许在 `real_event_sparse/` 内推进 Q16-ESLA：

- `real_event_sparse/pytorch/`：ESLA reference、selection/compaction、accuracy 验证；
- `real_event_sparse/hls/q16_esla/`：Active Token List、compacted K/V buffer、`active_kv_len` loop bound、testbench 和 TCL；
- `real_event_sparse/scripts/`：新 codegen、export、report parsing 和 PYNQ runner；
- `real_event_sparse/tests/`：功能、数值对齐和稀疏路径测试；
- `real_event_sparse/results/`：仅存放新 Q16-ESLA 实验产物；
- `real_event_sparse/docs/`：新方法设计与验证记录。

新实现必须统一使用方法名 `Q16-ESLA`，代码标识建议统一使用 `q16_esla`。复制文件中的旧名称目前保留，是为了确保 baseline 内容没有在初始化阶段被悄然改变；重命名 top function、kernel、输出文件和指标应作为后续受测试的实现步骤。

## 旧实验只读边界

以下内容作为历史 baseline 和最终实验一证据，只读：

```text
results/pynq_sparse_pareto/
experiments/imgds_linear_sparse/final_paper_experiments/
  experiment1_sparse_board/hls_projects/q16_s0_attn_sparse/
experiments/imgds_linear_sparse/final_paper_experiments/
  experiment1_sparse_board/hls_projects/q16_s10_attn_sparse/
experiments/imgds_linear_sparse/final_paper_experiments/
  experiment1_sparse_board/hls_projects/q16_s20_attn_sparse/
experiments/imgds_linear_sparse/final_paper_experiments/
  experiment1_sparse_board/hls_projects/q16_s30_attn_sparse/
experiments/imgds_linear_sparse/final_paper_experiments/
  experiment1_sparse_board/hls_projects/q8_s0_attn_sparse/
experiments/imgds_linear_sparse/final_paper_experiments/
  experiment1_sparse_board/hls_projects/q8_s30_attn_sparse/
experiments/imgds_linear_sparse/final_paper_experiments/
  experiment1_sparse_board/pynq_packages/
```

所有旧 `.bit`、`.hwh`、CSV、NPZ、log、HLS report 和 Vivado project 均保持原位，不复制到 Q16-ESLA，不覆盖，也不作为新方法结果。

## 初始化时明确未执行的操作

- 未修改任何实验一文件；
- 未覆盖 `results/pynq_sparse_pareto`；
- 未复制或修改任何 `.bit` / `.hwh`；
- 未运行 PyTorch 实验；
- 未运行 HLS、Vivado 或 PYNQ；
- 未把 Q16-S0 baseline 结果重新命名为 Q16-ESLA 结果。

