-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0cfu is 
    generic(
             DataWidth     : integer := 32; 
             AddressWidth     : integer := 4; 
             AddressRange    : integer := 16
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0cfu is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110100000010110011110001101", 1 => "10111110001101110100001110000010", 2 => "00111110001001101101001010001010", 3 => "10111110101100101101000100110011", 
    4 => "00111110000000011010011001100100", 5 => "00111101101011010011100100001010", 6 => "00111110000111011110000100000110", 7 => "00111110010010011010111001010001", 
    8 => "10111110000010101011000101000110", 9 => "10111110100011010100101010101000", 10 => "10111100101011000011100111011101", 11 => "10111101010100100001001001111100", 
    12 => "00111101101110100000011101100000", 13 => "10111101111100100000111100000000", 14 => "00111101110111110111100111110110", 15 => "10111110001001010110110010100000");



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

