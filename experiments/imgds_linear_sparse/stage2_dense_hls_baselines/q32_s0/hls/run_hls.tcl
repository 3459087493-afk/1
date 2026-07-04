# run_hls.tcl — Q32-S0 (float) HLS reference
open_project imgds_linear_dense_q32
set_top    imgds_linear_dense_q32
add_files  src/imgds_linear_dense_q32.cpp
add_files  src/imgds_linear_dense_q32.h
add_files  src/hls_params_float.h
add_files  src/eval_samples_float.h
add_files  src/testbench.cpp -tb
open_solution solution1 -flow_target vivado
set_part   {xc7z020clg400-1}
create_clock -period 10 -name default

# CSIM
csim_design

# CSYNTH (uncomment to run)
# csynth_design

exit
