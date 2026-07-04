#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/tools/Xilinx/Vitis/2022.2/bin:/tools/Xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2022.2/bin
else
  PATH=/tools/Xilinx/Vitis/2022.2/bin:/tools/Xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2022.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board/hls_projects/q16_s20_attn_sparse/vivado/q16_s20_attn_sparse_vivado_prj/q16_s20_attn_sparse_vivado_prj.runs/imgds_linear_dense_q16_q16_s20_attn_sparse_design_auto_us_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log imgds_linear_dense_q16_q16_s20_attn_sparse_design_auto_us_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source imgds_linear_dense_q16_q16_s20_attn_sparse_design_auto_us_0.tcl
