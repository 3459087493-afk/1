
import os, sys, time, mmap, struct, ctypes
import numpy as np

S_AXI = 0x40000000
CTL, IN_R, OUT_R = 0x00, 0x10, 0x1C
FP_SCALE = 1024

fd = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)
mem = mmap.mmap(fd, 0x10000, offset=S_AXI)
os.close(fd)
print("mmap OK")

def rd(off): return struct.unpack('<I', mem[off:off+4])[0]
def wr(off, v): mem[off:off+4] = struct.pack('<I', v & 0xFFFFFFFF)

def f2f(x):
    q = np.clip(np.round(x.astype(np.float64)*FP_SCALE), -32768, 32767)
    return q.astype(np.int16)

def f2fl(x):
    return x.astype(np.float32) / np.float32(FP_SCALE)

# Allocate buffers
ib = np.zeros(1024, dtype=np.int16)
ob = np.zeros(2, dtype=np.int16)
pi = ib.ctypes.data
po = ob.ctypes.data

# Get phys addrs via pagemap (we run with sudo)
ps = os.sysconf('SC_PAGE_SIZE')
def phys(a):
    vpn = int(a) // ps
    with open('/proc/self/pagemap', 'rb') as f:
        f.seek(vpn * 8)
        e = struct.unpack('<Q', f.read(8))[0]
    if not (e & (1<<63)): return None
    return ((e & ((1<<55)-1)) * ps) + (int(a) % ps)

pi_p = phys(pi); po_p = phys(po)
print("IN  phys=0x%x" % (pi_p or 0))
print("OUT phys=0x%x" % (po_p or 0))

if not pi_p or not po_p:
    print("Phys addr FAILED")
    sys.exit(1)

def kernel(xf):
    ib[:] = f2f(xf).ravel()
    ob[:] = 0
    wr(IN_R, pi_p & 0xFFFFFFFF); wr(IN_R+4, (pi_p>>32)&0xFFFFFFFF)
    wr(OUT_R, po_p & 0xFFFFFFFF); wr(OUT_R+4, (po_p>>32)&0xFFFFFFFF)
    wr(CTL, 0x1)
    for _ in range(1000000):
        if rd(CTL) & 0x2: break
    else:
        print("TIMEOUT"); return None, None
    hw = ob.copy()
    return f2fl(hw), hw

d = np.load("q16_s0_attn_sparse_sanity.npz")
hf, hi = kernel(d['X'][0])
if hf is not None:
    rp = int(np.argmax(d['ref_logits'][0]))
    hp = int(np.argmax(hf[0]))
    print("Ref: [%.6f, %.6f] pred=%d" % (d['ref_logits'][0][0], d['ref_logits'][0][1], rp))
    print("HW:  [%.6f, %.6f] pred=%d int16=[%d,%d]" % (hf[0][0], hf[0][1], hp, hi[0], hi[1]))
    print("Match: %s" % ("OK" if rp==hp else "FAIL"))
    print("Finite: %s" % np.isfinite(hf).all())

