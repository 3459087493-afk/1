-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_LAYERS_0cjv is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_LAYERS_0cjv is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110000000110011000111001100", 1 => "00111100011001110100011101101111", 2 => "00111101110010111001000101111001", 3 => "10111101010101001001011010101001", 
    4 => "00111101110101010111111001001000", 5 => "00111000100101100000101000001100", 6 => "00111100101111111110010111111010", 7 => "00111101001101000110110001110100", 
    8 => "10111101001101011001101000101110", 9 => "10111101011010001000000010100011", 10 => "10111101001010001010101111001000", 11 => "10111100110010011001110110101001", 
    12 => "10111101000001100010001100001000", 13 => "00111101110100001110101100001111", 14 => "10111100000001100100110111110010", 15 => "00111110000100010011001100010011");



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

