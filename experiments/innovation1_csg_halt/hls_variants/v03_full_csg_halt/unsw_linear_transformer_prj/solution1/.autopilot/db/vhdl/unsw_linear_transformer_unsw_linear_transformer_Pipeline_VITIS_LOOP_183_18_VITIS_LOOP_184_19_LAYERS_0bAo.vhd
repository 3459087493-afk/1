-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_183_18_VITIS_LOOP_184_19_LAYERS_0bAo is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_183_18_VITIS_LOOP_184_19_LAYERS_0bAo is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111011100001100100111000010010", 1 => "00111110100001001111100001001000", 2 => "10111110101111001001101001010000", 3 => "10111101010111001101110010111111", 
    4 => "10111110110001001011000100011001", 5 => "10111110111111011001010110001111", 6 => "00111101000110010000001100000101", 7 => "10111101111101000011000001010010", 
    8 => "00111101111000101101101101101011", 9 => "00111100011100001111101110010111", 10 => "10111110001010100001100011000110", 11 => "10111110101000001111010010000101", 
    12 => "10111101111101100011100010010110", 13 => "10111101001000111001110101101100", 14 => "00111110000010000101010011111000", 15 => "00111110100110000100001000011110");



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

