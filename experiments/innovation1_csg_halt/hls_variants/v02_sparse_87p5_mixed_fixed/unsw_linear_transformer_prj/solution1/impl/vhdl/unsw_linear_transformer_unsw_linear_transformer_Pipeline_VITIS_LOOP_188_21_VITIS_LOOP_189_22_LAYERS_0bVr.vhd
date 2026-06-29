-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bVr is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bVr is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110010000100100110000011110", 1 => "10111101100011100010001110100101", 2 => "10111101111011111000000110000100", 3 => "10111100011011010110111111001100", 
    4 => "10111101111110101110101101100110", 5 => "10111100000011000010100001100001", 6 => "00111110011000011111101101110011", 7 => "10111101010000110101010110111011", 
    8 => "00111110011001011110110011110000", 9 => "10111101011101010100101101000001", 10 => "00111101100100101001011011101110", 11 => "10111100010011101011111001000101", 
    12 => "10111100100100100101101000110000", 13 => "10111101110011010110011000101011", 14 => "00111100110101111010110000001101", 15 => "00111110100101001111010010111110", 
    16 => "00111110001001100100011110000011", 17 => "00111110100001011010001110011001", 18 => "10111100111100011010100100011011", 19 => "00111110001101001010010110101011", 
    20 => "10111101100101010101101100111110", 21 => "10111110000010011101101000111011", 22 => "00111101000101010001011000000100", 23 => "00111110010011111001110010110111", 
    24 => "00111110010001011011111101101110", 25 => "00111101011011010010000000011001", 26 => "10111101111101000000101100100001", 27 => "00111110000000001011111001011101", 
    28 => "10111101010001001100100001110101", 29 => "10111011100011111001101101101100", 30 => "00111110001100110101101010110101", 31 => "00111100111111011000001111011010");



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

