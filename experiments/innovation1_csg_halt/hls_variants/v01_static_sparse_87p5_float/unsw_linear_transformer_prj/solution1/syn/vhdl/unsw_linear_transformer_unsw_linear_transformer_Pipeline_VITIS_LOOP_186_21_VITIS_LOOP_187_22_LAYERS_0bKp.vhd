-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22_LAYERS_0bKp is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22_LAYERS_0bKp is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110100001110001101100011000", 1 => "10111110101100001100001101110010", 2 => "00111101110100010000010011001100", 3 => "00111101111100010000001110011111", 
    4 => "10111100101101110111000011101000", 5 => "00111110000011001100000110001110", 6 => "10111100011010110101010100011010", 7 => "10111101100011000101011110000101", 
    8 => "00111011011101101001110111011001", 9 => "00111011100100111100101101101010", 10 => "00111110000111010001010011001110", 11 => "00111100100010011011010010111001", 
    12 => "10111101011110001100000010010000", 13 => "10111101000111000111111100111010", 14 => "00111110101010010110100100010001", 15 => "00111101000010000011011101101011", 
    16 => "00111101101111101001111011111001", 17 => "10111101001101010110001001111001", 18 => "10111100010101101011001100000011", 19 => "00111101111110100011000110100110", 
    20 => "00111101101000101001010110011011", 21 => "10111101111000000001001111001100", 22 => "10111101001110011101011010111011", 23 => "00111101110011100101001000001010", 
    24 => "00111101110010001001101100111101", 25 => "10111110000100111111111100101100", 26 => "10111110100110000101100100111101", 27 => "00111101011110100111111101000000", 
    28 => "10111101000100100101111101001010", 29 => "00111101101000001110001010100110", 30 => "00111101101011110101101100001110", 31 => "00111101111111010101111100111111");



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

