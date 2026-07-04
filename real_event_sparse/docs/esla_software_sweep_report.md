# Q16-ESLA Software Sweep Report

## 1. 实验范围

本实验只验证 PyTorch/NumPy 软件 reference，没有修改或运行 HLS、Vivado、bitstream 或 PYNQ。

- 方法：Q16-ESLA（Event-driven Sparse Linear Attention）
- dense baseline：Q16-S0 对应的 float PyTorch checkpoint
- checkpoint：`experiments/imgds_linear_sparse/checkpoints/best_linear_imgds_dense_r32_p8.pt`
- test set：IMG_DS `q16_main_test_3444.npz`，3444 samples，16 tokens/sample
- threshold calibration：独立的 `q16_main_eval200.npz`，不使用 test label 选阈值
- score：`mean(abs(K_i))` 与 `mean(abs(phi(K_i)))`
- selection：top-k 与 calibration percentile threshold
- target active ratios：70%、80%、90%

Dense PyTorch logits 与 test NPZ 中保存的 dense reference 最大绝对误差为 `9.53674316e-07`，说明模型与数据加载路径一致。

## 2. 真正 token compaction 的实现

实现文件：

- `real_event_sparse/pytorch/esla_reference.py`
- `real_event_sparse/scripts/run_esla_software_sweep.py`
- `real_event_sparse/tests/test_esla_reference.py`

软件路径如下：

1. 对每个 token 生成 raw K；
2. 由 K 或 φ(K) 计算 importance score；
3. top-k 或 threshold 生成实际 `active_token_indices`；
4. index 按原 token 顺序排序；
5. 按每个样本的精确 `active_token_num` 分组；
6. 使用 `torch.gather` 构造 `[group, active_token_num, D]` 连续张量；
7. Q、V、φ(Q)、φ(K)、KV、K_sum、normalizer、attended、output projection、LayerNorm、FFN 和 pooling 都只处理该紧凑 token 维。

threshold 产生不同 active length 时，没有把样本 pad 回 16，也没有使用 mask。每个 length group 都以真实 T 运行。top-k 的 T 为固定值：70% 使用 `ceil(0.7×16)=12`，80% 使用 13，90% 使用 15。

由于用户指定 score 来自 K/φ(K)，score stage 必须为全部 16 token 生成 embedding 和 K。这部分被明确计入 MAC estimate；选中的 K 在稀疏 attention 中复用，没有重复计算。当前结论是“score 后的 Linear Attention 主干真正 token compact”，不是声称整个模型从第一条指令起都只读取 active token。

## 3. Sweep 结果

Dense baseline：Accuracy 94.1928%，Precision 97.7075%，Recall 95.4530%，F1 96.5671%。

| Score | Selection | Target active | Threshold | Mean active / 16 | Effective sparsity | Accuracy | F1 | Prediction match | Mean abs error | Estimated MAC reduction |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| K | top-k | 70% | — | 12.000 | 25.00% | 92.6829% | 95.6386% | 97.2706% | 0.7017 | 16.10% |
| K | top-k | 80% | — | 13.000 | 18.75% | 92.7700% | 95.6868% | 97.7642% | 0.4718 | 12.08% |
| K | top-k | 90% | — | 15.000 | 6.25% | 93.4379% | 96.0954% | 98.7224% | 0.1579 | 4.03% |
| K | threshold | 70% | 0.117479 | 11.255 | 29.66% | 92.4216% | 95.4992% | 97.0674% | 0.6872 | 19.10% |
| K | threshold | 80% | 0.092650 | 12.881 | 19.49% | 92.8281% | 95.7289% | 97.8223% | 0.4330 | 12.56% |
| K | threshold | 90% | 0.071185 | 14.421 | 9.87% | 93.5250% | 96.1572% | 99.0418% | 0.2213 | 6.36% |
| φ(K) | top-k | 70% | — | 12.000 | 25.00% | 94.3961% | 96.7525% | 96.1382% | 0.6112 | 16.10% |
| φ(K) | top-k | 80% | — | 13.000 | 18.75% | 94.5703% | 96.8439% | 96.7770% | 0.4588 | 12.08% |
| φ(K) | top-k | 90% | — | 15.000 | 6.25% | **95.0348%** | 97.0854% | 98.7515% | 0.1815 | 4.03% |
| φ(K) | threshold | 70% | 0.868918 | 11.120 | **30.50%** | 94.0767% | 96.5829% | 94.8316% | 0.6924 | **19.65%** |
| φ(K) | threshold | 80% | 0.759334 | 12.776 | 20.15% | **95.0058%** | **97.0867%** | 97.2706% | 0.5149 | 12.98% |
| φ(K) | threshold | 90% | 0.663931 | 14.251 | 10.93% | 94.1638% | 96.5541% | **99.5064%** | 0.2866 | 7.04% |

完整精度字段（包括 precision、recall、max error）位于 `real_event_sparse/results/esla_software_sweep.csv`。

## 4. Active token 是否真的变少

是。12 个 sparse 配置的平均 active token 均小于 16：

- top-k：12、13、15；
- raw K threshold：11.255、12.881、14.421；
- φ(K) threshold：11.120、12.776、14.251。

每个配置、每个样本的实际 `active_token_num` 已记录在：

`real_event_sparse/results/esla_software_sweep_per_sample.csv`

该表有 41,328 行（12 configs × 3444 samples），并同时记录 `skipped_token_num`、sparse prediction、dense prediction 和 label。这比只记录平均稀疏率更直接地证明 threshold 路径确实产生 variable active length。

## 5. Accuracy 与 dense prediction 差异

### 5.1 Score type

φ(K) 在本次 sweep 中一致优于 raw K。raw K 的六组 accuracy 都低于 dense baseline；φ(K) 的 top-k 70/80/90 和 threshold 80 均不低于 dense baseline附近，其中三组数值上高于 baseline。

这是合理但不是预先保证的结果：Linear Attention 真正使用的是 φ(K)，因此用 φ(K) 的大小选择 token 比 raw K 更贴近 KV/K_sum 中的实际贡献。

### 5.2 推荐软件候选点

如果优先 accuracy/F1：

- **φ(K) threshold 80%**：平均 12.776 token，20.15% token sparsity，Accuracy 95.0058%，F1 97.0867%，estimated MAC reduction 12.98%。

如果优先预测稳定性：

- **φ(K) threshold 90%**：平均 14.251 token，prediction match 99.5064%，Accuracy 94.1638%，但仅约 7.04% estimated MAC reduction。

如果优先稀疏率：

- **φ(K) threshold 70%**：平均 11.120 token，30.50% token sparsity，Accuracy 94.0767%，estimated MAC reduction 19.65%；prediction match 降至 94.8316%。

φ(K) top-k 90% 得到最高测试 accuracy 95.0348%，但只跳过 1/16 token，MAC reduction 仅约 4.03%，硬件价值较弱。

测试 accuracy 高于 dense baseline 不等于已经证明泛化能力提升。当前 checkpoint 没有针对 ESLA retraining，且这里只评估一个固定 test set；应把它视为可行性结果，而不是统计显著性结论。

## 6. Effective sparsity 与 MAC estimate 口径

```text
effective_sparsity = skipped_token_ratio
                   = 1 - mean(active_token_num) / 16
```

MAC estimate 对 K/φ(K) scoring 采用保守口径：

- dense 计算全部 token 的 input projection；
- dense 计算全部 token 的 K projection；
- 仅 active token 计算 Q、V、KV、normalizer、attended、output projection 和 FFN；
- selected K 直接复用；
- classifier 保持 dense；
- 未把 ELU/exp、LayerNorm、index selection、gather 和 memory-control 开销伪装成 MAC reduction。

因此 `estimated_mac_reduction` 是算术模型，不是 latency measurement。软件 wall-clock 也不用于推断 FPGA speedup；真实硬件收益需要后续 HLS variable trip count 和板端周期验证。

## 7. 测试与可复现性

单元测试覆盖：

- top-k 返回按原 token 顺序排列的紧凑索引；
- threshold 即使无 token 达标也至少保留最高分 token；
- K/φ(K) score shape 正确。

测试结果：`3 passed`。

复现实验命令：

```bash
python3 real_event_sparse/scripts/run_esla_software_sweep.py
```

## 8. 结论

本阶段已经证明：

1. Active Token List 与 Token Compaction 确实把后续 Linear Attention/FFN 的 token dimension 从 16 降为实际 T；
2. 没有使用 dense loop + mask=0；
3. φ(K) score 明显比 raw K score 更适合当前模型；
4. φ(K) threshold 80% 是当前 accuracy、F1 与 MAC reduction 的最佳平衡点；
5. 本阶段只形成软件可行性证据，尚未产生任何 HLS、Vivado 或 PYNQ 结论。

