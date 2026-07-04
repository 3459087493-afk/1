-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_layers_0_attention_outputfYi is 
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


architecture rtl of imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_layers_0_attention_outputfYi is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "11011110000", 1 => "00010011000", 2 => "11100101001", 3 => "00011100100", 
    4 => "00001111110", 5 => "11000110011", 6 => "00101001001", 7 => "11011101000", 
    8 => "11001111100", 9 => "11111010001", 10 => "00110110011", 11 => "10111101000", 
    12 => "10101111001", 13 => "00001000001", 14 => "11111010100", 15 => "11111000001", 
    16 => "10111110000", 17 => "11111011001", 18 => "00100010011", 19 => "11011000001", 
    20 => "00001010001", 21 => "00000001100", 22 => "11101110001", 23 => "00111100000", 
    24 => "00010100011", 25 => "00000100001", 26 => "11101010001", 27 => "11111001100", 
    28 => "00101110011", 29 => "00000100000", 30 => "00001000110", 31 => "00111110011", 
    32 => "00110110101", 33 => "11011011110", 34 => "10110011101", 35 => "00001011000", 
    36 => "11010010001", 37 => "10110111000", 38 => "00101110110", 39 => "10111011000", 
    40 => "01001011110", 41 => "11000010011", 42 => "11001110110", 43 => "00110010000", 
    44 => "11111110000", 45 => "11011011100", 46 => "00100111110", 47 => "11010001001", 
    48 => "11011010101", 49 => "10110111110", 50 => "11010010011", 51 => "11001100011", 
    52 => "00110101011", 53 => "11011001001", 54 => "00001111100", 55 => "11100111100", 
    56 => "11100111100", 57 => "00110010011", 58 => "00001101001", 59 => "00011100011", 
    60 => "00010111110", 61 => "11001101101", 62 => "00100110000", 63 => "00111100110");



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

