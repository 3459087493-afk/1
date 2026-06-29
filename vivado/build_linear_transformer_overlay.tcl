set origin_dir [file normalize [file dirname [info script]]]
set repo_dir [file normalize [file join $origin_dir ..]]
set project_dir [file join $origin_dir linear_transformer_overlay]
set ip_repo_dir [file join $repo_dir vitis_hls linear_transformer linear_transformer_hls solution1 impl ip]
set board_repo_dir /home/cym/prj2/finn/deps/board_files
set design_name linear_transformer_design

set_param board.repoPaths [list $board_repo_dir]

create_project linear_transformer_overlay $project_dir -part xc7z020clg400-1 -force
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property ip_repo_paths [list $ip_repo_dir] [current_project]
update_ip_catalog

create_bd_design $design_name

create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable"} \
    [get_bd_cells processing_system7_0]

set_property -dict [list \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_USE_S_AXI_HP0 {1} \
    CONFIG.PCW_IRQ_F2P_INTR {0} \
] [get_bd_cells processing_system7_0]

create_bd_cell -type ip -vlnv xilinx.com:hls:transformer:1.0 linear_transformer_0

apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config {Master "/processing_system7_0/M_AXI_GP0" Slave "/linear_transformer_0/s_axi_control" Clk_master "/processing_system7_0/FCLK_CLK0 (100 MHz)" Clk_slave "/processing_system7_0/FCLK_CLK0 (100 MHz)" Clk_xbar "/processing_system7_0/FCLK_CLK0 (100 MHz)" intc_ip "New AXI Interconnect" master_apm "0"} \
    [get_bd_intf_pins linear_transformer_0/s_axi_control]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_interconnect
set_property -dict [list CONFIG.NUM_MI {1} CONFIG.NUM_SI {2}] [get_bd_cells axi_mem_interconnect]

connect_bd_intf_net [get_bd_intf_pins linear_transformer_0/m_axi_gmem0] [get_bd_intf_pins axi_mem_interconnect/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins linear_transformer_0/m_axi_gmem1] [get_bd_intf_pins axi_mem_interconnect/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
    [get_bd_pins axi_mem_interconnect/ACLK] \
    [get_bd_pins axi_mem_interconnect/S00_ACLK] \
    [get_bd_pins axi_mem_interconnect/S01_ACLK] \
    [get_bd_pins axi_mem_interconnect/M00_ACLK] \
    [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]
connect_bd_net [get_bd_pins rst_ps7_0_100M/peripheral_aresetn] \
    [get_bd_pins axi_mem_interconnect/ARESETN] \
    [get_bd_pins axi_mem_interconnect/S00_ARESETN] \
    [get_bd_pins axi_mem_interconnect/S01_ARESETN] \
    [get_bd_pins axi_mem_interconnect/M00_ARESETN]

assign_bd_address
validate_bd_design
save_bd_design

set bd_file [get_files ${design_name}.bd]
make_wrapper -files $bd_file -top
add_files -norecurse [file join $project_dir linear_transformer_overlay.gen sources_1 bd $design_name hdl ${design_name}_wrapper.v]
update_compile_order -fileset sources_1

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

set impl_status [get_property STATUS [get_runs impl_1]]
puts "IMPL_STATUS=$impl_status"
if {![string match "*Complete*" $impl_status]} {
    error "Implementation did not complete: $impl_status"
}

set export_dir [file join $origin_dir linear_overlay_export]
file mkdir $export_dir
set bit_file [file join $project_dir linear_transformer_overlay.runs impl_1 ${design_name}_wrapper.bit]
set hwh_file [file join $project_dir linear_transformer_overlay.gen sources_1 bd $design_name hw_handoff ${design_name}.hwh]
file copy -force $bit_file [file join $export_dir linear_transformer.bit]
file copy -force $hwh_file [file join $export_dir linear_transformer.hwh]

puts "OVERLAY_BIT=[file join $export_dir linear_transformer.bit]"
puts "OVERLAY_HWH=[file join $export_dir linear_transformer.hwh]"
