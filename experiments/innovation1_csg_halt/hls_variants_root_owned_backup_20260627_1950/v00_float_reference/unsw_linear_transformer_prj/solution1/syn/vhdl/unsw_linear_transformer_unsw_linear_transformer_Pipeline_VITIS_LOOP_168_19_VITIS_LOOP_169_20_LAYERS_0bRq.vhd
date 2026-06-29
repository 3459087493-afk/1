-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_168_19_VITIS_LOOP_169_20_LAYERS_0bRq is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_168_19_VITIS_LOOP_169_20_LAYERS_0bRq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110001111110011001000000001", 1 => "00111101001100100100101000101100", 2 => "00111101011000010001000111111010", 3 => "10111101000100111011000111100000", 
    4 => "00111101110010111100101100000100", 5 => "00111101110111111011011011101010", 6 => "00111101110110110111111110011010", 7 => "10111100101010000010110000010010", 
    8 => "00111110001101101011000101110110", 9 => "00111101011111110110101100011011", 10 => "00111101110010011001001110110100", 11 => "00111110001001001010101101010101", 
    12 => "10111101011101110111110101011010", 13 => "00111101100010111110101111011001", 14 => "00111110011000110111101110111011", 15 => "00111110101011011100010110110010", 
    16 => "00111100001011110010101110110010", 17 => "10111100110111001110111011001010", 18 => "00111101110000101011001000000001", 19 => "00111101111110110000101011001010", 
    20 => "00111101110100000110101101111010", 21 => "10111101111011100101111011001110", 22 => "00111100111011011011110100011110", 23 => "00111101111101000111101010001101", 
    24 => "00111101100100110010011111011110", 25 => "00111110000010000110101101000000", 26 => "10111110001000110001110111000010", 27 => "00111110100111001111101010111101", 
    28 => "10111110001110101111101110111100", 29 => "00111100001001001100111101011000", 30 => "00111110000101001011011110110010", 31 => "10111101110000100000111101101011");



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

