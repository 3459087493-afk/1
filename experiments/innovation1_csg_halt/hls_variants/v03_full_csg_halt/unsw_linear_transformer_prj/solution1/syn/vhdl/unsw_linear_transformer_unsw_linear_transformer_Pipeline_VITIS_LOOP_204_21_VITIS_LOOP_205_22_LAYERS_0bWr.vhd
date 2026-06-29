-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bWr is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bWr is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110011000101000101100101011", 1 => "10111101101111010110000100100000", 2 => "00111110000100000010110100111011", 3 => "00111101001101111010101111111011", 
    4 => "00111101110001000111101101001100", 5 => "10111101111010101010000101010001", 6 => "10111101010010111000111010011110", 7 => "00111101111100100010100111111101", 
    8 => "00111100001111000100100101100000", 9 => "00111101110000000011010111011000", 10 => "10111101101001100101100100001000", 11 => "10111110101001100010011111000111", 
    12 => "00111110000010001100111011011110", 13 => "00111101001101111000101011011010", 14 => "10111101101000110100010110111111", 15 => "10111101101110110011000011011000", 
    16 => "00111011111000000111110011001110", 17 => "00111101010010110111110111111111", 18 => "10111100000101001110001010000001", 19 => "10111110001111101100100100011101", 
    20 => "00111101110000010100111000111100", 21 => "10111101011010011110100101011100", 22 => "00111101011000011000100011001100", 23 => "10111100110111111000011010111001", 
    24 => "10111100100100100000101010001000", 25 => "10111101000101101101011111001100", 26 => "00111101110100011001100101110010", 27 => "00111110001001111101000110101011", 
    28 => "00111110000110011011111011001010", 29 => "10111100111101011111101000111000", 30 => "10111110001100010110000001111000", 31 => "00111100011011110010100100000101");



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

