-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17_LAYERS_0bBo is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17_LAYERS_0bBo is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110001110100010111011010011", 1 => "00111110001111001110011001100010", 2 => "10111110110100100010111011000100", 3 => "00111110011000100000100100000101", 
    4 => "10111110000100000101011000001010", 5 => "10111101101000011110101101100011", 6 => "10111110010010001111000110101110", 7 => "00111101101110100011010000110011", 
    8 => "00111100111000110000110001000100", 9 => "00111110101011011010000011110100", 10 => "00111110000110101001010101011101", 11 => "00111110010111111100001010011101", 
    12 => "10111110100101001001111110111111", 13 => "10111110010011100010001110010111", 14 => "10111101101101000110101111011000", 15 => "10111101000010011110111110000010");



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

