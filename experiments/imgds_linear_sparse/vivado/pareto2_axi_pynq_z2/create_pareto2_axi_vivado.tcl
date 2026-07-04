# create_pareto2_axi_vivado.tcl
# ====================================
# Generate .bit and .hwh for PARETO2-AXI Linear Transformer on PYNQ-Z2.
#
# HLS IP: imgds_linear_dense_q16 (m_axi + s_axilite interfaces)
# Part:   xc7z020clg400-1 (PYNQ-Z2)
# Board:  tul.com.tw:pynq-z2:part0:1.0
#
# Based on the proven build_linear_transformer_overlay.tcl pattern.
set origin_dir [file normalize [file dirname [info script]]]
set repo_dir    [file normalize [file join $origin_dir ../.. ]]
set project_dir [file join $origin_dir pareto2_axi_pynq_z2_prj]
set ip_repo_dir [file join $repo_dir stage2_dense_hls_baselines q16_s0_pareto2_axi hls imgds_linear_dense_q16_pareto2_axi solution1 impl ip]
set board_repo  /home/cym/prj2/finn/deps/board_files
set design_name imgds_linear_dense_q16_pareto2_design

puts "============================================"
puts "PARETO2 AXI Vivado Build"
puts "============================================"
puts "Origin dir : $origin_dir"
puts "Project dir: $project_dir"
puts "IP repo    : $ip_repo_dir"
puts "Board repo : $board_repo"
puts "Design name: $design_name"
puts "============================================"

# ---- Board files ----
set_param board.repoPaths [list $board_repo]

# ---- Create project ----
create_project pareto2_axi_pynq_z2_prj $project_dir -part xc7z020clg400-1 -force
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property ip_repo_paths [list $ip_repo_dir] [current_project]
update_ip_catalog

# ---- Block Design ----
create_bd_design $design_name

# ============================================================
# ZYNQ7 Processing System
# ============================================================
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0

# Apply board preset (FIXED_IO + DDR from PYNQ-Z2 board definition)
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable"} \
    [get_bd_cells processing_system7_0]

# Enable GP0 for control, HP0 for m_axi data (both gmem0+gmem1 share HP0 via AXI Interconnect)
set_property -dict [list \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_USE_S_AXI_HP0 {1} \
] [get_bd_cells processing_system7_0]

# ============================================================
# HLS IP: imgds_linear_dense_q16 (PARETO2 AXI)
# ============================================================
create_bd_cell -type ip -vlnv xilinx.com:hls:imgds_linear_dense_q16:1.0 imgds_linear_dense_q16_0

# ============================================================
# s_axi_control → M_AXI_GP0 (use automation for AXI-Lite + clock + reset)
# ============================================================
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config { \
        Master "/processing_system7_0/M_AXI_GP0" \
        Slave  "/imgds_linear_dense_q16_0/s_axi_control" \
        Clk_master "/processing_system7_0/FCLK_CLK0 (100 MHz)" \
        Clk_slave  "/processing_system7_0/FCLK_CLK0 (100 MHz)" \
        Clk_xbar   "/processing_system7_0/FCLK_CLK0 (100 MHz)" \
        intc_ip "New AXI Interconnect" \
        master_apm "0" \
    } \
    [get_bd_intf_pins imgds_linear_dense_q16_0/s_axi_control]

# ============================================================
# m_axi_gmem0 + m_axi_gmem1 → S_AXI_HP0 via AXI Interconnect (2 slaves → 1 master)
# ============================================================
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_interconnect
set_property -dict [list CONFIG.NUM_MI {1} CONFIG.NUM_SI {2}] [get_bd_cells axi_mem_interconnect]

connect_bd_intf_net [get_bd_intf_pins imgds_linear_dense_q16_0/m_axi_gmem0] [get_bd_intf_pins axi_mem_interconnect/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins imgds_linear_dense_q16_0/m_axi_gmem1] [get_bd_intf_pins axi_mem_interconnect/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/M00_AXI]    [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

# ---- Clock for memory interconnect ----
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
    [get_bd_pins axi_mem_interconnect/ACLK] \
    [get_bd_pins axi_mem_interconnect/S00_ACLK] \
    [get_bd_pins axi_mem_interconnect/S01_ACLK] \
    [get_bd_pins axi_mem_interconnect/M00_ACLK] \
    [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]

# ---- Reset for memory interconnect ----
connect_bd_net [get_bd_pins rst_ps7_0_100M/peripheral_aresetn] \
    [get_bd_pins axi_mem_interconnect/ARESETN] \
    [get_bd_pins axi_mem_interconnect/S00_ARESETN] \
    [get_bd_pins axi_mem_interconnect/S01_ARESETN] \
    [get_bd_pins axi_mem_interconnect/M00_ARESETN]

# ============================================================
# Interrupt: leave unconnected. PYNQ driver polls s_axi_control
# for ap_done bit instead of using interrupts.
# ============================================================
# NOTE: imgds_linear_dense_q16_0/interrupt is left floating.
# This is safe — the PYNQ test script polls the control register.

# ============================================================
# Address assignment
# ============================================================
assign_bd_address
validate_bd_design
save_bd_design

puts "Block diagram created and validated."

# ============================================================
# Generate targets + HDL wrapper
# ============================================================
set bd_file [get_files ${design_name}.bd]
make_wrapper -files $bd_file -top
add_files -norecurse [file join $project_dir pareto2_axi_pynq_z2_prj.gen sources_1 bd $design_name hdl ${design_name}_wrapper.v]
update_compile_order -fileset sources_1

puts "HDL wrapper generated. Starting synthesis..."

# ============================================================
# Launch synthesis → implementation → bitstream
# ============================================================
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

set impl_status [get_property STATUS [get_runs impl_1]]
puts "IMPL_STATUS=$impl_status"
if {![string match "*Complete*" $impl_status]} {
    error "Implementation did not complete successfully: $impl_status"
}

puts "Implementation complete. Exporting bitstream and HWH..."

# ============================================================
# Copy .bit and .hwh
# ============================================================
set bit_file [file join $project_dir pareto2_axi_pynq_z2_prj.runs impl_1 ${design_name}_wrapper.bit]
set hwh_file [file join $project_dir pareto2_axi_pynq_z2_prj.gen sources_1 bd $design_name hw_handoff ${design_name}.hwh]

puts "BIT_SRC=$bit_file"
puts "HWH_SRC=$hwh_file"

# Check files exist
if {![file exists $bit_file]} {
    error "Bitstream NOT found: $bit_file"
}
if {![file exists $hwh_file]} {
    error "HWH NOT found: $hwh_file"
}

puts "BIT and HWH files exist."

# ---- Copy to PYNQ test package ----
set pynq_pkg [file join $repo_dir final_paper_experiments pynq_package PARETO2_PYNQ_Z2_TEST_PACKAGE]
file copy -force $bit_file [file join $pynq_pkg pareto2.bit]
file copy -force $hwh_file [file join $pynq_pkg pareto2.hwh]

puts "OVERLAY_BIT=[file join $pynq_pkg pareto2.bit]"
puts "OVERLAY_HWH=[file join $pynq_pkg pareto2.hwh]"

# ============================================================
# Generate summary
# ============================================================
set summary_file [file join $origin_dir vivado_pareto2_axi_summary.md]
set summary_fh  [open $summary_file w]

puts $summary_fh "# Vivado PARETO2 AXI Build Summary"
puts $summary_fh ""
puts $summary_fh "**Date:** [clock format [clock seconds]]"
puts $summary_fh "**Part:** xc7z020clg400-1"
puts $summary_fh "**Board:** tul.com.tw:pynq-z2:part0:1.0"
puts $summary_fh "**HLS IP:** xilinx.com:hls:imgds_linear_dense_q16:1.0"
puts $summary_fh ""

puts $summary_fh "## Build Status"
puts $summary_fh ""
puts $summary_fh "- **Implementation:** $impl_status"
puts $summary_fh "- **Bitstream:** [file size $bit_file] bytes"
puts $summary_fh "- **HWH:** [file size $hwh_file] bytes"

# ---- Utilization ----
set util_file [file join $project_dir pareto2_axi_pynq_z2_prj.runs impl_1 ${design_name}_wrapper_utilization_placed.rpt]
if {[file exists $util_file]} {
    set util_fh [open $util_file r]
    set util_text [read $util_fh]
    close $util_fh
    puts $summary_fh ""
    puts $summary_fh "## Resource Utilization"
    puts $summary_fh ""
    puts $summary_fh "```"
    # Extract the slice logic / memory / DSP table
    set in_table 0
    foreach line [split $util_text "\n"] {
        if {[string match "*Slice Logic*" $line] || [string match "*| Ref Name*" $line]} {
            set in_table 1
        }
        if {$in_table} {
            if {[string length $line] < 3} { set in_table 0 }
            puts $summary_fh $line
        }
    }
    puts $summary_fh "```"
}

# ---- Timing ----
set timing_file [file join $project_dir pareto2_axi_pynq_z2_prj.runs impl_1 ${design_name}_wrapper_timing_summary_routed.rpt]
if {[file exists $timing_file]} {
    set timing_fh [open $timing_file r]
    set timing_text [read $timing_fh]
    close $timing_fh
    puts $summary_fh ""
    puts $summary_fh "## Timing Summary"
    puts $summary_fh ""
    set wns "N/A"
    set freq "N/A"
    foreach line [split $timing_text "\n"] {
        if {[regexp {WNS.*:\s*([-\d.]+)\s*ns} $line -> val]} { set wns $val }
        if {[regexp {WHS.*:\s*([-\d.]+)\s*ns} $line -> val]} { set whs $val }
        if {[regexp {Max Delay Paths.*clock\s+(\S+)} $line -> clk]} {}
    }
    puts $summary_fh "- **WNS:** $wns ns"
    if {[info exists whs]} { puts $summary_fh "- **WHS:** $whs ns" }
    if {$wns != "N/A"} {
        if {[string index $wns 0] == "-"} {
            puts $summary_fh "- **Timing:** FAIL (negative WNS)"
        } else {
            puts $summary_fh "- **Timing:** PASS"
        }
    }
}

# ---- HWH IP check ----
puts $summary_fh ""
puts $summary_fh "## HWH Interface Verification"
puts $summary_fh ""
set hwh_fh [open $hwh_file r]
set hwh_text [read $hwh_fh]
close $hwh_fh
if {[string match "*imgds_linear_dense_q16*" $hwh_text]} {
    puts $summary_fh "- **imgds_linear_dense_q16 IP found in HWH:** YES"
} else {
    puts $summary_fh "- **imgds_linear_dense_q16 IP found in HWH:** NO ⚠️"
}
if {[string match "*s_axi_control*" $hwh_text]} {
    puts $summary_fh "- **s_axi_control found:** YES"
}
if {[string match "*m_axi_gmem0*" $hwh_text]} {
    puts $summary_fh "- **m_axi_gmem0 found:** YES"
}
if {[string match "*m_axi_gmem1*" $hwh_text]} {
    puts $summary_fh "- **m_axi_gmem1 found:** YES"
}

puts $summary_fh ""
puts $summary_fh "## Files"
puts $summary_fh ""
puts $summary_fh "| File | Path |"
puts $summary_fh "|------|------|"
puts $summary_fh "| pareto2.bit | [file join $pynq_pkg pareto2.bit] |"
puts $summary_fh "| pareto2.hwh | [file join $pynq_pkg pareto2.hwh] |"

puts $summary_fh ""
puts $summary_fh "## IP Instance Name"
puts $summary_fh ""
puts $summary_fh "The top-level HLS IP instance in the block design is:"
puts $summary_fh ""
puts $summary_fh "```"
puts $summary_fh "imgds_linear_dense_q16_0  (VLNV: xilinx.com:hls:imgds_linear_dense_q16:1.0)"
puts $summary_fh "```"
puts $summary_fh ""
puts $summary_fh "## AXI Register Map"
puts $summary_fh ""
puts $summary_fh "The s_axi_control register map is auto-generated by Vitis HLS."
puts $summary_fh "Refer to the driver files in the HLS IP directory:"
puts $summary_fh ""
puts $summary_fh "```"
puts $summary_fh "[file join $ip_repo_dir drivers]"
puts $summary_fh "```"
puts $summary_fh ""
puts $summary_fh "Key registers (typical HLS AXI-Lite layout):"
puts $summary_fh ""
puts $summary_fh "| Offset | Name | Description |"
puts $summary_fh "|--------|------|-------------|"
puts $summary_fh "| 0x00 | Control | ap_start, ap_done, ap_idle, ap_ready (bit 0=start, bit 1=done, bit 2=idle, bit 3=ready) |"
puts $summary_fh "| 0x10 | input (base addr) | Base address of input buffer in DDR (m_axi_gmem0) |"
puts $summary_fh "| 0x1C | logits (base addr) | Base address of output logits buffer in DDR (m_axi_gmem1) |"

puts $summary_fh ""
puts $summary_fh "## PYNQ-Z2 Resource Check"
puts $summary_fh ""
puts $summary_fh "| Resource | HLS Estimate | Vivado Actual | PYNQ-Z2 Limit | Fit? |"
puts $summary_fh "|----------|-------------|---------------|---------------|------|"
puts $summary_fh "| BRAM | 13 | TBD | 280 | TBD |"
puts $summary_fh "| DSP | 156 | TBD | 220 | TBD |"
puts $summary_fh "| FF | 11,458 | TBD | 106,400 | TBD |"
puts $summary_fh "| LUT | 25,402 | TBD | 53,200 | TBD |"

puts $summary_fh ""
puts $summary_fh "## ⚠️ Critical Notes"
puts $summary_fh ""
puts $summary_fh "1. **PYNQ measured latency is still PENDING_BOARD.** The bitstream and HWH are ready for on-board testing."
puts $summary_fh "2. **HLS estimated latency (756.27 μs @100MHz) is NOT PYNQ measured latency.**"
puts $summary_fh "3. **Speedup vs ViT4Mal must be computed as: `810000 / measured_total_runtime_us` after PYNQ-Z2 measurement.**"
puts $summary_fh "4. **Do not claim final speedup before running `run_pareto2_pynq_test.py` on actual PYNQ-Z2 hardware.**"
puts $summary_fh ""
puts $summary_fh "## Next Steps"
puts $summary_fh ""
puts $summary_fh "1. Copy the PYNQ test package to PYNQ-Z2:"
puts $summary_fh "   ```bash"
puts $summary_fh "   scp -r [file join $pynq_pkg .] xilinx@192.168.2.99:/home/xilinx/"
puts $summary_fh "   ```"
puts $summary_fh "2. SSH into PYNQ-Z2 and run:"
puts $summary_fh "   ```bash"
puts $summary_fh "   ssh xilinx@192.168.2.99"
puts $summary_fh "   cd /home/xilinx/PARETO2_PYNQ_Z2_TEST_PACKAGE"
puts $summary_fh "   sudo python3 run_pareto2_pynq_test.py"
puts $summary_fh "   ```"
puts $summary_fh "3. Copy results back and update Tables 3 and 4 with measured values."

close $summary_fh

puts "Summary written to: $summary_file"
puts ""
puts "============================================"
puts "PARETO2 AXI Vivado Build COMPLETE"
puts "============================================"
puts "Bit   : [file join $pynq_pkg pareto2.bit]"
puts "HWH   : [file join $pynq_pkg pareto2.hwh]"
puts "Log   : [file join $origin_dir vivado_pareto2_axi_build.log]"
puts "Report: $summary_file"
puts ""
puts "⚠️  PYNQ measured latency = PENDING_BOARD"
puts "⚠️  Do NOT claim speedup before PYNQ-Z2 measurement."
puts "============================================"
