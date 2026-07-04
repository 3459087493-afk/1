-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bQq is 
    generic(
             DataWidth     : integer := 10; 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bQq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "1010101100", 1 => "0111000000", 2 => "1111001101", 3 => "1110010110", 
    4 => "1101100111", 5 => "1100010011", 6 => "0000110111", 7 => "0010001010", 
    8 => "0011100000", 9 => "1100101001", 10 => "1100101000", 11 => "1111010111", 
    12 => "0011001110", 13 => "0000010001", 14 => "1001111111", 15 => "1110100110", 
    16 => "1111000100", 17 => "1111111111", 18 => "1111110110", 19 => "1100001101", 
    20 => "0001011000", 21 => "0000101100", 22 => "0001000111", 23 => "1100010010", 
    24 => "1111100000", 25 => "1101111100", 26 => "0001100110", 27 => "1111011110", 
    28 => "0011001101", 29 => "1100000111", 30 => "0000000111", 31 => "0000000111");



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

