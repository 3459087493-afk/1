-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_LAYERS_0bun is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_LAYERS_0bun is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101010011011001011001001010", 1 => "00111110110000100001111110111001", 2 => "00111110010010110101110111100000", 3 => "10111110001100000011100101011101", 
    4 => "10111110000111110000010010010100", 5 => "10111110001101111110110011101111", 6 => "10111110001001011100001110110111", 7 => "00111100000000111111101001011011", 
    8 => "00111110101101000000101100100100", 9 => "00111110010101111110100110111011", 10 => "10111110000110111010101000010001", 11 => "00111101011110001111101000001111", 
    12 => "00111010110010011000001010011011", 13 => "10111010101011011100111110000000", 14 => "10111110010000100000000000111110", 15 => "00111101111010001011001010101110");



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

