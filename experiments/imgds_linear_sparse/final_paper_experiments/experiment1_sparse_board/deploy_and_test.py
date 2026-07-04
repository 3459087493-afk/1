#!/usr/bin/env python3
"""Universal PYNQ-Z2 deploy + test for Experiment 1 sparse configs."""
import paramiko, time, os, sys
from scp import SCPClient
from pathlib import Path

HOST, USER, PW = "192.168.2.99", "xilinx", "xilinx"
BASE = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board")
PKG  = BASE / "pynq_packages"

TEST_PY_TEMPLATE = r'''
import os, sys, time, csv
import numpy as np
os.environ['XILINX_XRT'] = '/usr'
sys.path.insert(0, '/usr/local/share/pynq-venv/lib/python3.10/site-packages')
from pynq import Overlay, allocate

CODE = "{code}"
FP_SCALE = 1024; IN_R, OUT_R, CTL = 0x10, 0x1C, 0x00
LUT = {lut}; DSP = {dsp}; FF = {ff_v}; BRAM = {bram}

print("="*60)
print("{paper} PYNQ-Z2 FULL TEST (3444 samples)")
print("d=16 ff=32 ACTIVE_DIM={active_dim} sparsity={eff_sparsity}")
print("="*60)

d_full = np.load(f"{{CODE}}_test_3444.npz")
d_200  = np.load(f"{{CODE}}_eval200.npz")
d_s1   = np.load(f"{{CODE}}_sanity.npz")

for name, dd in [("full", d_full), ("eval200", d_200), ("sanity", d_s1)]:
    rp = np.argmax(dd['ref_logits'], axis=1)
    print(f"  Stage0 {{name}}: ref_acc={{(rp==dd['y']).mean():.6f}}")

print("Loading overlay...")
ol = Overlay(f"{{CODE}}.bit")
ip_name = list(ol.ip_dict.keys())[0]
ip = getattr(ol, ip_name)
print(f"IP: {{ip_name}}")

def f2f(x):
    q = np.clip(np.round(x.astype(np.float64)*FP_SCALE), -32768, 32767)
    return q.astype(np.int16)
def f2fl(x):
    return x.astype(np.float32) / np.float32(FP_SCALE)

ib = allocate((1024,), dtype=np.int16)
ob = allocate((2,), dtype=np.int16)
pi = ib.physical_address; po = ob.physical_address

def kernel(xf):
    ib_np = np.asarray(ib); ob_np = np.asarray(ob)
    ib_np[:] = f2f(xf).ravel(); ob_np[:] = 0
    ip.write(IN_R, pi & 0xFFFFFFFF); ip.write(IN_R+4, (pi>>32)&0xFFFFFFFF)
    ip.write(OUT_R, po & 0xFFFFFFFF); ip.write(OUT_R+4, (po>>32)&0xFFFFFFFF)
    ip.write(CTL, 0x1)
    for _ in range(10000000):
        if ip.read(CTL) & 0x2: break
    else: return None, None
    hw_i = np.array(ob_np).copy()
    return f2fl(hw_i), hw_i

# Stage 1: Sanity
print("\n--- Stage 1: Sanity n=1 ---")
ref1 = d_s1['ref_logits']; hf, hi = kernel(d_s1['X'][0])
if hf is None: print("FAILED"); sys.exit(1)
rp = int(np.argmax(ref1[0])); hp = int(np.argmax(hf))
print(f"  Ref: [{{ref1[0][0]:.6f}}, {{ref1[0][1]:.6f}}] pred={{rp}}")
print(f"  HW:  [{{hf[0]:.6f}}, {{hf[1]:.6f}}] pred={{hp}} int16=[{{hi[0]}},{{hi[1]}}]")
print(f"  OK={{rp==hp}} finite={{np.isfinite(hf).all()}}")

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
        print(f"  [{{i}}] y={{y[i]}} ref=[{{ref[i][0]:.4f}},{{ref[i][1]:.4f}}] hw=[{{hf[0]:.4f}},{{hf[1]:.4f}}] m={{'OK' if hp==sp else 'X'}}")
ma = se/(fe*2) if fe else float('nan')
print(f"  n=200 NaN={{nan}} Inf={{inf}} match={{mc/200:.4f}} hw_acc={{hc/200:.4f}} ref_acc={{rc/200:.4f}} max_err={{me:.6f}} mean_err={{ma:.6f}}")

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
    if not np.isfinite(hf).all():
        if np.isnan(hf).any(): nan += 1
        if np.isinf(hf).any(): inf += 1
    e0, e1 = abs(hf[0]-ref[i][0]), abs(hf[1]-ref[i][1])
    if np.isfinite(e0) and np.isfinite(e1):
        me = max(me, e0, e1); se += e0+e1; fe += 1
    ps_data.append([int(y[i]), float(ref[i][0]), float(ref[i][1]), float(hf[0]), float(hf[1]),
                    sp, hp, int(sp==y[i]), int(hp==y[i]), int(hp==sp), float(max(e0,e1))])
    if (i+1)%500==0: print(f"  [{{i+1}}/3444] match={{mc/(i+1):.4f}}")
t1 = time.perf_counter()
total_us = (t1-t0)*1e6; tp = 3444/(t1-t0)
ma = se/(fe*2) if fe else float('nan'); na = 3444
print(f"  n={{na}} NaN={{nan}} Inf={{inf}} match={{mc/na:.4f}} hw_acc={{hc/na:.4f}} ref_acc={{rc/na:.4f}}")
print(f"  max_err={{me:.6f}} mean_err={{ma:.6f}} time={{(t1-t0):.1f}}s tp={{tp:.1f}} samp/s")

arr = np.array(ps_data); hwp = arr[:,6].astype(int); lbl = arr[:,0].astype(int)
tp_n = int(((lbl==1)&(hwp==1)).sum()); fp_n = int(((lbl==0)&(hwp==1)).sum())
fn_n = int(((lbl==1)&(hwp==0)).sum()); tn_n = int(((lbl==0)&(hwp==0)).sum())
prec = tp_n/(tp_n+fp_n) if (tp_n+fp_n)>0 else 0
rec = tp_n/(tp_n+fn_n) if (tp_n+fn_n)>0 else 0
f1 = 2*prec*rec/(prec+rec) if (prec+rec)>0 else 0
print(f"  TP={{tp_n}} FP={{fp_n}} FN={{fn_n}} TN={{tn_n}} Prec={{prec:.4f}} Rec={{rec:.4f}} F1={{f1:.4f}}")

# Stage 4: Latency
print("\n--- Stage 4: Latency ---")
s0 = f2f(d_full['X'][0]).ravel()
for _ in range(10):
    np.asarray(ib)[:] = s0; ip.write(CTL, 0x1)
    while (ip.read(CTL) & 0x2) == 0: pass
t100 = np.zeros(100)
for i in range(100):
    t0_l = time.perf_counter(); ip.write(CTL, 0x1)
    while (ip.read(CTL) & 0x2) == 0: pass
    t1_l = time.perf_counter(); t100[i] = (t1_l-t0_l)*1e6
t1000 = np.zeros(1000)
for i in range(1000):
    t0_l = time.perf_counter(); ip.write(CTL, 0x1)
    while (ip.read(CTL) & 0x2) == 0: pass
    t1_l = time.perf_counter(); t1000[i] = (t1_l-t0_l)*1e6
print(f"  100: mean={{t100.mean():.2f}}us  1000: mean={{t1000.mean():.2f}}us")

speedup_fast = 810000.0 / t1000.mean()
speedup_rec = 1480000.0 / t1000.mean()

# Save
rows = [
    ('model_id','{paper}'),('code_name',CODE),
    ('d_model',16),('ff_dim',32),('quant_bits',{qbits}),
    ('active_dim',{active_dim}),('effective_sparsity','{eff_sparsity}'),
    ('vivado_lut',LUT),('vivado_dsp',DSP),('vivado_ff',FF),('vivado_bram',BRAM),
    ('hw_label_accuracy',round(hc/na,6)),('ref_label_accuracy',round(rc/na,6)),
    ('precision',round(prec,6)),('recall',round(rec,6)),('f1',round(f1,6)),
    ('prediction_match_rate',round(mc/na,6)),
    ('max_abs_error',round(me,8)),('mean_abs_error',round(ma,8)),
    ('nan_samples',nan),('inf_samples',inf),
    ('latency_us_100runs',round(t100.mean(),4)),
    ('latency_us_1000runs',round(t1000.mean(),4)),
    ('latency_std_1000runs',round(t1000.std(),4)),
    ('total_runtime_us',round(total_us,2)),
    ('throughput_samples_per_sec',round(tp,2)),
    ('speedup_vs_ViT4Mal_fastest_810ms',round(speedup_fast,2)),
    ('speedup_vs_ViT4Mal_recommended_1480ms',round(speedup_rec,2)),
    ('latency_source','PYNQ_Z2_MEASURED'),
    ('pynq_measured',True),('per_sample_verified',True),
    ('notes','{paper}. LUT='+str(LUT)+' DSP='+str(DSP)+' hw_acc='+str(round(hc/na,4))+' F1='+str(round(f1,4))+' latency='+str(round(t1000.mean(),2))+'us.'),
]
with open(f'{{CODE}}_pynq_result.csv','w') as f:
    w=csv.writer(f); w.writerow(['metric','value'])
    for k,v in rows: w.writerow([k,v])
with open(f'{{CODE}}_per_sample_outputs.csv','w') as f:
    w=csv.writer(f); w.writerow(['label','ref_logit0','ref_logit1','hw_logit0','hw_logit1','ref_pred','hw_pred','correct_ref','correct_hw','match_ref_hw','abs_error'])
    for row in ps_data: w.writerow(row)
np.savez(f'{{CODE}}_per_sample_outputs.npz',
    labels=arr[:,0].astype(int), ref_logits=arr[:,1:3].astype(np.float32),
    hw_logits=arr[:,3:5].astype(np.float32), ref_pred=arr[:,5].astype(int),
    hw_pred=arr[:,6].astype(int), correct_ref=arr[:,7].astype(int),
    correct_hw=arr[:,8].astype(int), match_ref_hw=arr[:,9].astype(int),
    abs_error=arr[:,10].astype(float))
print(f"\nSaved {{CODE}}_pynq_result.csv and per_sample files")
print(f"{{'='*60}}")
print(f"{{CODE}} COMPLETE: acc={{hc/na:.4f}} F1={{f1:.4f}} latency={{t1000.mean():.2f}}us speedup={{speedup_fast:.1f}}x")
print(f"{{'='*60}}")
'''

WRAPPER = '''#!/bin/bash
source /opt/xilinx/xrt/setup.sh 2>/dev/null
export XILINX_XRT=/usr
cd {remote_dir}
/usr/local/share/pynq-venv/bin/python3 run_test.py 2>&1 | tee {code}_pynq_log.txt
'''

CONFIGS = [
    {"code":"q16_s0_attn_sparse","paper":"Ours-Q16-S0-AttnSparse","active_dim":16,"eff_sparsity":"0%","qbits":16,"lut":14004,"dsp":156,"ff_v":12903,"bram":15},
    {"code":"q16_s10_attn_sparse","paper":"Ours-Q16-S10-AttnSparse","active_dim":14,"eff_sparsity":"12.5%","qbits":16,"lut":"TBD","dsp":"TBD","ff_v":"TBD","bram":"TBD"},
    {"code":"q16_s20_attn_sparse","paper":"Ours-Q16-S20-AttnSparse","active_dim":13,"eff_sparsity":"18.75%","qbits":16,"lut":"TBD","dsp":"TBD","ff_v":"TBD","bram":"TBD"},
    {"code":"q16_s30_attn_sparse","paper":"Ours-Q16-S30-AttnSparse","active_dim":11,"eff_sparsity":"31.25%","qbits":16,"lut":"TBD","dsp":"TBD","ff_v":"TBD","bram":"TBD"},
    {"code":"q8_s0_attn_sparse","paper":"Ours-Q8-S0-AttnSparse","active_dim":16,"eff_sparsity":"0%","qbits":8,"lut":14019,"dsp":124,"ff_v":13373,"bram":15},
    {"code":"q8_s30_attn_sparse","paper":"Ours-Q8-S30-AttnSparse","active_dim":11,"eff_sparsity":"31.25%","qbits":8,"lut":"TBD","dsp":"TBD","ff_v":"TBD","bram":"TBD"},
]

def deploy_and_test(code):
    """Deploy one config to PYNQ-Z2 and run full test."""
    cfg = next(c for c in CONFIGS if c["code"] == code)
    remote_dir = f"/home/xilinx/imgds_{code}"

    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(HOST, username=USER, password=PW, timeout=10)

    # Check if bit exists in local package
    local_pkg = PKG / code
    bit = local_pkg / f"{code}.bit"
    if not bit.exists():
        print(f"  ❌ {code}: bit not found in {local_pkg}")
        ssh.close()
        return False

    # Create remote dir and upload
    ssh.exec_command(f"mkdir -p {remote_dir}", timeout=5)
    time.sleep(0.3)

    print(f"  Uploading {code}...")
    with SCPClient(ssh.get_transport()) as scp:
        for fname in os.listdir(local_pkg):
            fpath = local_pkg / fname
            if fpath.is_file() and not fname.endswith('.py'):
                scp.put(str(fpath), f"{remote_dir}/{fname}")

    # Write test script
    test_py = TEST_PY_TEMPLATE.format(
        code=code, paper=cfg["paper"], active_dim=cfg["active_dim"],
        eff_sparsity=cfg["eff_sparsity"], qbits=cfg["qbits"],
        lut=cfg["lut"], dsp=cfg["dsp"], ff_v=cfg["ff_v"], bram=cfg["bram"]
    )
    ssh.exec_command(f"cat > {remote_dir}/run_test.py << 'SCRIPTEOF'\n{test_py}\nSCRIPTEOF", timeout=5)

    # Write wrapper and run
    wrapper = WRAPPER.format(remote_dir=remote_dir, code=code)
    ssh.exec_command(f"cat > {remote_dir}/run_test.sh << 'HEREDOC'\n{wrapper}\nHEREDOC", timeout=5)
    ssh.exec_command(f"chmod +x {remote_dir}/run_test.sh", timeout=5)
    time.sleep(0.5)

    print(f"  Running {code}...")
    stdin, stdout, stderr = ssh.exec_command(
        f"echo xilinx | sudo -S bash {remote_dir}/run_test.sh 2>&1", timeout=600)

    channel = stdout.channel
    while True:
        if channel.recv_ready():
            data = channel.recv(8192).decode(errors='replace')
            print(data, end="", flush=True)
        if channel.exit_status_ready() and not channel.recv_ready():
            break
        time.sleep(0.05)
    try:
        r = stdout.read().decode(errors='replace')
        if r: print(r)
    except: pass

    # SCP results back
    with SCPClient(ssh.get_transport()) as scp:
        for f in [f"{code}_pynq_result.csv", f"{code}_pynq_log.txt",
                  f"{code}_per_sample_outputs.csv", f"{code}_per_sample_outputs.npz"]:
            try:
                scp.get(f"{remote_dir}/{f}", str(local_pkg / f))
                print(f"  ✓ {f}")
            except: pass

    ssh.close()
    print(f"  ✅ {code} complete\n")
    return True

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: deploy_and_test.py <code> [code2 ...]")
        print(f"  Available: {[c['code'] for c in CONFIGS]}")
        sys.exit(1)

    for code in sys.argv[1:]:
        deploy_and_test(code)
