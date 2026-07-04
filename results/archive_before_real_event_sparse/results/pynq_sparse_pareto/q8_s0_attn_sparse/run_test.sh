#!/bin/bash
source /opt/xilinx/xrt/setup.sh 2>/dev/null
export XILINX_XRT=/usr
cd /home/xilinx/imgds_q8_s0_attn_sparse
/usr/local/share/pynq-venv/bin/python3 run_test.py 2>&1 | tee q8_s0_attn_sparse_pynq_log.txt

