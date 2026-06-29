-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22_LAYERS_0bSr is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22_LAYERS_0bSr is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110101010100010010001010001", 1 => "00111110111000000001010100001111", 2 => "10111101010011001011110010110111", 3 => "10111101110100110100000000000011", 
    4 => "10111110000110010001110111101010", 5 => "10111110011011001010011011110100", 6 => "00111101010110100001110001010100", 7 => "00111110000010011101010011010111", 
    8 => "00111110010111111001001000110110", 9 => "10111110010101110001001011010110", 10 => "10111110010101111010100011100110", 11 => "10111101001000101011010111011110", 
    12 => "00111110010011100100100001110001", 13 => "00111100100001100000000101000010", 14 => "10111110110000000111110101110110", 15 => "10111101101101001011000010001111", 
    16 => "10111101011011111001000100111111", 17 => "10111010010010001010110001000001", 18 => "10111100000111110000011000110000", 19 => "10111110011100110100010101111010", 
    20 => "00111101101011110100011110001010", 21 => "00111101001011101111110000100001", 22 => "00111101100011011000010100010100", 23 => "10111110011011100011010100010110", 
    24 => "10111100111111100100111101010000", 25 => "10111110000001000001110011111011", 26 => "00111101110011001011010110101011", 27 => "10111101000010001000001111001000", 
    28 => "00111110010011010100101110011101", 29 => "10111110011110010000100001101111", 30 => "00111011110101001100100100101000", 31 => "00111011111001011111111101010100");



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

