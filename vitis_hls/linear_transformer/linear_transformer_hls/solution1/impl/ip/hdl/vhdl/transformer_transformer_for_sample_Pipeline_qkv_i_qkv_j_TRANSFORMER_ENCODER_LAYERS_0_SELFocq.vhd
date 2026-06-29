-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity transformer_transformer_for_sample_Pipeline_qkv_i_qkv_j_TRANSFORMER_ENCODER_LAYERS_0_SELFocq is 
    generic(
             DataWidth     : integer := 32; 
             AddressWidth     : integer := 3; 
             AddressRange    : integer := 8
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of transformer_transformer_for_sample_Pipeline_qkv_i_qkv_j_TRANSFORMER_ENCODER_LAYERS_0_SELFocq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111111110011110111111100111001", 1 => "10111111100000101111111100000000", 2 => "11000001000001110111101011110101", 3 => "11000000011010101000110001110110", 
    4 => "10111110110100001001010000011101", 5 => "01000000101101001110000011111000", 6 => "11000000000001001001001111110011", 7 => "00111111110101101101111010111001");



begin 

 
memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
 
        if (ce0 = '1') then  
            q0 <= mem0(CONV_INTEGER(address0_tmp)); 
        end if;

end if;
end process;

end rtl;

