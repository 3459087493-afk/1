// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module q16_qksv3_s20_attention_v2_pruned_Pipeline_VITIS_LOOP_75_2_VITIS_LOOP_77_3_layers_0_attentibkb (
    address0, ce0, q0, 
    reset, clk);

parameter DataWidth = 10;
parameter AddressWidth = 8;
parameter AddressRange = 256;
 
input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;

input reset;
input clk;

 
reg [DataWidth-1:0] rom0[0:AddressRange-1];


initial begin
     
    $readmemh("./q16_qksv3_s20_attention_v2_pruned_Pipeline_VITIS_LOOP_75_2_VITIS_LOOP_77_3_layers_0_attentibkb.dat", rom0);
end

  
always @(posedge clk) 
begin 
    if (ce0) 
    begin
        q0 <= rom0[address0];
    end
end


endmodule

