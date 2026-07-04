-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_tiny_position_embedding_V_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 8; 
             AddressWidth     : integer := 7; 
             AddressRange    : integer := 96
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of imgds_linear_tiny_position_embedding_V_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10000111", 1 => "00110000", 2 => "01101100", 3 => "11110110", 
    4 => "11001111", 5 => "00000101", 6 => "00011010", 7 => "11010001", 
    8 => "01101100", 9 => "01001000", 10 => "11000101", 11 => "10100100", 
    12 => "10100001", 13 => "00010001", 14 => "01000110", 15 => "11000100", 
    16 => "11101011", 17 => "00011110", 18 => "11010100", 19 => "01001011", 
    20 => "01001011", 21 => "11010101", 22 => "11011011", 23 => "11011100", 
    24 => "11111101", 25 => "00010110", 26 => "00010010", 27 => "11100110", 
    28 => "00000000", 29 => "11010111", 30 => "00001111", 31 => "00100110", 
    32 => "11011000", 33 => "11010001", 34 => "00000000", 35 => "11101100", 
    36 => "00100001", 37 => "11111100", 38 => "11110011", 39 => "01100101", 
    40 => "11110000", 41 => "11101100", 42 => "00000000", 43 => "01000010", 
    44 => "11100000", 45 => "10110110", 46 => "00010010", 47 => "11000010", 
    48 => "00011010", 49 => "11001110", 50 => "11101110", 51 => "01011000", 
    52 => "00000001", 53 => "11110000", 54 => "11111111", 55 => "11000110", 
    56 => "11100111", 57 => "01010011", 58 => "00000010", 59 => "00001011", 
    60 => "11110110", 61 => "11001111", 62 => "11101110", 63 => "01010001", 
    64 => "11111100", 65 => "00011001", 66 => "11101110", 67 => "11010001", 
    68 => "11100111", 69 => "01001101", 70 => "11101111", 71 => "11111110", 
    72 => "11111000", 73 => "11011110", 74 => "01101110", 75 => "00101110", 
    76 => "11011011", 77 => "11010111", 78 => "00000101", 79 => "11101100", 
    80 => "01011001", 81 => "00101111", 82 => "11001000", 83 => "11010000", 
    84 => "00110001", 85 => "11110011", 86 => "00110101", 87 => "11100011", 
    88 => "11110010", 89 => "11100100", 90 => "00011001", 91 => "11100100", 
    92 => "01110001", 93 => "01000011", 94 => "11100000", 95 => "11100101");



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

