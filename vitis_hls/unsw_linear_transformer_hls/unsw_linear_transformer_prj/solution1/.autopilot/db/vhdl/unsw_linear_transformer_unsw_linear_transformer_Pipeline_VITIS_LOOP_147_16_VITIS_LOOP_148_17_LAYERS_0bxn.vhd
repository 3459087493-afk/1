-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17_LAYERS_0bxn is 
    generic(
             DataWidth     : integer := 32; 
             AddressWidth     : integer := 4; 
             AddressRange    : integer := 16
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17_LAYERS_0bxn is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110100000000000000000011011", 1 => "10111101110010111011001010011101", 2 => "00111101000110000110100110100100", 3 => "10111100010001110111010101101110", 
    4 => "10111110011110111100000011111010", 5 => "10111110000101010010000100100000", 6 => "00111110000101011111010010011001", 7 => "10111110011101011010010000101011", 
    8 => "00111110001010000101010010110001", 9 => "10111110101011010010011010010000", 10 => "10111101110011010010111111011010", 11 => "10111110110110001100101000101101", 
    12 => "00111110010000100001010001001010", 13 => "00111110101000111111100101011001", 14 => "00111110001001000000110110100101", 15 => "00111101111011110101001100101111");



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

