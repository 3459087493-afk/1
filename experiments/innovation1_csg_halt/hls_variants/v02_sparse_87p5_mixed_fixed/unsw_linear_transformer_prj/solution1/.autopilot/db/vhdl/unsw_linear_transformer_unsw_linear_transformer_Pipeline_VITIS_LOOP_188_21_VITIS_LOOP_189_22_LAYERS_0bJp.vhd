-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bJp is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_LAYERS_0bJp is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111100110101010101100111100010", 1 => "10111011101101010110000110100010", 2 => "00111101111001001000101101100000", 3 => "10111101011101011000011100000010", 
    4 => "10111110000111100000010000101000", 5 => "10111110000101100101101010110001", 6 => "00111101111001011010001111001110", 7 => "10111110001001111110000000001110", 
    8 => "00111110010011011011100101100001", 9 => "00111101001011101000010111000011", 10 => "10111110011011010111111111011001", 11 => "00111110000101011011010111010111", 
    12 => "10111100111000100111010000011011", 13 => "00111101001010110100001100101100", 14 => "00111101100100110111011110100110", 15 => "00111110011110000000001000000001", 
    16 => "10111100011101101101101000011111", 17 => "10111100111101011100011101111110", 18 => "10111100000101110011000101000110", 19 => "00111101101001111011011011000110", 
    20 => "00111110001111100011100001101011", 21 => "00111100101000010111000010010110", 22 => "10111101000000011111011101110100", 23 => "10111101101001011011110010010000", 
    24 => "00111101001111011010001010000011", 25 => "00111101011001011100101101110011", 26 => "10111101100010000101000001111101", 27 => "00111101101001000000111111011100", 
    28 => "10111110101000001100101011000110", 29 => "10111101011010111001101101110011", 30 => "00111011001100010000110111110100", 31 => "10111101100111001001000010010010");



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

