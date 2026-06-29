-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bMq is 
    generic(
             DataWidth     : integer := 32; 
             AddressWidth     : integer := 5; 
             AddressRange    : integer := 32
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bMq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111111000101100110110101100010", 1 => "10111101011110010111011010101100", 2 => "10111110000000110100010001001001", 3 => "10111110000010000000111101000001", 
    4 => "10111110000001000111111001101110", 5 => "00111101000011000100010111010011", 6 => "10111110000111000111111000010101", 7 => "00111100100010000011111011100000", 
    8 => "00111110010000100010111100001110", 9 => "10111110110111010011001001101000", 10 => "10111101100011010001110101010010", 11 => "10111100101100000101110010101101", 
    12 => "10111100100001100101101011010011", 13 => "00111110011000111100000101001001", 14 => "10111110000111010110101001011010", 15 => "10111110001010111100110000011010", 
    16 => "10111110010111011001101110100001", 17 => "00111001110101110001010010001111", 18 => "00111100010101010101001100111011", 19 => "10111110010011010111110111000001", 
    20 => "00111110010000010011010001010011", 21 => "10111110000000100100011001011011", 22 => "00111101011001001011001111011111", 23 => "10111110110100011001111011011110", 
    24 => "10111101000000101001000000100101", 25 => "10111101110100001000100110100111", 26 => "00111110011101110111111010001011", 27 => "10111110100000110010110001100101", 
    28 => "00111110001111001101101001110001", 29 => "00111101100010110011001011010111", 30 => "00111101010110101100011100110100", 31 => "00111101111100000111101010110110");



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

