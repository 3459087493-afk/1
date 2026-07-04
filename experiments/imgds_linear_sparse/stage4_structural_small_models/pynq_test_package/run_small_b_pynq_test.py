#!/usr/bin/env python3
"""
small_B PYNQ-Z2 On-Board Test Script (v3 — int16 fixed-point I/O)
===================================================================
Deploy small_B (d=8, ff=16) Linear Transformer IP to PYNQ-Z2.

FIXES v3 (2026-07-01):
  - HLS data_t = ap_fixed<16,6> = 16-bit. m_axi DMA reads/writes int16, NOT float32.
  - Input: float32 → int16 (scale ×1024, Q6.10 fixed-point)
  - Output: int16 → float32 (÷1024)
  - 64-bit physical address split into low/high 32-bit halves
  - np.argmax for prediction direction
  - NaN/Inf tracking, finite-only error stats
  - Reference sanity check (Stage 0, no hardware)
  - Speedup = baseline / ours (not inverted)

Run on PYNQ-Z2:
    sudo python3 run_small_b_pynq_test.py
"""

import os, sys, time, csv, numpy as np

# ===================================================================
# Fixed-point conversion: ap_fixed<16,6> → Q6.10 → scale = 2^10 = 1024
# ===================================================================
FP_SCALE      = 1 << 10  # 1024
FP_INT16_MAX  =  32767
FP_INT16_MIN  = -32768

def float_to_fixed16_6(x):
    """Convert float32 to ap_fixed<16,6> int16 representation."""
    q = np.round(x.astype(np.float64) * FP_SCALE)
    q = np.clip(q, FP_INT16_MIN, FP_INT16_MAX)
    return q.astype(np.int16)

def fixed16_6_to_float(x):
    """Convert ap_fixed<16,6> int16 representation back to float32."""
    return x.astype(np.float32) / np.float32(FP_SCALE)

# ===================================================================
# Reference sanity check (no hardware required)
# ===================================================================
def reference_sanity_check():
    print("=" * 60)
    print("STAGE 0: Reference Sanity Check (no hardware)")
    print("=" * 60)
    for name, path in [("full 3444", "small_B_test_3444.npz"),
                       ("eval 200", "small_B_eval200.npz"),
                       ("sanity 1", "small_B_sanity.npz")]:
        if not os.path.exists(path):
            print(f"  ERROR: {path} not found"); sys.exit(1)
        d = np.load(path)
        ref = d['ref_logits']; y = d['y']
        ref_pred = np.argmax(ref, axis=1)
        ref_acc = (ref_pred == y).mean()
        print(f"  {name}: shape={ref.shape}, labels={np.bincount(y.astype(int))}, argmax_ref_acc={ref_acc:.6f}")
    print("  Reference sanity check PASSED.\n")

# ===================================================================
# PYNQ imports
# ===================================================================
try:
    from pynq import Overlay, allocate
    HAS_PYNQ = True
except ImportError:
    HAS_PYNQ = False

# ---- Paths ----
BIT_FILE  = "small_b.bit"
HWH_FILE  = "small_b.hwh"
EVAL_200  = "small_B_eval200.npz"
FULL_TEST = "small_B_test_3444.npz"
SANITY    = "small_B_sanity.npz"
OUTPUT_CSV = "small_B_pynq_result.csv"

N_WARMUP = 10

# ---- AXI-Lite register offsets (from ximgds_linear_small_b_hw.h) ----
# 0x00: Control (bit0=ap_start, bit1=ap_done)
# 0x10+0x14: 64-bit base address of input (gmem0)
# 0x1C+0x20: 64-bit base address of logits (gmem1)
S_AXI_BASE   = 0x40000000
CONTROL_ADDR = 0x00
INPUT_R_ADDR = 0x10   # input_r[31:0]  + 0x14 = input_r[63:32]
LOGITS_ADDR  = 0x1C   # logits[31:0]   + 0x20 = logits[63:32]
SEQ_LEN      = 16
INPUT_DIM    = 64
N_CLASSES    = 2
# Buffer sizes in int16 elements
INPUT_ELEMS  = SEQ_LEN * INPUT_DIM   # 1024 int16
LOGITS_ELEMS = N_CLASSES             # 2 int16

# ===================================================================
# AXI pointer helper
# ===================================================================
def write_ptr(ip, base_addr, phys_addr):
    """Write 64-bit physical address split into two 32-bit register writes."""
    pa = int(phys_addr)
    ip.write(base_addr,      pa & 0xFFFFFFFF)
    ip.write(base_addr + 4, (pa >> 32) & 0xFFFFFFFF)

# ===================================================================
# Hardware kernel
# ===================================================================
def run_kernel(ip, sample_float):
    """Run single inference. Returns HW logits as float32 [1, 2]."""
    sample_fixed = float_to_fixed16_6(sample_float).ravel()

    in_buf  = allocate(shape=(INPUT_ELEMS,),  dtype=np.int16)
    out_buf = allocate(shape=(LOGITS_ELEMS,), dtype=np.int16)

    out_buf[:] = 0
    out_buf.flush()

    in_buf[:] = sample_fixed[:]
    in_buf.flush()

    write_ptr(ip, INPUT_R_ADDR, in_buf.physical_address)
    write_ptr(ip, LOGITS_ADDR,  out_buf.physical_address)

    ip.write(CONTROL_ADDR, 0x1)
    while (ip.read(CONTROL_ADDR) & 0x2) == 0:
        pass

    out_buf.invalidate()
    hw_fixed = np.asarray(out_buf, dtype=np.int16).reshape(1, N_CLASSES).copy()
    hw_float = fixed16_6_to_float(hw_fixed)

    del in_buf, out_buf
    return hw_float, hw_fixed


# ===================================================================
def prediction(logits_2d, row=0):
    return int(np.argmax(logits_2d[row]))

# ===================================================================
# Stage 1: Sanity
# ===================================================================
def stage1_sanity(ol, ip):
    print("=" * 60)
    print("STAGE 1: Sanity Check (n=1) — int16 fixed-point I/O")
    print("=" * 60)
    d = np.load(SANITY)
    X, y, ref = d['X'], d['y'], d['ref_logits']

    # Show raw fixed-point conversion
    x0 = X[0]
    x0_fixed = float_to_fixed16_6(x0).ravel()
    print(f"  external_io_dtype = ap_fixed<16,6> (int16, scale={FP_SCALE})")
    print(f"  input buffer dtype = int16")
    print(f"  output buffer dtype = int16")
    print(f"  first 8 input float:  {x0.ravel()[:8]}")
    print(f"  first 8 input int16:  {x0_fixed[:8]}")

    hw_float, hw_fixed = run_kernel(ip, x0)

    sw_p = prediction(ref, 0)
    hw_p = prediction(hw_float, 0)
    ok   = sw_p == hw_p
    hw_finite = np.isfinite(hw_float).all()

    print(f"  Ref logits (float): [{ref[0][0]:.6f}, {ref[0][1]:.6f}]  pred={sw_p}")
    print(f"  HW  raw   (int16):  [{hw_fixed[0][0]}, {hw_fixed[0][1]}]")
    print(f"  HW  float:          [{hw_float[0][0]:.6f}, {hw_float[0][1]:.6f}]  pred={hw_p}")
    print(f"  HW isfinite: {hw_finite}")
    print(f"  True label: {y[0]}   Match SW==HW: {'OK' if ok else 'FAIL'}")

    if not hw_finite:
        print("  *** WARNING: Hardware output contains NaN or Inf! ***")
    return ok

# ===================================================================
# Stage 2: Quick 200
# ===================================================================
def stage2_quick(ol, ip):
    print("\n" + "=" * 60)
    print("STAGE 2: Quick Correctness (n=200)")
    print("=" * 60)
    d = np.load(EVAL_200)
    X, y, ref = d['X'], d['y'], d['ref_logits']
    n = len(X)
    mc, hc, rc = 0, 0, 0
    nan_c, inf_c = 0, 0
    me, se, fe = 0.0, 0.0, 0

    for i in range(n):
        hw_float, hw_fixed = run_kernel(ip, X[i])
        sp = prediction(ref, i)
        hp = prediction(hw_float, 0)

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

        if i < 10:
            print(f"  [{i}] y={y[i]} ref=[{ref[i][0]:.4f},{ref[i][1]:.4f}] "
                  f"hw=[{hwf[0]:.4f},{hwf[1]:.4f}] sp={sp} hp={hp} fin={np.isfinite(hwf).all()}")

    mr, ha, ra = mc/n, hc/n, rc/n
    ma = se/(fe*2) if fe > 0 else float('nan')
    print(f"\n  Samples: {n}  NaN={nan_c}  Inf={inf_c}")
    print(f"  Match vs ref: {mr:.4f} ({mc}/{n})")
    print(f"  HW acc:  {ha:.4f} ({hc}/{n})")
    print(f"  Ref acc: {ra:.4f} ({rc}/{n})")
    print(f"  Max err: {me:.8f}  Mean err: {ma:.8f}")
    return mr, ha, ra, me, ma

# ===================================================================
# Stage 3: Full 3444
# ===================================================================
def stage3_full(ol, ip):
    print("\n" + "=" * 60)
    print("STAGE 3: Full Correctness (n=3444)")
    print("=" * 60)
    d = np.load(FULL_TEST)
    X, y, ref = d['X'], d['y'], d['ref_logits']
    n = len(X)
    mc, hc, rc = 0, 0, 0
    nan_c, inf_c = 0, 0
    me, se, fe = 0.0, 0.0, 0

    t0 = time.perf_counter()
    for i in range(n):
        hw_float, _ = run_kernel(ip, X[i])
        sp = prediction(ref, i)
        hp = prediction(hw_float, 0)

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

        if (i+1) % 500 == 0:
            print(f"  [{i+1}/{n}] done...")

    t1 = time.perf_counter()
    total_us  = (t1-t0)*1e6
    mr, ha, ra = mc/n, hc/n, rc/n
    ma = se/(fe*2) if fe>0 else float('nan')
    tp = n/(t1-t0)

    print(f"\n  Samples: {n}  NaN={nan_c}  Inf={inf_c}")
    print(f"  Total time: {total_us:.2f} us ({total_us/1e6:.2f} s)")
    print(f"  Match vs ref: {mr:.4f} ({mc}/{n})")
    print(f"  HW acc:  {ha:.4f} ({hc}/{n})")
    print(f"  Ref acc: {ra:.4f} ({rc}/{n})")
    print(f"  Max err: {me:.8f}  Mean err: {ma:.8f}")
    print(f"  Throughput: {tp:.2f} samples/s")
    return mr, ha, ra, total_us, tp, me, ma, nan_c, inf_c

# ===================================================================
# Stage 4: Latency
# ===================================================================
def stage4_latency(ol, ip, n_runs, label=""):
    print(f"\n" + "=" * 60)
    print(f"STAGE 4{label}: Kernel Latency ({n_runs} runs)")
    print("=" * 60)
    d = np.load(FULL_TEST)
    s0 = float_to_fixed16_6(d['X'][0]).ravel()

    in_buf  = allocate(shape=(INPUT_ELEMS,),  dtype=np.int16)
    out_buf = allocate(shape=(LOGITS_ELEMS,), dtype=np.int16)
    in_buf[:] = s0[:]; in_buf.flush()
    out_buf[:] = 0;    out_buf.flush()

    pa_in  = int(in_buf.physical_address)
    pa_out = int(out_buf.physical_address)
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
    print(f"  Runs: {n_runs}  Mean: {times.mean():.4f} us  Std: {times.std():.4f} us")
    print(f"  Min: {times.min():.4f} us  Max: {times.max():.4f} us  P50: {np.median(times):.4f} us")
    return times.mean(), times.std()

# ===================================================================
# Main
# ===================================================================
def main():
    reference_sanity_check()

    if not HAS_PYNQ:
        print("PYNQ not available. Reference check only. Run on PYNQ-Z2 for hardware stages.")
        return

    print("=" * 60)
    print("small_B PYNQ-Z2 ON-BOARD TEST (v3: int16 fixed-point I/O)")
    print("d_model=8  ff_dim=16  data_t=ap_fixed<16,6>")
    print("Vivado LUT=13,095  DSP=98  Acc(SW)=95.18%")
    print("=" * 60)

    print(f"\n  I/O config: {INPUT_ELEMS} int16 input, {LOGITS_ELEMS} int16 output")
    print(f"  Fixed-point scale: 1/{FP_SCALE}  (Q6.10)")

    if not os.path.exists(BIT_FILE):
        print(f"ERROR: {BIT_FILE} not found"); sys.exit(1)
    print(f"Loading {BIT_FILE} ...")
    ol = Overlay(BIT_FILE)
    ip_name = list(ol.ip_dict.keys())[0]
    ip = getattr(ol, ip_name)
    print(f"IP: {ip_name}  IP dict: {ol.ip_dict}")
    print(f"Register map: {ip.register_map}")

    if not stage1_sanity(ol, ip):
        print("SANITY CHECK FAILED. Stopping."); sys.exit(1)

    mr2, ha2, ra2, mx2, mn2 = stage2_quick(ol, ip)
    mr3, ha3, ra3, total_us, tp, mx3, mn3, nan3, inf3 = stage3_full(ol, ip)
    km100, ks100 = stage4_latency(ol, ip, 100, "a")
    km1k,  ks1k  = stage4_latency(ol, ip, 1000, "b")

    # ---- Save CSV ----
    print("\n" + "=" * 60)
    print("SAVING RESULTS")
    print("=" * 60)

    rows = [
        ("model_id", "small_B"), ("d_model", 8), ("ff_dim", 16), ("quant_bits", 16),
        ("vivado_lut", 13095), ("vivado_dsp", 98), ("vivado_ff", 12154), ("vivado_bram", 11),
        ("software_accuracy", 0.9518),
        ("io_dtype", "int16 (ap_fixed<16,6>)"),
        ("fp_scale", FP_SCALE),
        ("n_sanity_samples", 1), ("n_correctness_samples", 3444),
        ("prediction_match_rate_vs_small_B_ref", round(mr3, 6)),
        ("hw_label_accuracy", round(ha3, 6)),
        ("ref_label_accuracy", round(ra3, 6)),
        ("max_abs_error_vs_small_B_ref", round(mx3, 8) if np.isfinite(mx3) else "nan"),
        ("mean_abs_error_vs_small_B_ref", round(mn3, 8) if np.isfinite(mn3) else "nan"),
        ("kernel_runtime_mean_us_100runs", round(km100, 6)),
        ("kernel_runtime_std_us_100runs", round(ks100, 6)),
        ("kernel_runtime_mean_us_1000runs", round(km1k, 6)),
        ("kernel_runtime_std_us_1000runs", round(ks1k, 6)),
        ("total_runtime_mean_us_correctness", round(total_us, 6)),
        ("throughput_samples_per_sec", round(tp, 6)),
        ("latency_source", "PYNQ_Z2_MEASURED"),
        ("pynq_measured", "True"),
        ("nan_count_full_test", nan3),
        ("inf_count_full_test", inf3),
        ("speedup_vs_ViT4Mal_fastest", round(810000.0 / total_us, 2)),
        ("speedup_vs_ViT4Mal_recommended", round(1480000.0 / total_us, 2)),
        ("notes", f"small_B (d=8/ff=16) PYNQ-Z2 measured v3. int16 I/O (ap_fixed<16,6>). "
                  f"FIXED: int16 buffers, 64-bit addr split, argmax prediction. "
                  f"DEBUG: speedup is approximate, correctness not yet confirmed."),
    ]

    with open(OUTPUT_CSV, 'w', newline='') as f:
        w = csv.writer(f)
        w.writerow(["metric", "value"])
        for k, v in rows: w.writerow([k, v])

    print(f"Results: {OUTPUT_CSV}")

    # Speedup (DEBUG only until correctness verified)
    vit_f, vit_r = 810000.0, 1480000.0
    print(f"\n=== DEBUG LATENCY (correctness not yet verified) ===")
    print(f"Kernel latency (1000 runs): {km1k:.2f} us")
    print(f"Total time (3444 samples):  {total_us:.2f} us")
    print(f"Speedup vs ViT4Mal fastest:  {vit_f/total_us:.2f}x")
    print(f"Speedup vs ViT4Mal rec:      {vit_r/total_us:.2f}x")
    print(f"⚠ speedup is DEBUG ONLY — correctness pending")
    print("\nsmall_B PYNQ test complete.")

if __name__ == "__main__":
    main()
