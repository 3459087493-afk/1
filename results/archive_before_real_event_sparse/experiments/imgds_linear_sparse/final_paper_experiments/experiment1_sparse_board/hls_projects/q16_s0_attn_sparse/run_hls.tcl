# run_hls.tcl — Q16-S0 AttnSparse — Dense baseline (ACTIVE_DIM=16) with AXI export
open_project q16_s0_attn_sparse
set_top imgds_linear_dense_q16
add_files src/imgds_linear_dense_q16.cpp
add_files src/imgds_linear_dense_q16.h
add_files src/hls_params_q16.h
add_files src/active_channels.h
add_files src/testbench.cpp -tb
open_solution solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
csim_design
csynth_design
export_design -format ip_catalog -version 1.0
exit
