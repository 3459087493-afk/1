-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bPq is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bPq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101100011011110000011101000", 1 => "00111011111001001010011000010100", 2 => "10111101000110010000010001100100", 3 => "00111110100000110000110100011100", 
    4 => "00111100110111000111010010101101", 5 => "00111101111001101001010000100101", 6 => "10111101000001000100000100001100", 7 => "10111101100111001011000110011011", 
    8 => "10111110101101011011101001000010", 9 => "00111110100101100011010100000000", 10 => "00111101110110001010001000000111", 11 => "00111110001110011110000110001011", 
    12 => "10111101101000101101010111001001", 13 => "00111110000110111001010011100101", 14 => "00111110011000101110000010111000", 15 => "10111100010000111110111001101111", 
    16 => "00111110100101000110100110101001", 17 => "00111011101101000110111110011100", 18 => "10111100010111101011010101111110", 19 => "10111101011100100111111000001110", 
    20 => "00111110001011101010110101101011", 21 => "00111100100011001110100101011101", 22 => "10111110001001101000011111110011", 23 => "00111110011100110000001111101011", 
    24 => "00111101100110000110110011010100", 25 => "00111110011111101111111011100000", 26 => "10111110000101101010100111000001", 27 => "00111110010010110011100011110111", 
    28 => "10111101101110101011001100100101", 29 => "00111110011000001001000001100100", 30 => "00111101001001011011011100000010", 31 => "10111101110100001001101110010000");



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

