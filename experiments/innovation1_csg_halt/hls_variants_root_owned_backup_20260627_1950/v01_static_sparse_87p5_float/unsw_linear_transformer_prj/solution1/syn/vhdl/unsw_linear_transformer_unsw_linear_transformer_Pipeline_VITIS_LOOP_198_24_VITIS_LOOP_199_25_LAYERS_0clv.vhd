-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0clv is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0clv is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101100101001111011111110000", 1 => "00111100100001001000111100101101", 2 => "10111110010010011101110011110010", 3 => "00111110100011101101001100010001", 
    4 => "10111101101110111101011100001101", 5 => "00111110010010001111110000011000", 6 => "10111110011111010111101010110000", 7 => "10111110000100010011000111100001", 
    8 => "00111101110110111001111001010111", 9 => "00111110000011000101010011100111", 10 => "00111110000101010101110110011001", 11 => "00111110011010001001000111011000", 
    12 => "10111101100110101010010011011000", 13 => "10111110100111010010100110111000", 14 => "10111101110111101100111100001001", 15 => "00111101111110101001100010110011");



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

