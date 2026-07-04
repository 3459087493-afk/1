-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36_CLASSIFIER_WEIGHT_V_ROM_AUkbM is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36_CLASSIFIER_WEIGHT_V_ROM_AUkbM is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "11111000001", 1 => "11110100001", 2 => "00011011101", 3 => "11000001011", 
    4 => "00000110010", 5 => "11111111011", 6 => "01000110110", 7 => "00110010000", 
    8 => "11011000010", 9 => "10111100000", 10 => "00000000110", 11 => "11001011110", 
    12 => "00010111101", 13 => "00001100001", 14 => "00100010011", 15 => "11011011110", 
    16 => "11100010001", 17 => "11110100001", 18 => "11100101000", 19 => "00101010001", 
    20 => "11110001000", 21 => "11111111011", 22 => "11000110101", 23 => "11001011100", 
    24 => "00110001111", 25 => "00111100101", 26 => "00000000110", 27 => "00111011011", 
    28 => "11010101000", 29 => "11101011011", 30 => "11010101110", 31 => "00110000010");



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

