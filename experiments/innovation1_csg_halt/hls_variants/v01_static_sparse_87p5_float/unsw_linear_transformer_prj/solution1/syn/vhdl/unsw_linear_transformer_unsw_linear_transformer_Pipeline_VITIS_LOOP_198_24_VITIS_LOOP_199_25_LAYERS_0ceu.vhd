-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0ceu is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0ceu is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101011111000111000010000101", 1 => "00111011000001111110111101001101", 2 => "00111110000100011011010101101110", 3 => "10111110100001100101010011100010", 
    4 => "00111101111010111010100100011111", 5 => "00111100000011111010001011010000", 6 => "00111110100101011001101000110000", 7 => "00111110100111000010110101000111", 
    8 => "10111110011000010000101001100100", 9 => "10111110101001110001000100111011", 10 => "00111100111011000001110101001101", 11 => "10111110001101100101100011101100", 
    12 => "10111100010000011010000001001000", 13 => "00111101010010101011110110001001", 14 => "00111101100110011010010100100010", 15 => "10111110001100101110010010010011");



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

