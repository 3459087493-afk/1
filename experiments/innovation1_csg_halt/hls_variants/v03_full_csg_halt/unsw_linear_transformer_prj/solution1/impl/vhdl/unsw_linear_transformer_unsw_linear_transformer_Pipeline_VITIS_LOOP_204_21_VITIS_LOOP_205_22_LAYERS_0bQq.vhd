-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bQq is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bQq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110100000001001000011010111", 1 => "00111101101000110000110101010111", 2 => "10111101100100110111101110000101", 3 => "10111110001001100000110000101100", 
    4 => "10111100100111000100111011010110", 5 => "00111101000010000011110111010000", 6 => "00111110001110110010110010110011", 7 => "10111100100111000110101001010100", 
    8 => "10111110100000010001000101010001", 9 => "10111100001001001001000010110101", 10 => "00111110000110001011110000000001", 11 => "10111110000011110111001000110000", 
    12 => "10111101111100111111110001110000", 13 => "10111110100011111011011101011010", 14 => "10111110010100011100000000011100", 15 => "00111110011100010010111101010100", 
    16 => "10111110010011011010011101001010", 17 => "00111110010000010110100000001000", 18 => "00111101111010101101000110011010", 19 => "00111101111011010101011010101000", 
    20 => "10111110101100110000110010100101", 21 => "00111101010100000101100001001001", 22 => "10111101011100001101110100010011", 23 => "00111101000011101100101111101011", 
    24 => "10111110010000111011110001001000", 25 => "00111110100010001100011001000111", 26 => "10111101011011001111110111000110", 27 => "10111110010010101000111100011000", 
    28 => "00111110010011000010011111100011", 29 => "10111100101111111110011100100001", 30 => "00111110000101100010010101101101", 31 => "00111101011000111100111110011100");



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

