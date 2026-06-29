-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22_LAYERS_0bIp is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22_LAYERS_0bIp is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111100111100101110101110001110", 1 => "10111101101001011101101011110010", 2 => "00111101011011110111001011011100", 3 => "00111110010010011111111110000110", 
    4 => "00111110100001101111010001001000", 5 => "00111101010101000100010001010100", 6 => "00111101101110101110110011000010", 7 => "10111101101111101100110111001101", 
    8 => "00111110010100000011111110101001", 9 => "00111101010001100010011111111100", 10 => "00111110100100000111011111111100", 11 => "00111110000110111111110111001000", 
    12 => "10111110001001001000011100010101", 13 => "10111110011110101010000010110111", 14 => "00111110001101000101100100100110", 15 => "00111100001000100110100110000001", 
    16 => "00111110100001011000100000111101", 17 => "00111110001001101100011110010000", 18 => "00111110011000001010111011110000", 19 => "10111011001000010111100111110100", 
    20 => "10111101100000001101100111001110", 21 => "00111110000101110011000100111100", 22 => "10111110000111101101000101110011", 23 => "00111110010101011011011001111000", 
    24 => "00111110000000110110001011110100", 25 => "10111101001001011110101110001001", 26 => "10111110000010111101101101010101", 27 => "00111110100001101110010111110101", 
    28 => "10111110000011100110111010110011", 29 => "00111101111100110001000110001000", 30 => "00111110010101101000010111101110", 31 => "10111110100011100011000110111001");



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

