# Vivado TCL for q16_qksv2_d13 — QKS-v2 ATTN_DIM=13
set script_dir [file dirname [file normalize [info script]]]
set project_dir [file join $script_dir q16_qksv2_d13_vivado]
set board_repo  /home/cym/prj2/finn/deps/board_files
set design_name q16_qksv2_d13_design

puts "============================================"
puts "q16_qksv2_d13 Vivado Build — ATTN_DIM=13"
puts "============================================"
puts "IP repo : /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/final_paper_experiments/experiment1_qks_v2_physical_prune/hls_projects/q16_qksv2_d13/q16_qksv2_d13_csynth/solution1/impl/ip"
puts "Board   : /home/cym/prj2/finn/deps/board_files"

set_param board.repoPaths [list $board_repo]
create_project q16_qksv2_d13_vivado $project_dir -part xc7z020clg400-1 -force
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property ip_repo_paths [list /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/final_paper_experiments/experiment1_qks_v2_physical_prune/hls_projects/q16_qksv2_d13/q16_qksv2_d13_csynth/solution1/impl/ip] [current_project]
update_ip_catalog

create_bd_design $design_name

# ZYNQ7 PS
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable"} \
    [get_bd_cells processing_system7_0]
set_property -dict [list \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_USE_S_AXI_HP0 {1} \
] [get_bd_cells processing_system7_0]

# HLS IP
create_bd_cell -type ip -vlnv xilinx.com:hls:q16_qksv2_d13:1.0 q16_qksv2_d13_0

# s_axi_control → M_AXI_GP0
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config { \
        Master "/processing_system7_0/M_AXI_GP0" \
        Slave  "/q16_qksv2_d13_0/s_axi_control" \
        Clk_master "/processing_system7_0/FCLK_CLK0 (100 MHz)" \
        Clk_slave  "/processing_system7_0/FCLK_CLK0 (100 MHz)" \
        Clk_xbar   "/processing_system7_0/FCLK_CLK0 (100 MHz)" \
        intc_ip "New AXI Interconnect" \
        master_apm "0" \
    } \
    [get_bd_intf_pins q16_qksv2_d13_0/s_axi_control]

# m_axi_gmem0 + gmem1 → S_AXI_HP0 via AXI Interconnect
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_interconnect
set_property -dict [list CONFIG.NUM_MI {1} CONFIG.NUM_SI {2}] [get_bd_cells axi_mem_interconnect]

connect_bd_intf_net [get_bd_intf_pins q16_qksv2_d13_0/m_axi_gmem0] [get_bd_intf_pins axi_mem_interconnect/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins q16_qksv2_d13_0/m_axi_gmem1] [get_bd_intf_pins axi_mem_interconnect/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

# Clock for memory interconnect
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins axi_mem_interconnect/ACLK] [get_bd_pins axi_mem_interconnect/S00_ACLK] [get_bd_pins axi_mem_interconnect/S01_ACLK] [get_bd_pins axi_mem_interconnect/M00_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]

# Reset for memory interconnect
connect_bd_net [get_bd_pins rst_ps7_0_100M/peripheral_aresetn] [get_bd_pins axi_mem_interconnect/ARESETN] [get_bd_pins axi_mem_interconnect/S00_ARESETN] [get_bd_pins axi_mem_interconnect/S01_ARESETN] [get_bd_pins axi_mem_interconnect/M00_ARESETN]

assign_bd_address
validate_bd_design
save_bd_design

puts "Block diagram created and validated."

# Generate HDL wrapper
set bd_file [get_files ${design_name}.bd]
make_wrapper -files $bd_file -top
add_files -norecurse [file join $project_dir q16_qksv2_d13_vivado.gen sources_1 bd $design_name hdl ${design_name}_wrapper.v]
update_compile_order -fileset sources_1

puts "HDL wrapper generated. Starting synthesis → implementation → bitstream..."

# Launch full flow
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

set impl_status [get_property STATUS [get_runs impl_1]]
puts "IMPL_STATUS=$impl_status"
if {![string match "*Complete*" $impl_status]} {
    error "Implementation did not complete successfully: $impl_status"
}

puts "Implementation complete. Copying .bit and .hwh..."

set bit_file [file join $project_dir q16_qksv2_d13_vivado.runs impl_1 ${design_name}_wrapper.bit]
set hwh_file [file join $project_dir q16_qksv2_d13_vivado.gen sources_1 bd $design_name hw_handoff ${design_name}.hwh]

if {![file exists $bit_file]} { error "Bitstream NOT found: $bit_file" }
if {![file exists $hwh_file]} { error "HWH NOT found: $hwh_file" }

file copy -force $bit_file [file join $script_dir q16_qksv2_d13.bit]
file copy -force $hwh_file [file join $script_dir q16_qksv2_d13.hwh]

puts "BIT: [file join $script_dir q16_qksv2_d13.bit]"
puts "HWH: [file join $script_dir q16_qksv2_d13.hwh]"

puts "============================================"
puts "q16_qksv2_d13 Vivado build COMPLETE"
puts "============================================"

close_project
exit
