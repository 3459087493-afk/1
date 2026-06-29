create_project prj -part xc7z020-clg400-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "/home/cym/prj2/finn/notebooks/icl_thesis-master/vitis_hls/linear_transformer/linear_transformer_hls/solution1/syn/verilog/transformer_fexp_32ns_32ns_32_10_full_dsp_1_ip.tcl"
source "/home/cym/prj2/finn/notebooks/icl_thesis-master/vitis_hls/linear_transformer/linear_transformer_hls/solution1/syn/verilog/transformer_fmul_32ns_32ns_32_4_max_dsp_1_ip.tcl"
source "/home/cym/prj2/finn/notebooks/icl_thesis-master/vitis_hls/linear_transformer/linear_transformer_hls/solution1/syn/verilog/transformer_fdiv_32ns_32ns_32_16_no_dsp_1_ip.tcl"
source "/home/cym/prj2/finn/notebooks/icl_thesis-master/vitis_hls/linear_transformer/linear_transformer_hls/solution1/syn/verilog/transformer_fcmp_32ns_32ns_1_2_no_dsp_1_ip.tcl"
source "/home/cym/prj2/finn/notebooks/icl_thesis-master/vitis_hls/linear_transformer/linear_transformer_hls/solution1/syn/verilog/transformer_fadd_32ns_32ns_32_5_full_dsp_1_ip.tcl"
