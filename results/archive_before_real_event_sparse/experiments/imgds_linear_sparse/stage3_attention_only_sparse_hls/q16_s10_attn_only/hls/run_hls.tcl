# run_hls.tcl — q16_s10_attn_only — Attention-only Q/K sparse
# CSIM + CSYNTH only. NO export. NO Vivado. NO PYNQ.
open_project q16_s10_attn_only
set_top imgds_linear_dense_q16
add_files src/imgds_linear_dense_q16.cpp
add_files src/imgds_linear_dense_q16.h
add_files src/hls_params_q16.h
add_files src/eval_samples_q16.h
add_files src/active_channels.h
add_files src/testbench.cpp -tb
open_solution solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
csim_design
csynth_design
exit
