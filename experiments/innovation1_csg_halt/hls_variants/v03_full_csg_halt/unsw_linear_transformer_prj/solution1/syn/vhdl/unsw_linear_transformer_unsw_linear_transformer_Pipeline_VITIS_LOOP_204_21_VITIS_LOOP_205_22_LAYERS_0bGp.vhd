-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bGp is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bGp is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111011100001110001111010001100", 1 => "10111101111001011011101110011110", 2 => "00111101001011000010010010010010", 3 => "10111110000000100110001110101110", 
    4 => "10111100101100011100010010101110", 5 => "10111101100100111011101100101001", 6 => "10111110001000110101011001001011", 7 => "10111100111001111010111001000000", 
    8 => "10111110011101111110111101101100", 9 => "00111101000100110001100100011100", 10 => "10111101000011010000100001111111", 11 => "10111110001101101110100010110000", 
    12 => "10111101110110010011011110101000", 13 => "10111110100010111010000110011011", 14 => "10111110011001101110011101101000", 15 => "10111110100001111010001001010001", 
    16 => "10111110100001111011111000110100", 17 => "10111110001000111101100010001011", 18 => "00111101010000111000111011011011", 19 => "10111110010011011000100101101000", 
    20 => "10111110100100000011010000011001", 21 => "10111011101011111101111100111100", 22 => "10111110101010101101010000111100", 23 => "10111101100101101001101010100101", 
    24 => "00111100011101001011000001000101", 25 => "00111101110011001101101010001100", 26 => "10111100111110100000110001000011", 27 => "10111110010000000010101110010000", 
    28 => "10111101111001110010011011010011", 29 => "10111110010101110000011111110110", 30 => "10111101000010010100010010110001", 31 => "10111100110001111111100011110110");



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

