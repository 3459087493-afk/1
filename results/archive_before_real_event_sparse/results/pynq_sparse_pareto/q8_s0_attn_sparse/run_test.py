
import os, sys, time, csv
import numpy as np

os.environ['XILINX_XRT'] = '/usr'
sys.path.insert(0, '/usr/local/share/pynq-venv/lib/python3.10/site-packages')

from pynq import Overlay, allocate

CODE = 'q8_s0_attn_sparse'
FP_SCALE = 1024
IN_R, OUT_R, CTL = 0x10, 0x1C, 0x00

print('='*60)
print('Q8 S0 PYNQ-Z2 FULL TEST')
print('='*60)

d_full = np.load(f'{CODE}_test_3444.npz')
d_200 = np.load(f'{CODE}_eval200.npz')
d_s1 = np.load(f'{CODE}_sanity.npz')

# Stage 0
for name, dd in [('full', d_full), ('eval200', d_200), ('sanity', d_s1)]:
    ref_logits = dd['ref_logits']
    rp = np.argmax(ref_logits, axis=1)
    acc = (rp == dd['y']).mean()
    print(f'  {name}: ref_acc={acc:.6f}')

# Load
print('\nLoading overlay...')
ol = Overlay(f'{CODE}.bit')
ip_name = list(ol.ip_dict.keys())[0]
ip = getattr(ol, ip_name)
print(f'IP: {ip_name}')

def f2f(x):
    q = np.clip(np.round(x.astype(np.float64)*FP_SCALE), -32768, 32767)
    return q.astype(np.int16)
def f2fl(x):
    return x.astype(np.float32) / np.float32(FP_SCALE)

ib = allocate((1024,), dtype=np.int16)
ob = allocate((2,), dtype=np.int16)
pa_in = ib.physical_address; pa_out = ob.physical_address
print(f'DMA: in=0x{pa_in:x} out=0x{pa_out:x}')

def kernel(xf):
    ib_np = np.asarray(ib); ob_np = np.asarray(ob)
    ib_np[:] = f2f(xf).ravel(); ob_np[:] = 0
    ip.write(IN_R, pa_in & 0xFFFFFFFF); ip.write(IN_R+4, (pa_in>>32)&0xFFFFFFFF)
    ip.write(OUT_R, pa_out & 0xFFFFFFFF); ip.write(OUT_R+4, (pa_out>>32)&0xFFFFFFFF)
    ip.write(CTL, 0x1)
    for _ in range(10000000):
        if ip.read(CTL) & 0x2: break
    else:
        return None, None
    hw_i = np.array(ob_np).copy()
    return f2fl(hw_i), hw_i

# Stage 1
print('\n--- Stage 1: Sanity ---')
ref1 = d_s1['ref_logits']; hf, hi = kernel(d_s1['X'][0])
rp = int(np.argmax(ref1[0])); hp = int(np.argmax(hf))
print(f'  Ref: [{ref1[0][0]:.6f}, {ref1[0][1]:.6f}] pred={rp}')
print(f'  HW:  [{hf[0]:.6f}, {hf[1]:.6f}] pred={hp} int16=[{hi[0]},{hi[1]}]')
print(f'  OK={rp==hp} finite={np.isfinite(hf).all()}')

# Stage 2
print('\n--- Stage 2: Quick n=200 ---')
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
        print(f'  [{i}] y={y[i]} ref=[{ref[i][0]:.4f},{ref[i][1]:.4f}] hw=[{hf[0]:.4f},{hf[1]:.4f}] m={"OK" if hp==sp else "X"}')
ma = se/(fe*2) if fe else float('nan')
print(f'  n=200 NaN={nan} Inf={inf} match={mc/200:.4f} hw_acc={hc/200:.4f} ref_acc={rc/200:.4f} max_err={me:.6f} mean_err={ma:.6f}')

# Stage 3
print('\n--- Stage 3: Full n=3444 ---')
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
    if not np.isfinite(hf).all():
        if np.isnan(hf).any(): nan += 1
        if np.isinf(hf).any(): inf += 1
    e0, e1 = abs(hf[0]-ref[i][0]), abs(hf[1]-ref[i][1])
    if np.isfinite(e0) and np.isfinite(e1):
        me = max(me, e0, e1); se += e0+e1; fe += 1
    ps_data.append([int(y[i]), float(ref[i][0]), float(ref[i][1]), float(hf[0]), float(hf[1]),
                    sp, hp, int(sp==y[i]), int(hp==y[i]), int(hp==sp), float(max(e0,e1))])
    if (i+1)%500==0: print(f'  [{i+1}/3444] match={mc/(i+1):.4f}')
t1 = time.perf_counter()
total_us = (t1-t0)*1e6; tp = 3444/(t1-t0)
ma = se/(fe*2) if fe else float('nan'); na = 3444
print(f'  n={na} NaN={nan} Inf={inf} match={mc/na:.4f} hw_acc={hc/na:.4f} ref_acc={rc/na:.4f}')
print(f'  max_err={me:.6f} mean_err={ma:.6f} time={(t1-t0):.1f}s tp={tp:.1f} samp/s')

arr = np.array(ps_data); hwp = arr[:,6].astype(int); lbl = arr[:,0].astype(int)
tp_n = int(((lbl==1)&(hwp==1)).sum()); fp_n = int(((lbl==0)&(hwp==1)).sum())
fn_n = int(((lbl==1)&(hwp==0)).sum()); tn_n = int(((lbl==0)&(hwp==0)).sum())
prec = tp_n/(tp_n+fp_n) if (tp_n+fp_n)>0 else 0
rec = tp_n/(tp_n+fn_n) if (tp_n+fn_n)>0 else 0
f1 = 2*prec*rec/(prec+rec) if (prec+rec)>0 else 0
print(f'  TP={tp_n} FP={fp_n} FN={fn_n} TN={tn_n} Prec={prec:.4f} Rec={rec:.4f} F1={f1:.4f}')

# Stage 4
print('\n--- Stage 4: Latency ---')
s0 = f2f(d_full['X'][0]).ravel()
for _ in range(10):
    np.asarray(ib)[:] = s0; ip.write(CTL, 0x1)
    while (ip.read(CTL) & 0x2) == 0: pass
times100 = np.zeros(100)
for i in range(100):
    t0_l = time.perf_counter(); ip.write(CTL, 0x1)
    while (ip.read(CTL) & 0x2) == 0: pass
    t1_l = time.perf_counter(); times100[i] = (t1_l-t0_l)*1e6
times1000 = np.zeros(1000)
for i in range(1000):
    t0_l = time.perf_counter(); ip.write(CTL, 0x1)
    while (ip.read(CTL) & 0x2) == 0: pass
    t1_l = time.perf_counter(); times1000[i] = (t1_l-t0_l)*1e6
print(f'  100runs: mean={times100.mean():.2f}us  1000runs: mean={times1000.mean():.2f}us')

speedup_fast = 810000.0 / times1000.mean()
speedup_rec = 1480000.0 / times1000.mean()

# Save
rows = [
    ('model_id','Ours-Q8-S0-AttnSparse'),('code_name',CODE),
    ('d_model',16),('ff_dim',32),('quant_bits',8),
    ('active_dim',16),('effective_sparsity','0%'),
    ('vivado_lut',14019),('vivado_dsp',124),('vivado_ff',13373),('vivado_bram',15),
    ('hw_label_accuracy',round(hc/na,6)),('ref_label_accuracy',round(rc/na,6)),
    ('precision',round(prec,6)),('recall',round(rec,6)),('f1',round(f1,6)),
    ('prediction_match_rate',round(mc/na,6)),
    ('max_abs_error',round(me,8)),('mean_abs_error',round(ma,8)),
    ('nan_samples',nan),('inf_samples',inf),
    ('latency_us_100runs',round(times100.mean(),4)),
    ('latency_us_1000runs',round(times1000.mean(),4)),
    ('latency_std_1000runs',round(times1000.std(),4)),
    ('total_runtime_us',round(total_us,2)),
    ('throughput_samples_per_sec',round(tp,2)),
    ('speedup_vs_ViT4Mal_fastest_810ms',round(speedup_fast,2)),
    ('speedup_vs_ViT4Mal_recommended_1480ms',round(speedup_rec,2)),
    ('latency_source','PYNQ_Z2_MEASURED'),
    ('pynq_measured',True),('per_sample_verified',True),
    ('notes','Q8 S0. LUT=14019 DSP=124 hw_acc=%.4f F1=%.4f latency=%.2fus.' % (hc/na, f1, times1000.mean())),
]
with open(f'{CODE}_pynq_result.csv','w') as f:
    w=csv.writer(f); w.writerow(['metric','value'])
    for k,v in rows: w.writerow([k,v])
with open(f'{CODE}_per_sample_outputs.csv','w') as f:
    w=csv.writer(f); w.writerow(['label','ref_logit0','ref_logit1','hw_logit0','hw_logit1','ref_pred','hw_pred','correct_ref','correct_hw','match_ref_hw','abs_error'])
    for row in ps_data: w.writerow(row)
np.savez(f'{CODE}_per_sample_outputs.npz',
    labels=arr[:,0].astype(int), ref_logits=arr[:,1:3].astype(np.float32),
    hw_logits=arr[:,3:5].astype(np.float32), ref_pred=arr[:,5].astype(int),
    hw_pred=arr[:,6].astype(int), correct_ref=arr[:,7].astype(int),
    correct_hw=arr[:,8].astype(int), match_ref_hw=arr[:,9].astype(int),
    abs_error=arr[:,10].astype(float))
print(f'\nSaved {CODE}_pynq_result.csv and per_sample files')
print(f'Q8 S0: acc={hc/na:.4f} F1={f1:.4f} latency={times1000.mean():.2f}us speedup={speedup_fast:.1f}x')

