-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_value_weeOg is 
    generic(
             DataWidth     : integer := 11; 
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


architecture rtl of imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_value_weeOg is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "11001101011", 1 => "11111110000", 2 => "11001011001", 3 => "11111011110", 
    4 => "11111011011", 5 => "11011111110", 6 => "00010001110", 7 => "11100111000", 
    8 => "00101010101", 9 => "11111110001", 10 => "00110010001", 11 => "00111001100", 
    12 => "00001010001", 13 => "00001110001", 14 => "11011111110", 15 => "11010010110", 
    16 => "00101001011", 17 => "00110110001", 18 => "00000110110", 19 => "01000000011", 
    20 => "00101110000", 21 => "00110111110", 22 => "11100111110", 23 => "00011110001", 
    24 => "10111101100", 25 => "10111010011", 26 => "00101000011", 27 => "11010110001", 
    28 => "00111010011", 29 => "10111011000", 30 => "11000101110", 31 => "10111001110", 
    32 => "00101011110", 33 => "11001110101", 34 => "10100101010", 35 => "00011010110", 
    36 => "11110010011", 37 => "10110111100", 38 => "00111100001", 39 => "00101111110", 
    40 => "00111011001", 41 => "00101101110", 42 => "11000100101", 43 => "11011010110", 
    44 => "11100100001", 45 => "10110111110", 46 => "00101111000", 47 => "11101001100", 
    48 => "00011111110", 49 => "11011011100", 50 => "01000111000", 51 => "00111001001", 
    52 => "00110011000", 53 => "00100010101", 54 => "01001000011", 55 => "00010000001", 
    56 => "00001011011", 57 => "11101000001", 58 => "00110100101", 59 => "10101000010", 
    60 => "00101110000", 61 => "11111111011", 62 => "11110011110", 63 => "11010100001");



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

