# run_hls.tcl — Q16-QKSv2-D11  QKS-v2 (ATTN_DIM=11)
set script_dir [file dirname [file normalize [info script]]]

open_project -reset q16_qksv2_d11
set_top q16_qksv2_d11
add_files "$script_dir/src/q16_qksv2_d11.cpp" -cflags "-I$script_dir/src"
add_files "$script_dir/src/q16_qksv2_d11.h"
add_files "$script_dir/src/qks_v2_params_q16_qksv2_d11.h"
open_solution -reset solution1 -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default

# Step 1: C Simulation
csim_design

# Step 2: C Synthesis
csynth_design

# Step 3: Export IP (AXI)
export_design -format ip_catalog -version 1.0
exit
