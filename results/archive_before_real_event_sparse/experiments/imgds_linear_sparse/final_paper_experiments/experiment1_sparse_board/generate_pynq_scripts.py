#!/usr/bin/env python3
"""Generate all 6 PYNQ-Z2 test scripts from master template."""
import os
from pathlib import Path

BASE = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board")
PKG  = BASE / "pynq_packages"

CONFIGS = [
    {"code": "q16_s0_attn_sparse",  "paper": "Ours-Q16-S0-AttnSparse",  "d":16, "ff":32, "qbits":16, "active_dim":16, "eff_sparsity":"0%",    "sw_acc":0.9443, "lut":14004, "dsp":156, "ff_v":12903, "bram":15},
    {"code": "q16_s10_attn_sparse", "paper": "Ours-Q16-S10-AttnSparse", "d":16, "ff":32, "qbits":16, "active_dim":14, "eff_sparsity":"12.5%", "sw_acc":0.9518, "lut":None, "dsp":None, "ff_v":None, "bram":None},
    {"code": "q16_s20_attn_sparse", "paper": "Ours-Q16-S20-AttnSparse", "d":16, "ff":32, "qbits":16, "active_dim":13, "eff_sparsity":"18.75%","sw_acc":0.9515, "lut":None, "dsp":None, "ff_v":None, "bram":None},
    {"code": "q16_s30_attn_sparse", "paper": "Ours-Q16-S30-AttnSparse", "d":16, "ff":32, "qbits":16, "active_dim":11, "eff_sparsity":"31.25%","sw_acc":0.9521, "lut":None, "dsp":None, "ff_v":None, "bram":None},
    {"code": "q8_s0_attn_sparse",   "paper": "Ours-Q8-S0-AttnSparse",   "d":16, "ff":32, "qbits":8,  "active_dim":16, "eff_sparsity":"0%",    "sw_acc":0.9100, "lut":14019, "dsp":124, "ff_v":13373, "bram":15},
    {"code": "q8_s30_attn_sparse",  "paper": "Ours-Q8-S30-AttnSparse",  "d":16, "ff":32, "qbits":8,  "active_dim":11, "eff_sparsity":"31.25%","sw_acc":0.9129, "lut":None, "dsp":None, "ff_v":None, "bram":None},
]

SCRIPT_TEMPLATE = '''#!/usr/bin/env python3
"""{paper} — PYNQ-Z2 Full-Test Validation (Experiment 1)
d_model={d_model}  ff_dim={ff_dim}  quant={quant_bits}-bit  ACTIVE_DIM={active_dim}
I/O: ap_fixed<16,6> = int16 Q6.10 (scale=1024)

Stages:
  0. Reference sanity check
  1. Sanity n=1 with debug prints
  2. Quick correctness n=200
  3. Full correctness n=3444
  4a. Latency 100 runs
  4b. Latency 1000 runs

Run on PYNQ-Z2:
    sudo /usr/local/share/pynq-venv/bin/python3 run_{code}_pynq_full_test.py 2>&1 | tee {code}_pynq_log.txt
"""

import os, sys, time, csv, numpy as np

FP_SCALE      = 1 << 10   # 1024
FP_INT16_MAX  =  32767
FP_INT16_MIN  = -32768

def float_to_fixed16_6(x):
    q = np.round(x.astype(np.float64) * FP_SCALE)
    q = np.clip(q, FP_INT16_MIN, FP_INT16_MAX)
    return q.astype(np.int16)

def fixed16_6_to_float(x):
    return x.astype(np.float32) / np.float32(FP_SCALE)

# ---- Paths ----
CODE        = "{code}"
BIT_FILE    = "{code}.bit"
HWH_FILE    = "{code}.hwh"
EVAL_200    = "{code}_eval200.npz"
FULL_TEST   = "{code}_test_3444.npz"
SANITY      = "{code}_sanity.npz"
OUTPUT_CSV  = "{code}_pynq_result.csv"
PER_SAMPLE_CSV = "{code}_per_sample_outputs.csv"
PER_SAMPLE_NPZ = "{code}_per_sample_outputs.npz"

N_WARMUP = 10
SEQ_LEN = 16
INPUT_DIM = 64
N_CLASSES = 2
INPUT_ELEMS = SEQ_LEN * INPUT_DIM
LOGITS_ELEMS = N_CLASSES

# ---- AXI-Lite register offsets ----
S_AXI_BASE   = 0x40000000
CONTROL_ADDR = 0x00
INPUT_R_ADDR = 0x10
LOGITS_ADDR  = 0x1C

# ==================================================================
def reference_sanity_check():
    print("=" * 60)
    print("STAGE 0: Reference Sanity Check (no hardware)")
    print("=" * 60)
    expected = [
        ("full 3444", FULL_TEST, {sw_acc}),
        ("eval 200",  EVAL_200,  None),
        ("sanity 1",  SANITY,    None),
    ]
    for name, path, exp in expected:
        if not os.path.exists(path):
            print(f"  ERROR: {{path}} not found"); sys.exit(1)
        d = np.load(path)
        ref = d['ref_logits']; y = d['y']
        ref_pred = np.argmax(ref, axis=1)
        ref_acc = (ref_pred == y).mean()
        print(f"  {{name}}: shape={{ref.shape}} labels={{np.bincount(y.astype(int))}} argmax_ref_acc={{ref_acc:.6f}}")
        if exp is not None and abs(ref_acc - exp) > 0.02:
            print(f"    WARNING: expected ~{{exp:.4f}}, got {{ref_acc:.6f}}")
    print("  Reference sanity check PASSED.\\n")

# ==================================================================
try:
    from pynq import Overlay, allocate
    HAS_PYNQ = True
except ImportError:
    HAS_PYNQ = False

def write_ptr(ip, base_addr, phys_addr):
    pa = int(phys_addr)
    ip.write(base_addr,      pa & 0xFFFFFFFF)
    ip.write(base_addr + 4, (pa >> 32) & 0xFFFFFFFF)

def run_kernel(ip, sample_float):
    sample_fixed = float_to_fixed16_6(sample_float).ravel()
    in_buf  = allocate(shape=(INPUT_ELEMS,),  dtype=np.int16)
    out_buf = allocate(shape=(LOGITS_ELEMS,), dtype=np.int16)
    out_buf[:] = 0; out_buf.flush()
    in_buf[:] = sample_fixed[:]; in_buf.flush()
    write_ptr(ip, INPUT_R_ADDR, in_buf.physical_address)
    write_ptr(ip, LOGITS_ADDR,  out_buf.physical_address)
    ip.write(CONTROL_ADDR, 0x1)
    while (ip.read(CONTROL_ADDR) & 0x2) == 0: pass
    out_buf.invalidate()
    hw_fixed = np.asarray(out_buf, dtype=np.int16).reshape(1, N_CLASSES).copy()
    hw_float = fixed16_6_to_float(hw_fixed)
    del in_buf, out_buf
    return hw_float, hw_fixed

def prediction(logits_2d, row=0):
    return int(np.argmax(logits_2d[row]))

# ==================================================================
def stage1_sanity(ol, ip):
    print("=" * 60)
    print("STAGE 1: Sanity Check (n=1)")
    print("=" * 60)
    d = np.load(SANITY)
    X, y, ref = d['X'], d['y'], d['ref_logits']
    x0 = X[0]; x0_fixed = float_to_fixed16_6(x0).ravel()
    print(f"  I/O dtype = int16 (ap_fixed<16,6>), scale={{FP_SCALE}}")
    print(f"  first 8 input float: {{x0.ravel()[:8]}}")
    print(f"  first 8 input int16: {{x0_fixed[:8]}}")
    hw_float, hw_fixed = run_kernel(ip, x0)
    sw_p = prediction(ref, 0); hw_p = prediction(hw_float, 0)
    ok = sw_p == hw_p
    hw_finite = np.isfinite(hw_float).all()
    print(f"  Ref logits (float): [{{ref[0][0]:.6f}}, {{ref[0][1]:.6f}}]  pred={{sw_p}}")
    print(f"  HW  raw   (int16):  [{{hw_fixed[0][0]}}, {{hw_fixed[0][1]}}]")
    print(f"  HW  float:          [{{hw_float[0][0]:.6f}}, {{hw_float[0][1]:.6f}}]  pred={{hw_p}}")
    print(f"  HW isfinite: {{hw_finite}}  True label: {{y[0]}}  Match: {{'OK' if ok else 'FAIL'}}")
    if not hw_finite: print("  *** WARNING: NaN/Inf in HW output! ***")
    return ok

# ==================================================================
def stage2_quick(ol, ip, per_sample_data):
    print("\\n" + "=" * 60)
    print("STAGE 2: Quick Correctness (n=200)")
    print("=" * 60)
    d = np.load(EVAL_200)
    X, y, ref = d['X'], d['y'], d['ref_logits']; n = len(X)
    mc, hc, rc = 0, 0, 0; nan_c, inf_c = 0, 0
    me, se, fe = 0.0, 0.0, 0
    for i in range(n):
        hw_float, _ = run_kernel(ip, X[i])
        sp = prediction(ref, i); hp = prediction(hw_float, 0)
        if hp == sp: mc += 1
        if hp == y[i]: hc += 1
        if sp == y[i]: rc += 1
        hwf = hw_float.ravel()
        if not np.isfinite(hwf).all():
            if np.isnan(hwf).any(): nan_c += 1
            if np.isinf(hwf).any(): inf_c += 1
        e0, e1 = abs(hwf[0]-ref[i][0]), abs(hwf[1]-ref[i][1])
        if np.isfinite(e0) and np.isfinite(e1):
            me = max(me, e0, e1); se += e0+e1; fe += 1
        per_sample_data.append([int(y[i]), ref[i].tolist(), hwf.tolist(), sp, hp, int(sp==y[i]), int(hp==y[i]), int(hp==sp), float(max(e0,e1))])
        if i < 10:
            print(f"  [{{i}}] y={{y[i]}} ref=[{{ref[i][0]:.4f}},{{ref[i][1]:.4f}}] hw=[{{hwf[0]:.4f}},{{hwf[1]:.4f}}] sp={{sp}} hp={{hp}}")
    mr, ha, ra = mc/n, hc/n, rc/n
    ma = se/(fe*2) if fe>0 else float('nan')
    print(f"\\n  n={{n}} NaN={{nan_c}} Inf={{inf_c}}")
    print(f"  Match vs ref: {{mr:.4f}} ({{mc}}/{{n}})  HW acc: {{ha:.4f}} ({{hc}}/{{n}})  Ref acc: {{ra:.4f}} ({{rc}}/{{n}})")
    print(f"  Max err: {{me:.8f}}  Mean err: {{ma:.8f}}")
    return mr, ha, ra, me, ma, nan_c, inf_c

# ==================================================================
def stage3_full(ol, ip, per_sample_data):
    print("\\n" + "=" * 60)
    print("STAGE 3: Full Correctness (n=3444)")
    print("=" * 60)
    d = np.load(FULL_TEST)
    X, y, ref = d['X'], d['y'], d['ref_logits']; n = len(X)
    mc, hc, rc = 0, 0, 0; nan_c, inf_c = 0, 0
    me, se, fe = 0.0, 0.0, 0
    t0 = time.perf_counter()
    for i in range(n):
        hw_float, _ = run_kernel(ip, X[i])
        sp = prediction(ref, i); hp = prediction(hw_float, 0)
        if hp == sp: mc += 1
        if hp == y[i]: hc += 1
        if sp == y[i]: rc += 1
        hwf = hw_float.ravel()
        if not np.isfinite(hwf).all():
            if np.isnan(hwf).any(): nan_c += 1
            if np.isinf(hwf).any(): inf_c += 1
        e0, e1 = abs(hwf[0]-ref[i][0]), abs(hwf[1]-ref[i][1])
        if np.isfinite(e0) and np.isfinite(e1):
            me = max(me, e0, e1); se += e0+e1; fe += 1
        per_sample_data.append([int(y[i]), ref[i][0], ref[i][1], hwf[0], hwf[1], sp, hp, int(sp==y[i]), int(hp==y[i]), int(hp==sp), float(max(e0,e1))])
        if (i+1) % 500 == 0: print(f"  [{{i+1}}/{{n}}] done... match={{mc/(i+1):.4f}}")
    t1 = time.perf_counter()
    total_us = (t1-t0)*1e6
    mr, ha, ra = mc/n, hc/n, rc/n
    ma = se/(fe*2) if fe>0 else float('nan')
    tp = n/(t1-t0)
    print(f"\\n  n={{n}} NaN={{nan_c}} Inf={{inf_c}}")
    print(f"  Total time: {{total_us:.2f}} us ({{total_us/1e6:.2f}} s)")
    print(f"  Match vs ref: {{mr:.4f}} ({{mc}}/{{n}})  HW acc: {{ha:.4f}} ({{hc}}/{{n}})  Ref acc: {{ra:.4f}} ({{rc}}/{{n}})")
    print(f"  Max err: {{me:.8f}}  Mean err: {{ma:.8f}}  Throughput: {{tp:.2f}} samples/s")
    return mr, ha, ra, total_us, tp, me, ma, nan_c, inf_c

# ==================================================================
def recompute_from_per_sample(per_sample_data):
    """Independent recomputation from per-sample outputs."""
    arr = np.array(per_sample_data)
    labels = arr[:, 0].astype(int)
    ref_preds = arr[:, 5].astype(int)
    hw_preds = arr[:, 6].astype(int)
    correct_ref = arr[:, 7].astype(int)
    correct_hw = arr[:, 8].astype(int)
    match_ref_hw = arr[:, 9].astype(int)
    abs_errors = arr[:, 10].astype(float)

    n = len(arr)
    hw_acc = correct_hw.sum() / n
    ref_acc = correct_ref.sum() / n
    match_rate = match_ref_hw.sum() / n
    max_err = abs_errors.max()
    mean_err = abs_errors.mean()

    # Per-class metrics (class 1 = malware = positive)
    tp = int(((labels == 1) & (hw_preds == 1)).sum())
    fp = int(((labels == 0) & (hw_preds == 1)).sum())
    fn = int(((labels == 1) & (hw_preds == 0)).sum())
    tn = int(((labels == 0) & (hw_preds == 0)).sum())
    precision = tp / (tp + fp) if (tp + fp) > 0 else 0.0
    recall = tp / (tp + fn) if (tp + fn) > 0 else 0.0
    f1 = 2 * precision * recall / (precision + recall) if (precision + recall) > 0 else 0.0

    return dict(hw_acc=hw_acc, ref_acc=ref_acc, match_rate=match_rate,
                max_err=max_err, mean_err=mean_err,
                tp=tp, fp=fp, fn=fn, tn=tn,
                precision=precision, recall=recall, f1=f1)

# ==================================================================
def stage4_latency(ol, ip, n_runs, label=""):
    print(f"\\n" + "=" * 60)
    print(f"STAGE 4{{label}}: Kernel Latency ({{n_runs}} runs)")
    print("=" * 60)
    d = np.load(FULL_TEST)
    s0 = float_to_fixed16_6(d['X'][0]).ravel()
    in_buf  = allocate(shape=(INPUT_ELEMS,),  dtype=np.int16)
    out_buf = allocate(shape=(LOGITS_ELEMS,), dtype=np.int16)
    in_buf[:] = s0[:]; in_buf.flush()
    out_buf[:] = 0;    out_buf.flush()
    pa_in  = int(in_buf.physical_address);  pa_out = int(out_buf.physical_address)
    ilo, ihi = pa_in  & 0xFFFFFFFF, (pa_in  >> 32) & 0xFFFFFFFF
    olo, ohi = pa_out & 0xFFFFFFFF, (pa_out >> 32) & 0xFFFFFFFF
    for _ in range(N_WARMUP):
        ip.write(INPUT_R_ADDR, ilo); ip.write(INPUT_R_ADDR+4, ihi)
        ip.write(LOGITS_ADDR,  olo); ip.write(LOGITS_ADDR +4, ohi)
        ip.write(CONTROL_ADDR, 0x1)
        while (ip.read(CONTROL_ADDR) & 0x2) == 0: pass
    times = np.zeros(n_runs)
    for i in range(n_runs):
        t0 = time.perf_counter()
        ip.write(INPUT_R_ADDR, ilo); ip.write(INPUT_R_ADDR+4, ihi)
        ip.write(LOGITS_ADDR,  olo); ip.write(LOGITS_ADDR +4, ohi)
        ip.write(CONTROL_ADDR, 0x1)
        while (ip.read(CONTROL_ADDR) & 0x2) == 0: pass
        t1 = time.perf_counter()
        times[i] = (t1-t0)*1e6
    del in_buf, out_buf
    print(f"  Runs: {{n_runs}}  Mean: {{times.mean():.4f}} us  Std: {{times.std():.4f}} us")
    print(f"  Min: {{times.min():.4f}} us  Max: {{times.max():.4f}} us  P50: {{np.median(times):.4f}} us")
    return times.mean(), times.std()

# ==================================================================
def main():
    reference_sanity_check()
    if not HAS_PYNQ:
        print("PYNQ not available. Reference check only.")
        return

    print("=" * 60)
    print("{paper} PYNQ-Z2 FULL-TEST")
    print("d_model={d_model}  ff_dim={ff_dim}  active_dim={active_dim}  sparsity={eff_sparsity}")
    print("=" * 60)

    if not os.path.exists(BIT_FILE):
        print(f"ERROR: {{BIT_FILE}} not found"); sys.exit(1)
    print(f"Loading {{BIT_FILE}} ...")
    ol = Overlay(BIT_FILE)
    ip_name = list(ol.ip_dict.keys())[0]
    ip = getattr(ol, ip_name)
    print(f"IP: {{ip_name}}")

    if not stage1_sanity(ol, ip):
        print("SANITY CHECK FAILED. Stopping."); sys.exit(1)

    per_sample = []
    mr2, ha2, ra2, mx2, mn2, nan2, inf2 = stage2_quick(ol, ip, per_sample)
    mr3, ha3, ra3, total_us, tp, mx3, mn3, nan3, inf3 = stage3_full(ol, ip, per_sample)
    km100, ks100 = stage4_latency(ol, ip, 100, "a")
    km1k,  ks1k  = stage4_latency(ol, ip, 1000, "b")

    # --- Independent recomputation ---
    n_full = 3444
    per_sample_full = per_sample[-n_full:]  # last n_full entries are from stage 3
    rec = recompute_from_per_sample(per_sample_full)

    print("\\n" + "=" * 60)
    print("INDEPENDENT RECOMPUTATION FROM PER-SAMPLE OUTPUTS")
    print("=" * 60)
    print(f"  HW acc: {{rec['hw_acc']:.6f}}  Ref acc: {{rec['ref_acc']:.6f}}  Match: {{rec['match_rate']:.6f}}")
    print(f"  Precision: {{rec['precision']:.6f}}  Recall: {{rec['recall']:.6f}}  F1: {{rec['f1']:.6f}}")
    print(f"  TP={{rec['tp']}} FP={{rec['fp']}} FN={{rec['fn']}} TN={{rec['tn']}}")
    print(f"  Max err: {{rec['max_err']:.8f}}  Mean err: {{rec['mean_err']:.8f}}")

    # --- Save per-sample outputs ---
    print("\\n" + "=" * 60)
    print("SAVING PER-SAMPLE OUTPUTS")
    print("=" * 60)
    cols = ["label","ref_logit0","ref_logit1","hw_logit0","hw_logit1","ref_pred","hw_pred","correct_ref","correct_hw","match_ref_hw","abs_error"]
    with open(PER_SAMPLE_CSV, 'w', newline='') as f:
        w = csv.writer(f); w.writerow(cols)
        for row in per_sample_full: w.writerow(row)
    print(f"  {{PER_SAMPLE_CSV}} ({{len(per_sample_full)}} samples)")

    # Save per-sample npz
    arr = np.array(per_sample_full)
    np.savez(PER_SAMPLE_NPZ,
             labels=arr[:,0].astype(int),
             ref_logits=np.array([[r[0],r[1]] for r in arr[:,1:3].tolist()], dtype=np.float32),
             hw_logits=np.array([[r[0],r[1]] for r in arr[:,3:5].tolist()], dtype=np.float32),
             ref_pred=arr[:,5].astype(int), hw_pred=arr[:,6].astype(int),
             correct_ref=arr[:,7].astype(int), correct_hw=arr[:,8].astype(int),
             match_ref_hw=arr[:,9].astype(int), abs_error=arr[:,10].astype(float))
    print(f"  {{PER_SAMPLE_NPZ}} saved")

    # --- Save result CSV ---
    print("\\nSAVING RESULTS")
    n = len(per_sample_full)
    rows = [
        ("model_id", "{paper}"), ("code_name", CODE), ("d_model", {d_model}), ("ff_dim", {ff_dim}),
        ("quant_bits", {quant_bits}), ("nominal_sparsity", "{eff_sparsity}"), ("active_dim", {active_dim}),
        ("vivado_lut", {lut_str}), ("vivado_dsp", {dsp_str}), ("vivado_ff", {ff_v_str}), ("vivado_bram", {bram_str}),
        ("software_accuracy", {sw_acc}),
        ("hw_label_accuracy", round(rec['hw_acc'], 6)), ("ref_label_accuracy", round(rec['ref_acc'], 6)),
        ("precision", round(rec['precision'], 6)), ("recall", round(rec['recall'], 6)), ("f1", round(rec['f1'], 6)),
        ("prediction_match_rate", round(rec['match_rate'], 6)),
        ("max_abs_error", round(rec['max_err'], 8)), ("mean_abs_error", round(rec['mean_err'], 8)),
        ("nan_samples", int(nan3)), ("inf_samples", int(inf3)),
        ("kernel_runtime_mean_us_100runs",  round(km100, 6)),
        ("kernel_runtime_std_us_100runs",   round(ks100, 6)),
        ("latency_us_1000runs", round(km1k, 6)), ("latency_std_us_1000runs", round(ks1k, 6)),
        ("total_runtime_us_correctness", round(total_us, 6)),
        ("throughput_samples_per_sec", round(tp, 6)),
        ("speedup_vs_ViT4Mal_fastest_810ms", round(810000.0 / total_us, 2)),
        ("speedup_vs_ViT4Mal_recommended_1480ms", round(1480000.0 / total_us, 2)),
        ("latency_source", "PYNQ_Z2_MEASURED"), ("pynq_measured", True),
        ("per_sample_verified", True), ("evidence_level", "FULL_3444_INDEPENDENTLY_RECOMPUTED"),
        ("notes", "{paper} (d={d_model}/ff={ff_dim}) PYNQ-Z2. ACTIVE_DIM={active_dim}. HW acc={{rec['hw_acc']:.4f}}. Latency={{km1k:.2f}}us.")
    ]
    with open(OUTPUT_CSV, 'w', newline='') as f:
        w = csv.writer(f); w.writerow(["metric", "value"])
        for k, v in rows: w.writerow([k, v])
    print(f"Results: {{OUTPUT_CSV}}")

    print(f"\\n{'='*60}")
    print(f"{{CODE}} - COMPLETE")
    print(f"  HW accuracy: {{rec['hw_acc']:.6f}}  F1: {{rec['f1']:.6f}}")
    print(f"  Latency (1000 runs): {{km1k:.2f}} us  Throughput: {{tp:.2f}} samp/s")
    print(f"  Speedup vs ViT4Mal: {{810000.0/total_us:.1f}}x")
    print(f"{{'='*60}}\\n")

if __name__ == "__main__":
    main()
'''

# ==================================================================
def generate():
    for cfg in CONFIGS:
        code = cfg["code"]
        pkg_dir = PKG / code
        pkg_dir.mkdir(parents=True, exist_ok=True)

        script = SCRIPT_TEMPLATE.format(
            paper=cfg["paper"], code=code,
            d_model=cfg["d"], ff_dim=cfg["ff"],
            quant_bits=cfg["qbits"], active_dim=cfg["active_dim"],
            eff_sparsity=cfg["eff_sparsity"], sw_acc=cfg["sw_acc"],
            lut_str=str(cfg["lut"]) if cfg["lut"] is not None else "None",
            dsp_str=str(cfg["dsp"]) if cfg["dsp"] is not None else "None",
            ff_v_str=str(cfg["ff_v"]) if cfg["ff_v"] is not None else "None",
            bram_str=str(cfg["bram"]) if cfg["bram"] is not None else "None",
        )

        script_path = pkg_dir / f"run_{code}_pynq_full_test.py"
        script_path.write_text(script)
        print(f"  ✅ {cfg['paper']}: {script_path}")

if __name__ == "__main__":
    generate()
