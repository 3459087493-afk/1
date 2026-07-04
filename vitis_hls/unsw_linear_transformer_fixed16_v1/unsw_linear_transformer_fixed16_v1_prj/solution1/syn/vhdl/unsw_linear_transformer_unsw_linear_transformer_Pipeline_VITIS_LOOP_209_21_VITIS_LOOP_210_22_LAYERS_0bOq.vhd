-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bOq is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bOq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "0100000001", 1 => "0001010010", 2 => "1110110110", 3 => "1101011010", 
    4 => "1111101100", 5 => "0000100010", 6 => "0010111011", 7 => "1111101100", 
    8 => "1011111110", 9 => "1111110110", 10 => "0010011001", 11 => "1101110001", 
    12 => "1110000110", 13 => "1011100001", 14 => "1100101110", 15 => "0011110001", 
    16 => "1100110010", 17 => "0011000001", 18 => "0001110101", 19 => "0001110111", 
    20 => "1010011010", 21 => "0000110100", 22 => "1111000100", 23 => "0000100100", 
    24 => "1100111100", 25 => "0100010010", 26 => "1111000101", 27 => "1100110101", 
    28 => "0011001100", 29 => "1111101000", 30 => "0010010110", 31 => "0000111001");



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

