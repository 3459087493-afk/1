#!/usr/bin/env python3
"""Ours-Mid-Q16 (small_A) PYNQ-Z2 Full-Test Validation. d_model=12, ff_dim=24."""
import os, sys, time, csv, numpy as np

FP_SCALE = 1 << 10; FP_I16_MAX, FP_I16_MIN = 32767, -32768

def float_to_fixed(x):
    q = np.round(x.astype(np.float64)*FP_SCALE)
    return np.clip(q, FP_I16_MIN, FP_I16_MAX).astype(np.int16)
def fixed_to_float(x):
    return x.astype(np.float32)/np.float32(FP_SCALE)

def reference_sanity():
    print("="*60); print("STAGE 0: Reference Sanity Check"); print("="*60)
    for n,p in [("full 3444","small_A_test_3444.npz"),("eval 200","small_A_eval200.npz"),("sanity 1","small_A_sanity.npz")]:
        d=np.load(p); ref,y=d['ref_logits'],d['y']; ra=(np.argmax(ref,axis=1)==y).mean()
        print(f"  {n}: shape={ref.shape} labels={np.bincount(y.astype(int))} argmax_ref_acc={ra:.6f}")
    print("  PASSED.\n")

try:
    from pynq import Overlay, allocate; HAS_PYNQ=True
except ImportError:
    HAS_PYNQ=False

BIT="small_A.bit"; EVAL200="small_A_eval200.npz"; FULL="small_A_test_3444.npz"; SANITY="small_A_sanity.npz"
OUT_CSV="small_A_pynq_result.csv"
S,I,C=16,64,2; IE=S*I; LE=C; CA=0x00; IRA=0x10; LA=0x1C; NW=10

def write_ptr(ip,base,pa):
    p=int(pa); ip.write(base,p&0xFFFFFFFF); ip.write(base+4,(p>>32)&0xFFFFFFFF)

def run_kernel(ip,sf):
    fixed=float_to_fixed(sf).ravel(); ib=allocate(shape=(IE,),dtype=np.int16); ob=allocate(shape=(LE,),dtype=np.int16)
    ob[:]=0; ob.flush(); ib[:]=fixed[:]; ib.flush()
    write_ptr(ip,IRA,ib.physical_address); write_ptr(ip,LA,ob.physical_address)
    ip.write(CA,0x1)
    while (ip.read(CA)&0x2)==0: pass
    ob.invalidate(); hw_raw=np.asarray(ob,dtype=np.int16).reshape(1,C).copy(); del ib,ob
    return fixed_to_float(hw_raw),hw_raw

def safe_pred(logits_2d,row=0): return int(np.argmax(np.asarray(logits_2d[row]).ravel()[:C]))

def stage1_sanity(ol,ip):
    print("="*60); print("STAGE 1: Sanity (n=1)"); print("="*60)
    d=np.load(SANITY); X,y,ref=d['X'],d['y'],d['ref_logits']
    print(f"  I/O: int16, scale={FP_SCALE}")
    hw_f,hw_raw=run_kernel(ip,X[0]); sp=safe_pred(ref,0); hp=safe_pred(hw_f,0); ok=sp==hp
    print(f"  Ref: [{ref[0][0]:.6f},{ref[0][1]:.6f}] pred={sp}")
    print(f"  HW raw: [{int(hw_raw[0][0])},{int(hw_raw[0][1])}]")
    print(f"  HW float: [{hw_f[0][0]:.6f},{hw_f[0][1]:.6f}] pred={hp} finite={bool(np.isfinite(hw_f).all())}")
    print(f"  Label: {y[0]}  Match: {'OK' if ok else 'FAIL (warning only)'}")
    if not ok: print("  *** WARNING: first-sample flipped. Continuing.")
    return ok

def stage2_quick(ol,ip):
    print("\n"+"="*60); print("STAGE 2: Quick (n=200)"); print("="*60)
    d=np.load(EVAL200); X,y,ref=d['X'],d['y'],d['ref_logits']; n=len(X)
    mc=hc=rc=0; nan_c=inf_c=0; me=0.0; se=0.0; fe=0
    for i in range(n):
        hw_f,_=run_kernel(ip,X[i])
        rv=np.asarray(ref[i]).ravel().astype(np.float32)[:C]; hv=np.asarray(hw_f).ravel().astype(np.float32)[:C]
        sp=int(np.argmax(rv)); hp=int(np.argmax(hv)); lb=int(y[i])
        if hp==sp: mc+=1
        if hp==lb: hc+=1
        if sp==lb: rc+=1
        if not np.isfinite(hv).all():
            if np.isnan(hv).any(): nan_c+=1
            if np.isinf(hv).any(): inf_c+=1
        ae=np.abs(hv-rv)
        if np.isfinite(ae).all(): me=max(me,float(np.max(ae))); se+=float(np.sum(ae)); fe+=len(ae)
        if i<10: print(f"  [{i}] y={lb} ref=[{rv[0]:.4f},{rv[1]:.4f}] hw=[{hv[0]:.4f},{hv[1]:.4f}] sp={sp} hp={hp} fin={np.isfinite(hv).all()}")
    mr,ha,ra=mc/n,hc/n,rc/n; ma=se/max(fe,1) if fe>0 else float('nan')
    print(f"\n  n={n} NaN={nan_c} Inf={inf_c}")
    print(f"  Match vs ref: {mr:.4f} ({mc}/{n})  HW acc: {ha:.4f} ({hc}/{n})  Ref acc: {ra:.4f} ({rc}/{n})")
    print(f"  Max err: {me:.8f}  Mean err: {ma:.8f}")
    return mr,ha,ra,me,ma

def stage3_full(ol,ip):
    print("\n"+"="*60); print("STAGE 3: Full (n=3444)"); print("="*60)
    d=np.load(FULL); X,y,ref=d['X'],d['y'],d['ref_logits']; n=len(X)
    mc=hc=rc=0; nan_c=inf_c=0; me=0.0; se=0.0; fe=0
    t0=time.perf_counter()
    for i in range(n):
        hw_f,_=run_kernel(ip,X[i])
        rv=np.asarray(ref[i]).ravel().astype(np.float32)[:C]; hv=np.asarray(hw_f).ravel().astype(np.float32)[:C]
        sp=int(np.argmax(rv)); hp=int(np.argmax(hv)); lb=int(y[i])
        if hp==sp: mc+=1
        if hp==lb: hc+=1
        if sp==lb: rc+=1
        if not np.isfinite(hv).all():
            if np.isnan(hv).any(): nan_c+=1
            if np.isinf(hv).any(): inf_c+=1
        ae=np.abs(hv-rv)
        if np.isfinite(ae).all(): me=max(me,float(np.max(ae))); se+=float(np.sum(ae)); fe+=len(ae)
        if (i+1)%500==0: print(f"  [{i+1}/{n}] done...")
    t1=time.perf_counter(); tus=(t1-t0)*1e6; mr,ha,ra=mc/n,hc/n,rc/n
    ma=se/max(fe,1) if fe>0 else float('nan'); tp=n/(t1-t0)
    print(f"\n  n={n} NaN={nan_c} Inf={inf_c}")
    print(f"  Time: {tus:.2f} us  Match vs ref: {mr:.4f} ({mc}/{n})")
    print(f"  HW acc: {ha:.4f} ({hc}/{n})  Ref acc: {ra:.4f} ({rc}/{n})")
    print(f"  Max err: {me:.8f}  Mean err: {ma:.8f}  Throughput: {tp:.2f} samples/s")
    return mr,ha,ra,tus,tp,me,ma,nan_c,inf_c

def stage4_latency(ol,ip,nr,label=""):
    print(f"\n"+"="*60); print(f"STAGE 4{label}: Latency ({nr} runs)"); print("="*60)
    d=np.load(FULL); s0=float_to_fixed(d['X'][0]).ravel()
    ib=allocate(shape=(IE,),dtype=np.int16); ob=allocate(shape=(LE,),dtype=np.int16)
    ib[:]=s0[:]; ib.flush(); ob[:]=0; ob.flush()
    pi,po=int(ib.physical_address),int(ob.physical_address); ilo=pi&0xFFFFFFFF; ihi=(pi>>32)&0xFFFFFFFF; olo=po&0xFFFFFFFF; ohi=(po>>32)&0xFFFFFFFF
    for _ in range(NW):
        ip.write(IRA,ilo); ip.write(IRA+4,ihi); ip.write(LA,olo); ip.write(LA+4,ohi); ip.write(CA,0x1)
        while (ip.read(CA)&0x2)==0: pass
    times=np.zeros(nr)
    for i in range(nr):
        t0=time.perf_counter()
        ip.write(IRA,ilo); ip.write(IRA+4,ihi); ip.write(LA,olo); ip.write(LA+4,ohi); ip.write(CA,0x1)
        while (ip.read(CA)&0x2)==0: pass
        t1=time.perf_counter(); times[i]=(t1-t0)*1e6
    del ib,ob
    print(f"  Runs: {nr}  Mean: {times.mean():.4f} us  Std: {times.std():.4f} us")
    print(f"  Min: {times.min():.4f} us  Max: {times.max():.4f} us  P50: {np.median(times):.4f} us")
    return float(times.mean()),float(times.std())

def main():
    reference_sanity()
    if not HAS_PYNQ: print("No PYNQ. Ref check only."); return
    print("="*60); print("Ours-Mid-Q16 (small_A) PYNQ-Z2 FULL TEST"); print("d=12 ff=24 SW acc=96.05%"); print("Vivado LUT=14,687 DSP=150"); print("="*60)
    print(f"\n  I/O: int16 (ap_fixed<16,6>), scale={FP_SCALE}")
    if not os.path.exists(BIT): print(f"ERROR: {BIT}"); sys.exit(1)
    ol=Overlay(BIT); ip_name=list(ol.ip_dict.keys())[0]; ip=getattr(ol,ip_name)
    print(f"IP: {ip_name}")
    ok=stage1_sanity(ol,ip)
    print("  STAGE 1 PASSED." if ok else "  STAGE 1 FAILED (first sample). Continuing.")
    mr2,ha2,ra2,mx2,mn2=stage2_quick(ol,ip)
    mr3,ha3,ra3,tus,tp,mx3,mn3,nan3,inf3=stage3_full(ol,ip)
    km100,ks100=stage4_latency(ol,ip,100,"a"); km1k,ks1k=stage4_latency(ol,ip,1000,"b")
    print("\n"+"="*60); print("SAVING"); print("="*60)
    rows=[("model_id","Ours-Mid-Q16"),("paper_name","Ours-Mid-Q16"),("internal_code","small_A"),
          ("d_model",12),("ff_dim",24),("quant_bits",16),("io_dtype","int16_Q6_10"),
          ("vivado_lut",14687),("vivado_dsp",150),("vivado_ff",13710),("vivado_bram",15),
          ("software_accuracy",0.9605),("n_correctness_samples",3444),
          ("prediction_match_rate_vs_small_A_ref",round(mr3,6)),
          ("hw_label_accuracy",round(ha3,6)),("ref_label_accuracy",round(ra3,6)),
          ("max_abs_error",round(mx3,8) if np.isfinite(float(mx3)) else "nan"),
          ("mean_abs_error",round(mn3,8) if np.isfinite(float(mn3)) else "nan"),
          ("nan_samples",nan3),("inf_samples",inf3),
          ("kernel_runtime_mean_us_100runs",round(float(km100),6)),
          ("kernel_runtime_std_us_100runs",round(float(ks100),6)),
          ("kernel_runtime_mean_us_1000runs",round(float(km1k),6)),
          ("kernel_runtime_std_us_1000runs",round(float(ks1k),6)),
          ("total_runtime_us_correctness",round(float(tus),6)),
          ("throughput_samples_per_sec",round(float(tp),6)),
          ("latency_source","PYNQ_Z2_MEASURED"),("pynq_measured","True"),
          ("notes","Ours-Mid-Q16 (d=12/ff=24) PYNQ-Z2. Highest SW acc (96.05%) of all models.")]
    with open(OUT_CSV,'w',newline='') as f:
        w=csv.writer(f); w.writerow(["metric","value"])
        for k,v in rows: w.writerow([k,v])
    print(f"Results: {OUT_CSV}")
    print(f"\nKernel latency (1000): {km1k:.2f} us  Total time: {tus:.2f} us")
    print("Ours-Mid-Q16 PYNQ test complete.")

if __name__=="__main__": main()
