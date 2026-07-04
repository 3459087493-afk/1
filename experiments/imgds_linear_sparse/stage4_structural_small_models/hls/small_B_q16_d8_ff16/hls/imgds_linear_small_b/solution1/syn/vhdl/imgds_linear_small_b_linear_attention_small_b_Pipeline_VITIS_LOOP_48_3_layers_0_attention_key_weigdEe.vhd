-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_key_weigdEe is 
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


architecture rtl of imgds_linear_small_b_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_layers_0_attention_key_weigdEe is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00011000011", 1 => "11011000110", 2 => "00011011011", 3 => "01001100011", 
    4 => "00011000001", 5 => "10011110001", 6 => "00100101001", 7 => "01101011101", 
    8 => "00100101110", 9 => "00011000110", 10 => "00111000110", 11 => "11011100001", 
    12 => "11101111100", 13 => "00000000011", 14 => "11110100110", 15 => "00111111100", 
    16 => "11111100011", 17 => "10011110110", 18 => "00101110101", 19 => "11010101000", 
    20 => "11000001001", 21 => "00110001001", 22 => "00001011001", 23 => "00111110110", 
    24 => "11010010001", 25 => "00001111001", 26 => "00010110001", 27 => "01000101100", 
    28 => "00010100001", 29 => "00100010011", 30 => "11001101001", 31 => "01101001100", 
    32 => "01000100011", 33 => "11111000100", 34 => "11010000110", 35 => "00001100000", 
    36 => "01000101010", 37 => "10101000101", 38 => "11001000011", 39 => "00111000001", 
    40 => "00000010100", 41 => "00111011011", 42 => "00011001000", 43 => "00001111011", 
    44 => "00010100011", 45 => "11001011011", 46 => "10011010101", 47 => "00000100000", 
    48 => "10101101100", 49 => "00101001100", 50 => "00010011011", 51 => "00011000110", 
    52 => "00000101011", 53 => "10110100001", 54 => "10101001000", 55 => "00010011110", 
    56 => "00001101100", 57 => "11000101110", 58 => "11011001000", 59 => "00111111001", 
    60 => "11101100000", 61 => "00000110001", 62 => "00101100110", 63 => "01100101110");



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

