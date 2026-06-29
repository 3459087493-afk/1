-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bNq is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bNq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111011010000111111000111000100", 1 => "10111101011011001011101100000010", 2 => "10111101100001000010101001101110", 3 => "00111110010101110101110100101110", 
    4 => "00111110100111001010101001010010", 5 => "00111101111101101000111110011011", 6 => "00111101110001111001000011010001", 7 => "00111101110011101100111111110000", 
    8 => "00111110011011110001100010000001", 9 => "10111101111001100000011111110000", 10 => "00111101110110011101101111001111", 11 => "10111110001001000011100010000001", 
    12 => "10111101001101011110100010101000", 13 => "00111110010110000011101011101110", 14 => "00111110010000100100111111011000", 15 => "00111101100110010100010110101111", 
    16 => "00111101110100110110000101100001", 17 => "10111100111011000001101001010110", 18 => "00111101100101000010000000001000", 19 => "10111101001010110010011101010001", 
    20 => "10111101011101011111010110111101", 21 => "10111100001000111110101101110000", 22 => "10111100101011101011100011011111", 23 => "10111110011110001101010110001000", 
    24 => "10111011100110011101101010011100", 25 => "00111101000101011101110101101010", 26 => "00111101111010000001101001100111", 27 => "10111110000000001010010001111100", 
    28 => "00111110001110110010011011110111", 29 => "00111011100011010101011000001110", 30 => "00111100001101000010001011101010", 31 => "00111100110100100111001111111111");



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

