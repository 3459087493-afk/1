-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_tiny_linear_attention_tiny_Pipeline_VITIS_LOOP_48_3_layers_0_attention_query_weighcud is 
    generic(
             DataWidth     : integer := 12; 
             AddressWidth     : integer := 6; 
             AddressRange    : integer := 36
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of imgds_linear_tiny_linear_attention_tiny_Pipeline_VITIS_LOOP_48_3_layers_0_attention_query_weighcud is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "001100110110", 1 => "000011000001", 2 => "110111110001", 3 => "000110101000", 
    4 => "000100111110", 5 => "000011001011", 6 => "001110111101", 7 => "000010000011", 
    8 => "000000110001", 9 => "111111011011", 10 => "111110100110", 11 => "001001011110", 
    12 => "000011001110", 13 => "110100011101", 14 => "001100001110", 15 => "111000100011", 
    16 => "000000001000", 17 => "000011011110", 18 => "000001111000", 19 => "101110010101", 
    20 => "010010010110", 21 => "001111111011", 22 => "000001011011", 23 => "000011110100", 
    24 => "110100010010", 25 => "000001000110", 26 => "001000111110", 27 => "000100101101", 
    28 => "110110100001", 29 => "000000101001", 30 => "000001000001", 31 => "111101110100", 
    32 => "110000111010", 33 => "110111110011", 34 => "000010001001", 35 => "111011001001");



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

