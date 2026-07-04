import os, sys
os.environ['XILINX_XRT'] = '/usr'
os.environ['LD_LIBRARY_PATH'] = '/usr/lib'
sys.path.insert(0, '/usr/local/share/pynq-venv/lib/python3.10/site-packages')

try:
    from pynq import Overlay, allocate
    print("PYNQ imports OK")
    ol = Overlay("q16_s0_attn_sparse.bit")
    print("Overlay loaded! ip_dict:", ol.ip_dict)
    import numpy as np
    ib = allocate((1024,), dtype=np.int16)
    print("allocate OK: pa=0x%x shape=%s" % (ib.physical_address, ib.shape))
except Exception as e:
    print("ERROR:", e)
    import traceback
    traceback.print_exc()

