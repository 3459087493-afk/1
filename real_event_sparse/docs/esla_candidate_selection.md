# Q16-ESLA Step 6：软件候选点与首版 HLS 候选选择

## 1. 范围与结论

本步骤只读取已有软件结果并补充 fixed-K PyTorch sweep。没有修改 HLS，没有运行 HLS、Vivado、PYNQ，也没有生成或修改 bitstream。

最终选择两个用途不同的候选：

1. **软件最优候选：Q16-ESLA-T80**
   - φ(K) score；
   - dynamic threshold，目标保留 80% token；
   - 平均 active token 12.776/16；
   - Accuracy 95.0058%，F1 97.0867%；
   - 用于算法有效性与 dynamic event sparsity 证明。
2. **首版硬件候选：Q16-ESLA-K13**
   - φ(K) score；
   - fixed top-k，K=13；
   - Accuracy 94.5703%，F1 96.8439%；
   - 固定 reduced loop bound，更容易得到可解释、稳定的 HLS schedule。

选择结果位于 `real_event_sparse/results/esla_candidate_selection.csv`。

## 2. Step 5 的判定边界

Step 5 对 Dense、Fake mask 和 Real ESLA 使用了相同的计数边界：

| 实现 | Token iterations | MAC estimate | Activation-buffer read proxy |
|---|---:|---:|---:|
| Dense | 55,104 | 198,484,608 | 174,569,472 |
| Fake mask | 55,104 | 198,484,608 | 174,569,472 |
| Real ESLA T80 | 43,999 | 172,721,008 | 144,521,344 |

### 为什么 Fake mask 失败

Fake mask 仍然遍历 16 个 token，执行相同 Q/K/V、attention、output 和 FFN 计算，再把 inactive token 乘 0 或丢弃输出。它没有减少 loop trip count、MAC 或 buffer address/read，因此必须判定为无效硬件稀疏，不能写成 compute skipping。

### 为什么 Real ESLA 是真实 compute skipping

软件 reference 先生成 `active_token_indices`，按样本真实 T 分组，再用 `torch.gather` 形成 `[batch_T,T,D]` 紧凑张量。Q、V、KV/K_sum、attended、output projection、FFN 和 pooling 的 token dimension 都是 T，而不是 16-token tensor 加 mask。

T80 将平均 token iteration 从 16 降到 12.776，软件计数模型显示 MAC 减少 12.98%、activation-buffer read proxy 减少 17.21%。这些是软件数据流与运算量证据，不是 FPGA latency 数据。

## 3. 候选筛选规则

Dense Q16-S0 baseline：

- Accuracy：94.1928%；
- F1：96.5671%。

硬门槛：

- Accuracy ≥ 94.1928%，或最多下降 0.3 percentage point，即 Accuracy ≥ 93.8928%；
- effective sparsity ≥ 15%；
- MAC reduction ≥ 10%；
- 在通过硬门槛后，优先 accuracy、F1、prediction match；
- 第一版 HLS 再优先 fixed K、固定 loop bound 和接近 T80 平均 T。

由于这些指标存在 Pareto trade-off，本文不把它们压成缺乏依据的单一加权分数。排序采用：先通过全部硬门槛，再依次比较 accuracy、F1、prediction match、effective sparsity、MAC/BRAM proxy reduction，最后比较硬件实现难度。

## 4. 原 sweep 分析

### 4.1 φ(K) 组合

| Selection | Mean T | Sparsity | Accuracy | F1 | Dense match | MAC reduction | BRAM-read proxy reduction | 门槛 |
|---|---:|---:|---:|---:|---:|---:|---:|---|
| threshold T80 | 12.776 | 20.15% | **95.0058%** | **97.0867%** | 97.2706% | 12.98% | 17.21% | 通过 |
| fixed K13 | 13.000 | 18.75% | 94.5703% | 96.8439% | 96.7770% | 12.08% | 15.91% | 通过 |
| fixed K12 | 12.000 | 25.00% | 94.3961% | 96.7525% | 96.1382% | 16.10% | 21.72% | 通过 |
| threshold T70 | 11.120 | 30.50% | 94.0767% | 96.5829% | 94.8316% | 19.65% | 26.83% | 通过，但 match 较低 |
| threshold T90 | 14.251 | 10.93% | 94.1638% | 96.5541% | **99.5064%** | 7.04% | 8.64% | 稀疏/MAC 未达标 |
| fixed K15 | 15.000 | 6.25% | 95.0348% | 97.0854% | 98.7515% | 4.03% | 4.29% | 稀疏/MAC 未达标 |

T80 在所有满足门槛、且 prediction match 不明显恶化的 dynamic point 中具有最佳 Accuracy/F1 平衡。因此它是软件最优候选。K15 的 accuracy 略高，但只跳过 1 个 token，不能满足论文所需的有效稀疏与 MAC reduction 门槛。

### 4.2 Raw K 组合

raw K 的现有 top-k/threshold 组合 accuracy 为 92.42%–93.53%，fixed-K 补测为 90.19%–93.38%，全部低于允许的最低 accuracy 93.8928%。因此 raw K 不进入硬件候选。φ(K) 与 Linear Attention 实际使用的 feature space 一致，软件结果也明显更稳定。

## 5. 补充 fixed-K sweep

输出：`real_event_sparse/results/esla_fixedk_software_sweep.csv`。

### 5.1 φ(K) fixed-K

| K | Sparsity | Accuracy | F1 | Dense match | MAC reduction | BRAM-read proxy reduction | 判断 |
|---:|---:|---:|---:|---:|---:|---:|---|
| 14 | 12.50% | **95.2381%** | **97.2137%** | 98.0256% | 8.05% | 10.10% | 稀疏/MAC 未达标 |
| 13 | 18.75% | 94.5703% | 96.8439% | **96.7770%** | 12.08% | 15.91% | **通过，首版 HLS 推荐** |
| 12 | 25.00% | 94.3961% | 96.7525% | 96.1382% | 16.10% | 21.72% | 通过，第二硬件候选 |
| 11 | 31.25% | 93.8734% | 96.4615% | 95.1510% | 20.13% | 27.53% | Accuracy 比容许值低 0.0194 pp |
| 10 | 37.50% | 93.9315% | 96.4962% | 94.9768% | 24.15% | 33.33% | 数值过门槛，但 match 较低，不选首版 |

K10 accuracy 略高于 K11 是真实 sweep 结果，说明 token selection 对分类边界的影响不是严格单调的；不能据此假设更小 K 一定更准。K10 虽勉强通过 accuracy 降幅规则，但它离 T80 的 operating point 较远、prediction match 更低，不适合作为第一版硬件验证点。

### 5.2 Raw K fixed-K

| K | Accuracy | F1 | Dense match | 判断 |
|---:|---:|---:|---:|---|
| 14 | 93.3798% | 96.0608% | 98.5482% | Accuracy 未达标，且稀疏/MAC 未达标 |
| 13 | 92.7700% | 95.6868% | 97.7642% | Accuracy 未达标 |
| 12 | 92.6829% | 95.6386% | 97.2706% | Accuracy 未达标 |
| 11 | 91.8699% | 95.1423% | 96.2834% | Accuracy 未达标 |
| 10 | 90.1858% | 94.0785% | 94.3089% | Accuracy 未达标 |

## 6. 为什么 T80 是软件最优候选

Q16-ESLA-T80 使用 φ(K) dynamic threshold：

- Accuracy 95.0058%，比 dense 高 0.8130 pp；
- F1 97.0867%，比 dense 高 0.5196 pp；
- 平均 T=12.776，effective sparsity 20.15%；
- MAC reduction estimate 12.98%；
- BRAM-read proxy reduction 17.21%；
- prediction match 97.2706%。

它让每个样本按内容决定 T，最符合 event-driven sparse 的算法定义，因此适合作为软件算法有效性 reference。

“T80”在本工程中表示目标保留 80% active token；实际 calibration threshold 是 eval200 score distribution 的下 20th percentile，对应阈值 0.759334。报告该名称时应避免误写成 score 的 80th percentile。

## 7. 为什么首版 HLS 不优先 T80

T80 的 `active_token_num` 随样本变化。HLS 必须实现：

- threshold compare；
- dynamic index list；
- variable-length compaction；
- `a < active_token_num` 的运行时 loop；
- variable latency 的验证与报告。

这些都可以成为真实稀疏，但会增加控制路径、trip-count 分析和性能归因难度。第一版若直接使用 T80，一旦 latency 未下降，将难以区分是 compaction 开销、动态 loop schedule、memory banking 还是 sparse arithmetic 本身造成。

fixed-K 使用同样的 top-k list 与真实 compaction，但 expensive loop 的上界固定为 K。只要源码和 csynth 确认 loop trip count 是 K，而不是 16 加 `if(mask)`，它同样是真实 compute skipping，并更适合作为首个硬件因果验证点。

## 8. K13 与 K12：第一版选择

推荐 **Q16-ESLA-K13** 作为首版 HLS：

- K13 与 T80 平均 T=12.776 最接近；
- K13 accuracy 比 K12 高 0.1742 pp；
- K13 F1 比 K12 高 0.0914 pp；
- K13 dense prediction match 比 K12 高 0.6388 pp；
- K13 仍满足 18.75% sparsity、12.08% MAC reduction 和 15.91% BRAM-read proxy reduction。

K12 提供更高理论 reduction，但准确率和 prediction match 略差。它适合作为第二个 HLS design point，用于验证 K 从 13 降到 12 时 trip count/latency 是否按预期变化，而不是第一版起点。

## 9. 下一步 HLS 必须证明什么

本步骤没有产生 FPGA 加速结论。下一步只有在获得授权后，才应在新 `real_event_sparse/hls/` 工程中验证：

1. K13 的相关 token loops trip count 确实为 13；
2. 不存在 `for pos < 16` 后 `if(active)` 或乘 0；
3. Q/V、KV/K_sum、attended、output 和 FFN 中计划稀疏的路径实际少执行 iteration；
4. CSIM 数值与 Q16-ESLA-K13 PyTorch reference 对齐；
5. csynth 的 cycle estimate、MAC/DSP schedule 和 memory access 随 K 下降；
6. dynamic T80 后续必须验证运行时 loop bound 为 `active_token_num`，不能只生成 mask。

软件 MAC reduction 不能写成硬件 latency reduction；当前事件稀疏仍是软件级结果，不能表述为已经实现 FPGA 加速或已经上板。

## 10. 最终推荐

| Candidate | 用途 | 是否推荐首版 HLS |
|---|---|---|
| Q16-ESLA-T80 | 软件算法有效性、dynamic event sparsity reference | 否，保留为后续动态版本 |
| **Q16-ESLA-K13** | fixed-bound hardware proof of real compute skipping | **是** |
| Q16-ESLA-K12 | 更激进的第二 HLS point | K13 成功后再做 |

