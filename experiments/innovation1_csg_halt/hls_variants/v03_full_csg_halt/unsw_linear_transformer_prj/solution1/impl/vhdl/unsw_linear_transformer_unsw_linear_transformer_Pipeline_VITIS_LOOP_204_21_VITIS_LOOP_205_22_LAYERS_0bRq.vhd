-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bRq is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bRq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111011101101010110011110010101", 1 => "00111101100100011111110010000011", 2 => "10111100110101001100001100111100", 3 => "10111101111111011101100110101001", 
    4 => "00111101000111110011101101101010", 5 => "00111101101110111110110110101110", 6 => "10111101001110101000010100100111", 7 => "00111101100000101110100010111111", 
    8 => "10111100110001010011101110111100", 9 => "10111100100011100110101000100010", 10 => "00111101010101101000011000110101", 11 => "10111101011001011011110011110010", 
    12 => "00111101010010100000111110000110", 13 => "10111010100001011100100000000000", 14 => "10111101011111101000010010101000", 15 => "10111100111111111101111000010100", 
    16 => "10111101010101100000000001001010", 17 => "10111101101101111110100001100011", 18 => "00111100100010001011001001010001", 19 => "00111100110001011000110010011000", 
    20 => "00111011111001100101100011111001", 21 => "00111011011111001101000000011101", 22 => "00111110000010011111001010100100", 23 => "00111101001111100000000010100001", 
    24 => "10111100100110111011100011011001", 25 => "10111100110000001100010010110110", 26 => "00111101100111110111101110011101", 27 => "10111110000111111101000001001011", 
    28 => "00111110100011010010100001101000", 29 => "00111011111010000101110101001100", 30 => "10111100111111011000000101101011", 31 => "00111101011101100100101000100100");



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

