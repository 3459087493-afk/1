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

HD_PWD='/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models/vivado/small_A_q16_d12_ff24/small_a_vivado_prj/small_a_vivado_prj.runs/impl_1'
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

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log imgds_linear_small_a_design_wrapper.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source imgds_linear_small_a_design_wrapper.tcl -notrace


