-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22_LAYERS_0bOq is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22_LAYERS_0bOq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111100011001100111010000001000", 1 => "00111110001011011001011010111101", 2 => "10111101000001011110001101010010", 3 => "10111011111101010000001111100110", 
    4 => "00111101111001100011100110111111", 5 => "10111101110010101001110001110000", 6 => "00111101101000111001111011011100", 7 => "10111101110101011101100101001001", 
    8 => "10111101111110101011111010010011", 9 => "00111011000001100011011000100111", 10 => "10111110001011010101001011010111", 11 => "10111101111110011011111110000110", 
    12 => "10111101000010100000110110010101", 13 => "10111101111011110101100000100011", 14 => "10111110011011110001001101110100", 15 => "10111101100100111110000011001010", 
    16 => "10111110101001101000011000110010", 17 => "00111101100000001000110101000111", 18 => "10111110000001111101110100100000", 19 => "10111110010100001010110000010011", 
    20 => "10111101110011011011001011010000", 21 => "00111101111111011000010010100001", 22 => "10111101101101010100111111001111", 23 => "00111110101001001001100010100101", 
    24 => "00111101001011010111100100101011", 25 => "00111110000001000100010110110010", 26 => "10111101110111001011110100110001", 27 => "10111110011011000110111010011010", 
    28 => "00111110101110110000010111001100", 29 => "10111101100110111111001100010100", 30 => "10111110000111101111110101110011", 31 => "10111100101101001110100101010100");



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

