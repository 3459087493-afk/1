
#!/usr/bin/env python3
"""Q16 S0 Direct mmap PYNQ-Z2 full test — no PYNQ library needed."""
import os, sys, time, mmap, struct, csv
import numpy as np

S_AXI = 0x40000000; CTL = 0x00; IN_R = 0x10; OUT_R = 0x1C
FP_SCALE = 1024; PS = os.sysconf('SC_PAGE_SIZE')
CODE = "q16_s0_attn_sparse"

print("="*60)
print("Q16 S0 Direct mmap PYNQ-Z2 Test")
print("="*60)

# Open mmap
fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)
mem = mmap.mmap(fd, 0x10000, offset=S_AXI); os.close(fd)
def rd(o): return struct.unpack('<I', mem[o:o+4])[0]
def wr(o, v): mem[o:o+4] = struct.pack('<I', v & 0xFFFFFFFF)

# Conversion
def f2f(x):
    q = np.clip(np.round(x.astype(np.float64)*FP_SCALE), -32768, 32767)
    return q.astype(np.int16)
def f2fl(x):
    return x.astype(np.float32) / np.float32(FP_SCALE)

# Phys addr helper
def phys(a):
    vpn = int(a) // PS
    with open('/proc/self/pagemap', 'rb') as f:
        f.seek(vpn * 8)
        e = struct.unpack('<Q', f.read(8))[0]
    if not (e & (1<<63)): return None
    return ((e & ((1<<55)-1)) * PS) + (int(a) % PS)

# Allocate DMA buffers
ib = np.zeros(1024, dtype=np.int16); ob = np.zeros(2, dtype=np.int16)
pi = phys(ib.ctypes.data); po = phys(ob.ctypes.data)
print("DMA: in=0x%x out=0x%x" % (pi, po))

if not pi or not po:
    print("ERROR: no phys addr"); sys.exit(1)

def kernel(xf):
    ib[:] = f2f(xf).ravel(); ob[:] = 0
    wr(IN_R, pi & 0xFFFFFFFF); wr(IN_R+4, (pi>>32)&0xFFFFFFFF)
    wr(OUT_R, po & 0xFFFFFFFF); wr(OUT_R+4, (po>>32)&0xFFFFFFFF)
    wr(CTL, 0x1)
    for _ in range(5000000):
        if rd(CTL) & 0x2: break
    else:
        return None, None
    hw_i = ob.copy(); hw_f = f2fl(hw_i)
    return hw_f, hw_i

# Stage 0: Reference check
print("\n--- Stage 0: Reference ---")
d_full = np.load(f"{CODE}_test_3444.npz")
d_200 = np.load(f"{CODE}_eval200.npz")
d_s1 = np.load(f"{CODE}_sanity.npz")
for name, dd in [("full", d_full), ("eval200", d_200), ("sanity", d_s1)]:
    rp = np.argmax(dd['ref_logits'], axis=1)
    acc = (rp == dd['y']).mean()
    print("  %s: ref_acc=%.6f shape=%s" % (name, acc, dd['ref_logits'].shape))

# Stage 1: Sanity n=1
print("\n--- Stage 1: Sanity ---")
hf, hi = kernel(d_s1['X'][0])
if hf is None: print("SANITY FAILED"); sys.exit(1)
rp = int(np.argmax(d_s1['ref_logits'][0]))
hp = int(np.argmax(hf))
fin = np.isfinite(hf).all()
print("  Ref: [%.6f, %.6f] pred=%d" % (d_s1['ref_logits'][0][0], d_s1['ref_logits'][0][1], rp))
print("  HW:  [%.6f, %.6f] pred=%d int16=[%d,%d]" % (hf[0], hf[1], hp, hi[0], hi[1]))
print("  OK=%s" % (rp==hp))

# Stage 2: Quick 200
print("\n--- Stage 2: Quick n=200 ---")
X, y, ref = d_200['X'], d_200['y'], d_200['ref_logits']
mc = hc = rc = 0; nan = inf = 0; me = se = fe = 0.0
for i in range(200):
    hf, _ = kernel(X[i])
    sp = int(np.argmax(ref[i])); hp = int(np.argmax(hf))
    if hp == sp: mc += 1
    if hp == y[i]: hc += 1
    if sp == y[i]: rc += 1
    if not np.isfinite(hf).all():
        if np.isnan(hf).any(): nan += 1
        if np.isinf(hf).any(): inf += 1
    e0, e1 = abs(hf[0]-ref[i][0]), abs(hf[1]-ref[i][1])
    if np.isfinite(e0) and np.isfinite(e1):
        me = max(me, e0, e1); se += e0+e1; fe += 1
    if i < 10:
        print("  [%d] y=%d ref=[%.4f,%.4f] hw=[%.4f,%.4f] m=%s" % (i, y[i], ref[i][0], ref[i][1], hf[0], hf[1], "OK" if hp==sp else "X"))
ma = se/(fe*2) if fe else float('nan')
print("  n=%d NaN=%d Inf=%d match=%.4f (%d/200) hw_acc=%.4f ref_acc=%.4f max_err=%.6f mean_err=%.6f" % (200, nan, inf, mc/200, mc, hc/200, rc/200, me, ma))

# Stage 3: Full 3444
print("\n--- Stage 3: Full n=3444 ---")
X, y, ref = d_full['X'], d_full['y'], d_full['ref_logits']
mc = hc = rc = 0; nan = inf = 0; me = se = fe = 0.0
ps_data = []
t0 = time.perf_counter()
for i in range(3444):
    hf, _ = kernel(X[i])
    sp = int(np.argmax(ref[i])); hp = int(np.argmax(hf))
    if hp == sp: mc += 1
    if hp == y[i]: hc += 1
    if sp == y[i]: rc += 1
    f = np.isfinite(hf).all()
    if not f:
        if np.isnan(hf).any(): nan += 1
        if np.isinf(hf).any(): inf += 1
    e0, e1 = abs(hf[0]-ref[i][0]), abs(hf[1]-ref[i][1])
    if np.isfinite(e0) and np.isfinite(e1):
        me = max(me, e0, e1); se += e0+e1; fe += 1
    ps_data.append([int(y[i]), float(ref[i][0]), float(ref[i][1]), float(hf[0]), float(hf[1]),
                    sp, hp, int(sp==y[i]), int(hp==y[i]), int(hp==sp), float(max(e0,e1))])
    if (i+1) % 500 == 0: print("  [%d/3444] match=%.4f" % (i+1, mc/(i+1)))
t1 = time.perf_counter()
total_us = (t1-t0)*1e6; tp = 3444/(t1-t0)
ma = se/(fe*2) if fe else float('nan')
print("  n=%d NaN=%d Inf=%d" % (3444, nan, inf))
print("  match=%.4f (%d) hw_acc=%.4f ref_acc=%.4f" % (mc/3444, mc, hc/3444, rc/3444))
print("  max_err=%.6f mean_err=%.6f time=%.2fs tp=%.2f samp/s" % (me, ma, (t1-t0), tp))

# Per-class metrics
arr = np.array(ps_data)
hw_preds = arr[:,6].astype(int); labels = arr[:,0].astype(int)
tp_n = int(((labels==1)&(hw_preds==1)).sum())
fp_n = int(((labels==0)&(hw_preds==1)).sum())
fn_n = int(((labels==1)&(hw_preds==0)).sum())
tn_n = int(((labels==0)&(hw_preds==0)).sum())
prec = tp_n/(tp_n+fp_n) if (tp_n+fp_n)>0 else 0
rec = tp_n/(tp_n+fn_n) if (tp_n+fn_n)>0 else 0
f1 = 2*prec*rec/(prec+rec) if (prec+rec)>0 else 0
print("  TP=%d FP=%d FN=%d TN=%d Prec=%.4f Rec=%.4f F1=%.4f" % (tp_n, fp_n, fn_n, tn_n, prec, rec, f1))

# Stage 4a: Latency 100
print("\n--- Stage 4a: Latency 100 ---")
s0 = f2f(d_full['X'][0]).ravel()
wr(IN_R, pi & 0xFFFFFFFF); wr(IN_R+4, (pi>>32)&0xFFFFFFFF)
wr(OUT_R, po & 0xFFFFFFFF); wr(OUT_R+4, (po>>32)&0xFFFFFFFF)
for _ in range(10):  # warmup
    ib[:] = s0; wr(CTL, 0x1)
    while (rd(CTL) & 0x2) == 0: pass
times = np.zeros(100)
for i in range(100):
    t0 = time.perf_counter()
    wr(CTL, 0x1)
    while (rd(CTL) & 0x2) == 0: pass
    t1 = time.perf_counter()
    times[i] = (t1-t0)*1e6
print("  100 runs: mean=%.2f us std=%.2f us min=%.2f max=%.2f p50=%.2f" % (times.mean(), times.std(), times.min(), times.max(), np.median(times)))

# Stage 4b: Latency 1000
print("\n--- Stage 4b: Latency 1000 ---")
times2 = np.zeros(1000)
for i in range(1000):
    t0 = time.perf_counter()
    wr(CTL, 0x1)
    while (rd(CTL) & 0x2) == 0: pass
    t1 = time.perf_counter()
    times2[i] = (t1-t0)*1e6
print("  1000 runs: mean=%.2f us std=%.2f us p50=%.2f" % (times2.mean(), times2.std(), np.median(times2)))

# Save results
print("\n--- Saving ---")
speedup_fast = 810000.0 / times2.mean()
speedup_rec = 1480000.0 / times2.mean()
rows = [
    ("model_id", "Ours-Q16-S0-AttnSparse"), ("code_name", CODE),
    ("d_model", 16), ("ff_dim", 32), ("quant_bits", 16),
    ("active_dim", 16), ("effective_sparsity", "0%"),
    ("vivado_lut", 14004), ("vivado_dsp", 156), ("vivado_ff", 12903), ("vivado_bram", 15),
    ("hw_label_accuracy", round(hc/3444, 6)), ("ref_label_accuracy", round(rc/3444, 6)),
    ("precision", round(prec, 6)), ("recall", round(rec, 6)), ("f1", round(f1, 6)),
    ("prediction_match_rate", round(mc/3444, 6)),
    ("max_abs_error", round(me, 8)), ("mean_abs_error", round(ma, 8)),
    ("nan_samples", nan), ("inf_samples", inf),
    ("latency_us_100runs", round(times.mean(), 4)),
    ("latency_us_1000runs", round(times2.mean(), 4)),
    ("latency_std_1000runs", round(times2.std(), 4)),
    ("total_runtime_us", round(total_us, 2)),
    ("throughput_samples_per_sec", round(tp, 2)),
    ("speedup_vs_ViT4Mal_fastest", round(speedup_fast, 2)),
    ("speedup_vs_ViT4Mal_recommended", round(speedup_rec, 2)),
    ("latency_source", "PYNQ_Z2_MEASURED_DIRECT_MMAP"),
    ("pynq_measured", True),
    ("per_sample_verified", True),
    ("notes", "Q16 S0 direct mmap test. LUT=14004 DSP=156 hw_acc=%.4f latency=%.2fus." % (hc/3444, times2.mean())),
]
with open(f"{CODE}_pynq_result.csv", 'w') as f:
    w = csv.writer(f); w.writerow(["metric","value"])
    for k,v in rows: w.writerow([k,v])
print("  %s_pynq_result.csv" % CODE)

# Save per-sample
with open(f"{CODE}_per_sample_outputs.csv", 'w') as f:
    w = csv.writer(f)
    w.writerow(["label","ref_logit0","ref_logit1","hw_logit0","hw_logit1","ref_pred","hw_pred","correct_ref","correct_hw","match_ref_hw","abs_error"])
    for row in ps_data: w.writerow(row)
np.savez(f"{CODE}_per_sample_outputs.npz",
    labels=arr[:,0].astype(int), ref_logits=arr[:,1:3].astype(np.float32),
    hw_logits=arr[:,3:5].astype(np.float32), ref_pred=arr[:,5].astype(int),
    hw_pred=arr[:,6].astype(int), correct_ref=arr[:,7].astype(int),
    correct_hw=arr[:,8].astype(int), match_ref_hw=arr[:,9].astype(int),
    abs_error=arr[:,10].astype(float))
print("  %s_per_sample_outputs.csv" % CODE)
print("  %s_per_sample_outputs.npz" % CODE)

print("\n" + "="*60)
print("Q16 S0 TEST COMPLETE")
print("  HW acc: %.4f  F1: %.4f  Latency: %.2f us  Speedup: %.1fx" % (hc/3444, f1, times2.mean(), speedup_fast))
print("="*60)

