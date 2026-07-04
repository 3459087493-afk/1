#!/usr/bin/env python3
"""Ours-Tiny-Q16 PYNQ-Z2 Full-Test Validation. d_model=6, ff_dim=12."""
import os, sys, time, csv, numpy as np

FP_SCALE=1<<10; FP_I16_MAX,FP_I16_MIN=32767,-32768
def float_to_fixed(x):
    q=np.round(x.astype(np.float64)*FP_SCALE)
    return np.clip(q,FP_I16_MIN,FP_I16_MAX).astype(np.int16)
def fixed_to_float(x): return x.astype(np.float32)/np.float32(FP_SCALE)

def ref_check():
    print("="*60); print("STAGE 0: Reference Sanity"); print("="*60)
    for n,p in [("full","tiny_test_3444.npz"),("eval200","tiny_eval200.npz"),("sanity","tiny_sanity.npz")]:
        d=np.load(p); r,y=d['ref_logits'],d['y']; ra=(np.argmax(r,axis=1)==y).mean()
        print(f"  {n}: shape={r.shape} labels={np.bincount(y.astype(int))} acc={ra:.6f}")
    print("  PASSED.\n")

try:
    from pynq import Overlay, allocate; HAS_PYNQ=True
except ImportError: HAS_PYNQ=False

BIT="tiny.bit"; EVAL200="tiny_eval200.npz"; FULL="tiny_test_3444.npz"; SANITY="tiny_sanity.npz"
OUT_CSV="tiny_pynq_result.csv"; S,I,C=16,64,2; IE=S*I; LE=C
CA=0x00; IRA=0x10; LA=0x1C; NW=10

def write_ptr(ip,b,pa):
    p=int(pa); ip.write(b,p&0xFFFFFFFF); ip.write(b+4,(p>>32)&0xFFFFFFFF)

def run_kernel(ip,sf):
    f=float_to_fixed(sf).ravel()
    ib=allocate(shape=(IE,),dtype=np.int16); ob=allocate(shape=(LE,),dtype=np.int16)
    ob[:]=0; ob.flush(); ib[:]=f[:]; ib.flush()
    write_ptr(ip,IRA,ib.physical_address); write_ptr(ip,LA,ob.physical_address)
    ip.write(CA,0x1)
    while (ip.read(CA)&0x2)==0: pass
    ob.invalidate(); hr=np.asarray(ob,dtype=np.int16).reshape(1,C).copy(); del ib,ob
    return fixed_to_float(hr),hr

def spred(logits_2d,row=0): return int(np.argmax(np.asarray(logits_2d[row]).ravel()[:C]))

def s1(ol,ip):
    print("="*60); print("STAGE 1: Sanity (n=1)"); print("="*60)
    d=np.load(SANITY); X,y,ref=d['X'],d['y'],d['ref_logits']
    hwf,hwr=run_kernel(ip,X[0]); sp=spred(ref,0); hp=spred(hwf,0); ok=sp==hp
    print(f"  Ref: [{ref[0][0]:.6f},{ref[0][1]:.6f}] pred={sp}")
    print(f"  HW raw: [{int(hwr[0][0])},{int(hwr[0][1])}]")
    print(f"  HW: [{hwf[0][0]:.6f},{hwf[0][1]:.6f}] pred={hp} fin={bool(np.isfinite(hwf).all())}")
    print(f"  Label:{y[0]} Match:{'OK' if ok else 'FAIL(warning)'}")
    if not ok: print("  *** WARNING: first-sample flipped. Continuing.")
    return ok

def s2(ol,ip):
    print("\n"+"="*60); print("STAGE 2: Quick (n=200)"); print("="*60)
    d=np.load(EVAL200); X,y,ref=d['X'],d['y'],d['ref_logits']; n=len(X)
    mc=hc=rc=0; na=0; inf=0; me=0.0; se=0.0; fe=0
    for i in range(n):
        hwf,_=run_kernel(ip,X[i])
        rv=np.asarray(ref[i]).ravel().astype(np.float32)[:C]
        hv=np.asarray(hwf).ravel().astype(np.float32)[:C]
        sp=int(np.argmax(rv)); hp=int(np.argmax(hv)); lb=int(y[i])
        if hp==sp: mc+=1
        if hp==lb: hc+=1
        if sp==lb: rc+=1
        if not np.isfinite(hv).all():
            if np.isnan(hv).any(): na+=1
            if np.isinf(hv).any(): inf+=1
        ae=np.abs(hv-rv)
        if np.isfinite(ae).all(): me=max(me,float(np.max(ae))); se+=float(np.sum(ae)); fe+=len(ae)
        if i<10: print(f"  [{i}] y={lb} ref=[{rv[0]:.4f},{rv[1]:.4f}] hw=[{hv[0]:.4f},{hv[1]:.4f}] sp={sp} hp={hp} fin={np.isfinite(hv).all()}")
    mr,ha,ra=mc/n,hc/n,rc/n; ma=se/max(fe,1) if fe>0 else float('nan')
    print(f"\n  n={n} NaN={na} Inf={inf}")
    print(f"  Match:{mr:.4f}({mc}/{n}) HW acc:{ha:.4f}({hc}/{n}) Ref acc:{ra:.4f}({rc}/{n})")
    print(f"  Max err:{me:.8f} Mean err:{ma:.8f}")
    return mr,ha,ra,me,ma

def s3(ol,ip):
    print("\n"+"="*60); print("STAGE 3: Full (n=3444)"); print("="*60)
    d=np.load(FULL); X,y,ref=d['X'],d['y'],d['ref_logits']; n=len(X)
    mc=hc=rc=0; na=0; inf=0; me=0.0; se=0.0; fe=0; t0=time.perf_counter()
    for i in range(n):
        hwf,_=run_kernel(ip,X[i])
        rv=np.asarray(ref[i]).ravel().astype(np.float32)[:C]
        hv=np.asarray(hwf).ravel().astype(np.float32)[:C]
        sp=int(np.argmax(rv)); hp=int(np.argmax(hv)); lb=int(y[i])
        if hp==sp: mc+=1
        if hp==lb: hc+=1
        if sp==lb: rc+=1
        if not np.isfinite(hv).all():
            if np.isnan(hv).any(): na+=1
            if np.isinf(hv).any(): inf+=1
        ae=np.abs(hv-rv)
        if np.isfinite(ae).all(): me=max(me,float(np.max(ae))); se+=float(np.sum(ae)); fe+=len(ae)
        if (i+1)%500==0: print(f"  [{i+1}/{n}] done...")
    t1=time.perf_counter(); tus=(t1-t0)*1e6; mr,ha,ra=mc/n,hc/n,rc/n
    ma=se/max(fe,1) if fe>0 else float('nan'); tp=n/(t1-t0)
    print(f"\n  n={n} NaN={na} Inf={inf}")
    print(f"  Time:{tus:.2f}us Match:{mr:.4f}({mc}/{n})")
    print(f"  HW acc:{ha:.4f}({hc}/{n}) Ref acc:{ra:.4f}({rc}/{n})")
    print(f"  Max err:{me:.8f} Mean err:{ma:.8f} Throughput:{tp:.2f}samp/s")
    return mr,ha,ra,tus,tp,me,ma,na,inf

def s4(ol,ip,nr,label=""):
    print(f"\n"+"="*60); print(f"STAGE 4{label}: Latency ({nr} runs)"); print("="*60)
    d=np.load(FULL); s0=float_to_fixed(d['X'][0]).ravel()
    ib=allocate(shape=(IE,),dtype=np.int16); ob=allocate(shape=(LE,),dtype=np.int16)
    ib[:]=s0[:]; ib.flush(); ob[:]=0; ob.flush()
    pi,po=int(ib.physical_address),int(ob.physical_address)
    ilo=pi&0xFFFFFFFF; ihi=(pi>>32)&0xFFFFFFFF; olo=po&0xFFFFFFFF; ohi=(po>>32)&0xFFFFFFFF
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
    print(f"  Runs:{nr} Mean:{times.mean():.4f}us Std:{times.std():.4f}us")
    print(f"  Min:{times.min():.4f}us Max:{times.max():.4f}us P50:{np.median(times):.4f}us")
    return float(times.mean()),float(times.std())

def main():
    ref_check()
    if not HAS_PYNQ: print("No PYNQ. Ref ok."); return
    print("="*60); print("Ours-Tiny-Q16 PYNQ-Z2"); print("d=6 ff=12 SW acc=95.53%"); print("Vivado LUT=14001 DSP=104"); print("="*60)
    if not os.path.exists(BIT): print(f"ERR:{BIT}"); sys.exit(1)
    ol=Overlay(BIT); ip=getattr(ol,list(ol.ip_dict.keys())[0])
    print(f"IP:{list(ol.ip_dict.keys())[0]}")
    ok=s1(ol,ip); print("  S1 PASSED" if ok else "  S1 FAILED(first sample).Continuing.")
    mr2,ha2,ra2,mx2,mn2=s2(ol,ip)
    mr3,ha3,ra3,tus,tp,mx3,mn3,na3,inf3=s3(ol,ip)
    km100,ks100=s4(ol,ip,100,"a"); km1k,ks1k=s4(ol,ip,1000,"b")
    print("\n"+"="*60); print("SAVING"); print("="*60)
    rows=[("model_id","Ours-Tiny-Q16"),("paper_name","Ours-Tiny-Q16"),("internal_code","tiny"),
          ("d_model",6),("ff_dim",12),("quant_bits",16),("io_dtype","int16_Q6_10"),
          ("vivado_lut",14001),("vivado_dsp",104),("vivado_ff",12936),("vivado_bram",11),
          ("software_accuracy",0.9553),("n_correctness_samples",3444),
          ("prediction_match_rate_vs_tiny_ref",round(mr3,6)),
          ("hw_label_accuracy",round(ha3,6)),("ref_label_accuracy",round(ra3,6)),
          ("max_abs_error",round(mx3,8) if np.isfinite(float(mx3)) else "nan"),
          ("mean_abs_error",round(mn3,8) if np.isfinite(float(mn3)) else "nan"),
          ("nan_samples",na3),("inf_samples",inf3),
          ("kernel_runtime_mean_us_100runs",round(float(km100),6)),
          ("kernel_runtime_std_us_100runs",round(float(ks100),6)),
          ("kernel_runtime_mean_us_1000runs",round(float(km1k),6)),
          ("kernel_runtime_std_us_1000runs",round(float(ks1k),6)),
          ("total_runtime_us_correctness",round(float(tus),6)),
          ("throughput_samples_per_sec",round(float(tp),6)),
          ("latency_source","PYNQ_Z2_MEASURED"),("pynq_measured","True"),
          ("notes","Ours-Tiny-Q16 (d=6/ff=12) PYNQ-Z2. Extreme compression: 848 params. SW acc 95.53%.")]
    with open(OUT_CSV,'w',newline='') as f:
        w=csv.writer(f); w.writerow(["metric","value"])
        for k,v in rows: w.writerow([k,v])
    print(f"Saved:{OUT_CSV}")
    print(f"\nKernel latency(1000):{km1k:.2f}us Total time:{tus:.2f}us")
    print("Ours-Tiny-Q16 done.")

if __name__=="__main__": main()
