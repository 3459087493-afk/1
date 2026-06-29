-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_165_18_VITIS_LOOP_166_19_LAYERS_0bCo is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_165_18_VITIS_LOOP_166_19_LAYERS_0bCo is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110101001011000111000010010", 1 => "00111110001110010000010101001100", 2 => "00111101100110011101011101011111", 3 => "00111110100001110110110000011101", 
    4 => "10111110001001000111101000110001", 5 => "10111110001110110010010110011110", 6 => "10111110001000000000011000011100", 7 => "10111110101011001010010111111101", 
    8 => "10111101001101111100101000010111", 9 => "00111110101001010000111100010011", 10 => "10111110100010101001011010000100", 11 => "00111110011011000110111000011010", 
    12 => "00111110100000100010000001000100", 13 => "10111101110101010000010110100101", 14 => "00111101100001100110011101000000", 15 => "00111110001101110010101110000100");



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

