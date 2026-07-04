-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_tiny_imgds_linear_tiny_Pipeline_VITIS_LOOP_139_5_layers_0_feedforward_3_weight_V_Rhbi is 
    generic(
             DataWidth     : integer := 10; 
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


architecture rtl of imgds_linear_tiny_imgds_linear_tiny_Pipeline_VITIS_LOOP_139_5_layers_0_feedforward_3_weight_V_Rhbi is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "1011000110", 1 => "1110001100", 2 => "1111001000", 3 => "1011111011", 
    4 => "1011111110", 5 => "0010010110", 6 => "1101101100", 7 => "0011100001", 
    8 => "1011000001", 9 => "1101101001", 10 => "0001010000", 11 => "0000110110", 
    12 => "0110110101", 13 => "0101011001", 14 => "1100001100", 15 => "1111111001", 
    16 => "0001110011", 17 => "1111111000", 18 => "0101110011", 19 => "1111000001", 
    20 => "0001110110", 21 => "0001100100", 22 => "0110000110", 23 => "1011111001", 
    24 => "0100000001", 25 => "0011101100", 26 => "1100001100", 27 => "0000110110", 
    28 => "0100101001", 29 => "0000111000", 30 => "0011011100", 31 => "0010100000", 
    32 => "0011001001", 33 => "0001011110", 34 => "0100100011", 35 => "1101100001", 
    36 => "1101100011", 37 => "0001100011", 38 => "0010000011", 39 => "0100001110", 
    40 => "1110110110", 41 => "0001011110", 42 => "0010000011", 43 => "1101111100", 
    44 => "1111001011", 45 => "1111001001", 46 => "1111011110", 47 => "0010000000", 
    48 => "1111001001", 49 => "1011111001", 50 => "0000100001", 51 => "0001001100", 
    52 => "0010100001", 53 => "0000011001", 54 => "1100010011", 55 => "1100111100", 
    56 => "1010011100", 57 => "1001111000", 58 => "1011001001", 59 => "1110011011", 
    60 => "1111000100", 61 => "0100010101", 62 => "1101100110", 63 => "0101111110", 
    64 => "0110110110", 65 => "0001101011", 66 => "0010101001", 67 => "1111010011", 
    68 => "1111010001", 69 => "1101101100", 70 => "1011000011", 71 => "1111010100");



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

