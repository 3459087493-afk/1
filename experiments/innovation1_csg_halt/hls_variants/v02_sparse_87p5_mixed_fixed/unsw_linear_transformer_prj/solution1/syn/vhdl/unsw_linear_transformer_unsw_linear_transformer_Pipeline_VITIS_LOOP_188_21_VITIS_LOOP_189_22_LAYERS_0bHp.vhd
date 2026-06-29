-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bHp is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bHp is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101101011010000010111110001", 1 => "10111101110000111101001101011010", 2 => "10111101101100011000001000101111", 3 => "00111101100111010001111000011001", 
    4 => "00111101000100100010110111111110", 5 => "10111101011000000101111110010001", 6 => "10111110010110011101001011000110", 7 => "10111100100110101000100001001000", 
    8 => "10111110001011000110101011010000", 9 => "00111100101000001100011011001101", 10 => "10111110011100000000001000000011", 11 => "00111101100111110100001001101000", 
    12 => "10111101000111001111010100100101", 13 => "10111110101000110110010100100101", 14 => "10111011110000000100101101101110", 15 => "10111110011101111100111110111011", 
    16 => "00111101010100000011011000010000", 17 => "00111110010000100110011100110101", 18 => "00111101000010110111110101101001", 19 => "10111110100111010011010000111000", 
    20 => "10111110011010011100100100010001", 21 => "00111101010010101011100010101011", 22 => "10111101001010111100000010011011", 23 => "10111101110011000100101110011100", 
    24 => "10111101100100011011111110110000", 25 => "10111110011010010011011011110000", 26 => "00111101000110011000111100111111", 27 => "00111110001001000001111110000110", 
    28 => "10111101001101010101100010101100", 29 => "00111110000010001010011000011101", 30 => "00111101100110000001110110000111", 31 => "10111101100010110110100010010100");



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

