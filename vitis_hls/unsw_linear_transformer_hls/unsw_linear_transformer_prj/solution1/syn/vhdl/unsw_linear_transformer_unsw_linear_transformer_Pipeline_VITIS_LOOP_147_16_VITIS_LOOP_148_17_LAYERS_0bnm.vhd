-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17_LAYERS_0bnm is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17_LAYERS_0bnm is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101000000000111001011110101", 1 => "10111100100110111001111000110010", 2 => "10111101100111011111010110101011", 3 => "10111011000101110011111011010011", 
    4 => "00111100010101000001111101111111", 5 => "00111011110100001011001001100001", 6 => "00111100010100001110111110111110", 7 => "10111011101011011010011111100011", 
    8 => "10111100000000111111001001011100", 9 => "00111100100010010010000101011001", 10 => "00111101011100000000111100011100", 11 => "00111011111101111110011011101010", 
    12 => "10111101000000011100110010101000", 13 => "10111100110100001001101101001101", 14 => "10111011101011000101001101010000", 15 => "10111011000001111011111101111111");



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

