-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_tiny_imgds_linear_tiny_Pipeline_VITIS_LOOP_128_3_layers_0_feedforward_0_weight_V_Rg8j is 
    generic(
             DataWidth     : integer := 11; 
             AddressWidth     : integer := 7; 
             AddressRange    : integer := 72
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of imgds_linear_tiny_imgds_linear_tiny_Pipeline_VITIS_LOOP_128_3_layers_0_feedforward_0_weight_V_Rg8j is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00010011011", 1 => "11011001001", 2 => "01000101110", 3 => "00110000001", 
    4 => "00001001100", 5 => "11101110000", 6 => "00011110100", 7 => "00011001100", 
    8 => "00110100101", 9 => "11011010101", 10 => "00101101001", 11 => "11100011001", 
    12 => "11010111001", 13 => "00101101000", 14 => "00001110000", 15 => "00100111110", 
    16 => "11111010000", 17 => "00101111110", 18 => "11110101100", 19 => "00110000011", 
    20 => "00010110100", 21 => "11001110001", 22 => "11110011110", 23 => "00111001101", 
    24 => "00111010011", 25 => "00000111110", 26 => "00011011000", 27 => "00001011100", 
    28 => "11100000011", 29 => "11011100000", 30 => "11100110000", 31 => "11110011110", 
    32 => "11100111100", 33 => "11101110100", 34 => "00100011110", 35 => "00100000001", 
    36 => "11101011001", 37 => "11100010001", 38 => "11110000011", 39 => "00100101001", 
    40 => "11011010011", 41 => "11011001110", 42 => "00001110001", 43 => "00001110000", 
    44 => "00001100011", 45 => "11110011100", 46 => "00110110110", 47 => "11111001110", 
    48 => "00101011011", 49 => "00010000011", 50 => "00111000001", 51 => "11010101001", 
    52 => "00011100011", 53 => "11111001110", 54 => "00010000001", 55 => "11010001001", 
    56 => "00110110110", 57 => "11110010110", 58 => "11011110011", 59 => "11101110011", 
    60 => "00011100110", 61 => "11100111100", 62 => "00000110011", 63 => "01000011101", 
    64 => "00011011001", 65 => "00000110110", 66 => "11101100100", 67 => "00010010110", 
    68 => "11110110011", 69 => "00100100001", 70 => "00010100110", 71 => "00100101000");



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

