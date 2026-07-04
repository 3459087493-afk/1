-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_query_wecud is 
    generic(
             DataWidth     : integer := 12; 
             AddressWidth     : integer := 6; 
             AddressRange    : integer := 64
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_query_wecud is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "110010010110", 1 => "111111111011", 2 => "111000111000", 3 => "111000110110", 
    4 => "001000010010", 5 => "111001100011", 6 => "111000110110", 7 => "111010010011", 
    8 => "000011010011", 9 => "000001100011", 10 => "111110011100", 11 => "110100011011", 
    12 => "110110011011", 13 => "000100101101", 14 => "000010110000", 15 => "000101010011", 
    16 => "000001010100", 17 => "111000011001", 18 => "001000101010", 19 => "101111111000", 
    20 => "110110001000", 21 => "010000101110", 22 => "110110110110", 23 => "001100000110", 
    24 => "110101001011", 25 => "001100100010", 26 => "001010100001", 27 => "000001110110", 
    28 => "111101110001", 29 => "110100001000", 30 => "001011011001", 31 => "110110101001", 
    32 => "110101010110", 33 => "110111110110", 34 => "111110001000", 35 => "000111111001", 
    36 => "110101111100", 37 => "000001101001", 38 => "111001010110", 39 => "000110110011", 
    40 => "111000000110", 41 => "111000110110", 42 => "111011100001", 43 => "000100110001", 
    44 => "000001111100", 45 => "110011111101", 46 => "000011010100", 47 => "110111110110", 
    48 => "110111011110", 49 => "000001110110", 50 => "000001110000", 51 => "001101000000", 
    52 => "000000110011", 53 => "111000110110", 54 => "001100101010", 55 => "111011101100", 
    56 => "111100100000", 57 => "000010011011", 58 => "110011001110", 59 => "111110100110", 
    60 => "000011100011", 61 => "001000011010", 62 => "111010010110", 63 => "001000101110");



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

