-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bFp is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bFp is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "0001010111", 1 => "1110011110", 2 => "1110100111", 3 => "0001001111", 
    4 => "0000100101", 5 => "1111001000", 6 => "1100100110", 7 => "1111101101", 
    8 => "1101010100", 9 => "0000010100", 10 => "1100010000", 11 => "0001010000", 
    12 => "1111011001", 13 => "1010111001", 14 => "1111111010", 15 => "1100001000", 
    16 => "0000110100", 17 => "0011000010", 18 => "0000100011", 19 => "1011000110", 
    20 => "1100010110", 21 => "0000110011", 22 => "1111010101", 23 => "1110011010", 
    24 => "1110110111", 25 => "1100010111", 26 => "0000100110", 27 => "0010100100", 
    28 => "1111010011", 29 => "0010001001", 30 => "0001001100", 31 => "1110111010");



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

