import json
from pathlib import Path

import pandas as pd


STAGE9_ROOT = Path(__file__).resolve().parents[1]
RESULTS_ROOT = STAGE9_ROOT / "results"
DIAGNOSIS_PATH = RESULTS_ROOT / "diagnosis" / "stage9_resource_diagnosis.md"
EVAL_PATH = RESULTS_ROOT / "active_ratio_sweep" / "stage9_active_ratio_eval.csv"
SETS_PATH = RESULTS_ROOT / "active_ratio_sweep" / "stage9_active_channel_sets.json"
OUTPUT_DIR = RESULTS_ROOT / "hls_plan"


def main():
    if not DIAGNOSIS_PATH.is_file() or not EVAL_PATH.is_file() or not SETS_PATH.is_file():
        raise FileNotFoundError("Run Stage 9A and 9B before Stage 9C")
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    evaluation = pd.read_csv(EVAL_PATH)
    sets_document = json.loads(SETS_PATH.read_text(encoding="utf-8"))
    primary = evaluation[evaluation["candidate"].isin(["active_75", "active_62p5", "active_50"])]
    passing = primary[primary["passes_quality_gate"].astype(bool)].sort_values("q_active_ratio")
    recommended = passing.iloc[0]["candidate"] if not passing.empty else None
    pass_lines = "\n".join(
        f"- `{row.candidate}`: pass={bool(row.passes_quality_gate)}, "
        f"prediction_match={row.prediction_match_rate_vs_original:.6f}, "
        f"F1_delta={row.f1_delta_vs_original:+.6f}"
        for row in primary.itertuples()
    )
    selected_channels = (
        sets_document["sets"].get(recommended) if recommended is not None else None
    )
    generation_decision = (
        f"Proceed later with `{recommended}` after this planning-only stage."
        if recommended
        else "Do not generate second-round HLS: no more aggressive primary ratio passed."
    )
    variant_authorization = (
        f"`{recommended}` passed. A later, separately approved generation stage may create "
        "variants for that ratio."
        if recommended
        else "No second-round HLS variant is authorized by the current official-test gate."
    )
    plan = f"""# Stage 9 Second-Round HLS Plan

## PyTorch Gate Decision

{pass_lines}

- Recommended active ratio: `{recommended}`
- Selected channels: `{selected_channels}`
- Decision: **{generation_decision}**

This script generates a plan only. It does not create HLS, run CSIM/CSYNTH, invoke Vivado,
export IP, or access a board.

## Compile-Time Compact Attention

The second round must not implement runtime `ACTIVE_IDX` selection inside arithmetic loops.
Generate variant-specific source arrays and fixed loop bounds at code-generation time:

```cpp
phi_q_active[ACTIVE_DIM]
phi_k_active[ACTIVE_DIM]
sum_k_active[ACTIVE_DIM]
```

Numerator and denominator loops iterate only over `ACTIVE_DIM`. Channel mapping should be
resolved by generation, so no per-iteration index mux is needed.

## Projection Scope

Q/K projection pruning is safe only when generated compact weights preserve each selected
output channel and its original input dimension. V and output dimensions remain full. The
first second-round version should retain dense Q/K projections if compact weight export has
not been independently verified; in that case, prune only after feature mapping in K^T V,
key sum, numerator, denominator, and attention accumulation. This isolates correctness risk.

## Fixed-Point Redesign

1. Avoid float/ap_fixed mixing inside all inner loops.
2. Convert selected weights to fixed constants before synthesis.
3. Keep feature maps, products, and accumulators consistently fixed internally.
4. Keep top-function input/output float and convert only at those boundaries.
5. Evaluate lower data/product/accumulator widths than 16/18/24.
6. Every width configuration must pass variant-specific CSIM before CSYNTH.

## Resource-Aware Scheduling

- Do not maximize unroll or blindly partition arrays.
- Treat DSP <= 220 and LUT <= 53200 as hard constraints.
- Limit multiplier allocation explicitly and inspect whether operators are actually shared.
- Pipeline only where the resource increase is justified by measured latency.
- Keep estimated clock <= 10 ns.

## Conditional Variant Set

{variant_authorization}

If a future calibrated ratio passes the same software gate, generate a minimal sequence such as:

- `v10_static_sparse_75_compact_float`
- `v11_static_sparse_62p5_compact_float`
- `v12_sparse_75_compact_resource_scheduled`
- `v13_sparse_75_compact_fixed_lowbit`
- `v14_full_csg_halt_v2`

Names must be adjusted to the actual passing ratio. Non-passing ratios must not receive HLS
variants. Each step isolates one change so compact sparsity, scheduling, low-bit fixed point,
and the full method can be attributed separately.
"""
    path = OUTPUT_DIR / "stage9_second_round_hls_plan.md"
    path.write_text(plan, encoding="utf-8")
    print("Plan:", path)
    print("Recommended:", recommended)


if __name__ == "__main__":
    main()
