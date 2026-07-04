# run_hls_axi_export.tcl
# Q16-S0-PARETO2-AXI — PYNQ-friendly AXI interfaces
# m_axi for data ports, s_axilite for control, export as IP catalog
open_project imgds_linear_dense_q16_pareto2_axi
set_top imgds_linear_dense_q16
add_files src/imgds_linear_dense_q16.cpp
add_files src/imgds_linear_dense_q16.h
add_files src/hls_params_q16.h
add_files src/eval_samples_q16.h
add_files src/testbench.cpp -tb
open_solution solution1 -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
csim_design
csynth_design
export_design -format ip_catalog -rtl verilog
exit
