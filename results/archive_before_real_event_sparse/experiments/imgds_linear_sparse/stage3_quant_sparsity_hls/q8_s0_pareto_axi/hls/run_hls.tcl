# run_hls.tcl — Q8-S0 dense, PARETO2 DSP-shared
# CSIM + CSYNTH only. NO export. NO Vivado.
open_project imgds_linear_dense_q8
set_top imgds_linear_dense_q8
add_files src/imgds_linear_dense_q8.cpp
add_files src/imgds_linear_dense_q8.h
add_files src/hls_params_q8.h
add_files src/eval_samples_q8.h
add_files src/testbench.cpp -tb
open_solution solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
csim_design
csynth_design
exit
