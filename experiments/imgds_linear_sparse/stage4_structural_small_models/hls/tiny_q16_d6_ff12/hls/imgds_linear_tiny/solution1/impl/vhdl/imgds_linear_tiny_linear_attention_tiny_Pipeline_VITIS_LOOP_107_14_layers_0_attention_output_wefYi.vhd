-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_tiny_linear_attention_tiny_Pipeline_VITIS_LOOP_107_14_layers_0_attention_output_wefYi is 
    generic(
             DataWidth     : integer := 11; 
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


architecture rtl of imgds_linear_tiny_linear_attention_tiny_Pipeline_VITIS_LOOP_107_14_layers_0_attention_output_wefYi is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00001111000", 1 => "00100011110", 2 => "10111101000", 3 => "10110001100", 
    4 => "11110000001", 5 => "00100111011", 6 => "01000110010", 7 => "11101110110", 
    8 => "11011001000", 9 => "11000011000", 10 => "00101001001", 11 => "11000001101", 
    12 => "00101111000", 13 => "00010100011", 14 => "11111000001", 15 => "01000111100", 
    16 => "00111000101", 17 => "11111000001", 18 => "11111010100", 19 => "00110001100", 
    20 => "11001010101", 21 => "10100110000", 22 => "00111101110", 23 => "11010100110", 
    24 => "11111010011", 25 => "00001100100", 26 => "01000000011", 27 => "00001111001", 
    28 => "00010010110", 29 => "00001101110", 30 => "11011000001", 31 => "10110111101", 
    32 => "01000111101", 33 => "11000001110", 34 => "10111100110", 35 => "11101000011");



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

