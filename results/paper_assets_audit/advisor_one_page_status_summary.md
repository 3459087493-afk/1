# 给老师的一页实验状态说明

## 现在完成了什么

目前最稳的是 IMG_DS 上的 Q16-QKS-v2 主线。四个配置 S0、S10、S20、S30 都有精度、Precision、Recall、F1、HLS 综合、Vivado 资源、bit/hwh 和 PYNQ kernel 实测。LUT 都约 1.33 万，低于 PYNQ-Z2 的 53,200；准确率约 93.64%–94.11%；kernel 延迟从约 1101 µs 单调降到 1006 µs。

完整应用时间约 18.5–18.8 ms，其中大部分是 ARM 端 JPEG 解码和预处理。用这个更宽、更保守的时间口径对比 ViT4Mal 0.81 s，仍约有 43×。

## 哪些图表可以直接整理

- Q16-QKS-v2 的 Accuracy–LUT、Accuracy–kernel latency、稀疏度–kernel latency。
- 四组准确率、Precision、Recall、F1 和资源表。
- 完整应用延迟分解图。
- QKS-v2 与 ViT4Mal 的保守综合比较表。
- QKS-v2 稀疏有效性实验：尺寸、循环、MAC、HLS 周期和 PYNQ kernel 的对应关系。

这些数据已经存在，主要工作是统一命名、重新排版和去掉不可靠的 500×主结论，不需要重跑实验。

## 还缺什么

- 系统框架图和 dense/QKS-v2 硬件数据流对比图尚未形成论文版。
- 实验2的数据够，但正式机制表、MAC 表、汇总图和报告没有整理。
- 模块级资源拆解尚未汇总，目前只有整机资源。
- 没有真正的 Q8-QKS-v2；旧 Q8 或 QKS-v1 不能拿来补位。
- 事件稀疏目前不能写成已经完成的 PYNQ 实验，应作为设计/HLS阶段或未来工作。

## 实验状态

- **实验1：PARTIAL。** Q16-QKS-v2 四点已完成；如果题目坚持“不同量化配置的 QKS-v2”，则缺 Q8-QKS-v2。
- **实验2：PARTIAL_READY_TO_WRITE。** 关键硬件证据已经齐全，缺的是正式图表和报告，不需要重跑。
- **QKS-v2 稀疏判定：PARTIAL_HARDWARE_SPARSITY。** 它是真实的 Q/K attention-dimension 物理裁剪，但 V、FFN、LayerNorm 等仍是 dense，因此不能说全模型都稀疏。

## 大白话解释“不是 mask”

我们不是把 16 个通道都算一遍，最后再把其中几个结果变成 0。我们真正检查了三件事：数组有没有从 16 变成 14/13/11，循环是不是只跑 14/13/11 次，以及开发板上的 kernel 是否真的变快。三项都有证据，所以 Q/K 部分是真硬件裁剪。与此同时，V 和 FFN 仍按完整维度运行，所以结论要限定为“Q/K 注意力维度的局部真实硬件稀疏”。

## 为什么不再用 500×作主结论

500×来自 prepared-input 的约 1.5 ms 结果，但生成分项数据的准确 runner 已缺失，严格 3444×5 复测又因开发板 PYNQ 环境故障尚未完成。它可以保留为 preliminary/non-strict，不能当唯一主卖点。

43×来自更宽的完整应用时间，连 JPEG 解码、resize、normalize、patch 和量化都算进去了，因此不会因为漏掉 ARM 侧开销而虚高。它与 ViT4Mal 也不是完全同口径，但作为“至少超过 30×目标”的保守证据更可信。

## 下一步最优先事项

第一优先不是重跑实验，而是把现有证据整理成正式实验2：一张机制表、一张 MAC/HLS/PYNQ 对照表、两张图和一份报告。并同步画系统框架图与 dense/QKS-v2 数据流图。只有论文硬性要求 Q8-QKS-v2 或 strict prepared-input speedup 时，才安排新的板端工作。
