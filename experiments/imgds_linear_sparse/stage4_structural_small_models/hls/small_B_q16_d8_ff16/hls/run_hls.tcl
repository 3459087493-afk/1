# run_hls.tcl — small_B HLS CSIM+CSYNTH
open_project imgds_linear_small_b
set_top imgds_linear_small_b
add_files src/imgds_linear_small_b.cpp
add_files src/imgds_linear_small_b.h
add_files src/hls_params_small_b.h
add_files src/eval_samples_small_b.h
add_files src/testbench.cpp -tb
open_solution solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
csim_design
csynth_design
exit
