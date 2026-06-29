-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bLp is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_204_21_VITIS_LOOP_205_22_LAYERS_0bLp is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111100010011001111000110110001", 1 => "00111100100101111001101110110011", 2 => "10111101001011111111010110010011", 3 => "10111110100011110011111100011110", 
    4 => "10111110100010111110111011001011", 5 => "10111110101110110000000100001010", 6 => "10111110100001011110010111101001", 7 => "00111101101110010111000010010011", 
    8 => "00111100100000011001001100010101", 9 => "00111110000100011010111010010001", 10 => "10111101101110110110001110111100", 11 => "10111101101011001011001101100111", 
    12 => "10111100010111111001110101101011", 13 => "10111101101101110110100110101010", 14 => "10111110001011100001010111010100", 15 => "10111110010000000110011110010000", 
    16 => "10111110100011001001011100011001", 17 => "10111101101011100001101101010111", 18 => "00111100111101110111100100011101", 19 => "10111110100001000110111100101111", 
    20 => "10111011100001101100010110000001", 21 => "10111101001110101011000111110101", 22 => "00111110010001000001110011000111", 23 => "00111101111001111111100110001100", 
    24 => "10111101001001101001010000011001", 25 => "10111011010010110011010001011101", 26 => "00111101000011100011001000101101", 27 => "10111110011101010001100111111001", 
    28 => "10111101100100001101000010010000", 29 => "10111110101010011100010001010110", 30 => "10111101101000010110010100110110", 31 => "10111101100110010101110101100010");



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

