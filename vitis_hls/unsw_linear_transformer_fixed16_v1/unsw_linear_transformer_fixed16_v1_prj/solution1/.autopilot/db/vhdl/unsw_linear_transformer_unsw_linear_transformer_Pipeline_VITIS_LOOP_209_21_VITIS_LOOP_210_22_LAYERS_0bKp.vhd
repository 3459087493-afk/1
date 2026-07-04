-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bKp is 
    generic(
             DataWidth     : integer := 11; 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bKp is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10110100110", 1 => "11111000010", 2 => "11101111101", 3 => "11101111000", 
    4 => "11101111100", 5 => "00000100011", 6 => "11101100100", 7 => "00000010001", 
    8 => "00011000010", 9 => "11001000110", 10 => "11110111001", 11 => "11111101010", 
    12 => "11111101111", 13 => "00011100100", 14 => "11101100011", 15 => "11101010100", 
    16 => "11100100010", 17 => "00000000000", 18 => "00000001101", 19 => "11100110011", 
    20 => "00011000001", 21 => "11101111110", 22 => "00000111001", 23 => "11001011101", 
    24 => "11111011111", 25 => "11110011000", 26 => "00011110111", 27 => "11011111010", 
    28 => "00010111101", 29 => "00001000110", 30 => "00000110111", 31 => "00001111000");



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

