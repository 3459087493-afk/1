-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bUr is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bUr is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101010100011011101101110110", 1 => "10111110000010100111101110000111", 2 => "00111101111100010000101001101001", 3 => "00111110100001010000101011111100", 
    4 => "00111110011110001000101011001110", 5 => "00111110100010100011110011101011", 6 => "00111110100101100110100000010100", 7 => "10111101111010111100100001100010", 
    8 => "00111110101000101010010001010010", 9 => "10111110000101011100011001100101", 10 => "00111110101110000111101010110000", 11 => "10111110000011101100101101110000", 
    12 => "10111101111101101101111000010011", 13 => "00111110101101000110001111101000", 14 => "00111110010101001101100111010001", 15 => "00111110100011101001001010000000", 
    16 => "00111110100010011010110101101111", 17 => "00111110000001000110101001001000", 18 => "10111100001101110101110001100001", 19 => "00111110011100111000110111101001", 
    20 => "00111110100011011001001101001001", 21 => "00111101101101111000110010111011", 22 => "10111100111000001000111100101011", 23 => "10111110011100100110010000010111", 
    24 => "10111110001100101110111100101010", 25 => "00111110001101010101110001111100", 26 => "10111101110111010111011000111010", 27 => "00111110011010010011011100001000", 
    28 => "10111101111111000001100100100101", 29 => "00111110101100100100101010110001", 30 => "10111110000001010010100001001000", 31 => "10111100101011101011101010010101");



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

