# run_hls.tcl — Q4-S10 HLS: CSIM + CSYNTH only
open_project imgds_linear_dense_q4
set_top imgds_linear_dense_q4
add_files src/imgds_linear_dense_q4.cpp
add_files src/imgds_linear_dense_q4.h
add_files src/hls_params_q4.h
add_files src/eval_samples_q4.h
add_files src/active_channels.h
add_files src/testbench.cpp -tb
open_solution solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
csim_design
csynth_design
exit
