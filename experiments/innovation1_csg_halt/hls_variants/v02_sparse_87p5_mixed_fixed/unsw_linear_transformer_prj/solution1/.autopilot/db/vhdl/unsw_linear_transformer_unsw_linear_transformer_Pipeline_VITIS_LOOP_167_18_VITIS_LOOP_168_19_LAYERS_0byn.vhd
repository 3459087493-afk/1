-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_LAYERS_0byn is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_LAYERS_0byn is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110000000100010101110101011", 1 => "10111110011011110100011100110101", 2 => "10111101101110011110100101111001", 3 => "00111101111101100101100010000111", 
    4 => "10111110100100011000110011110101", 5 => "00111101110001010010111100011011", 6 => "00111101101111001111001101001011", 7 => "10111110010000100011000010011010", 
    8 => "00111101100000111000100010100000", 9 => "00111110000100000110000100011110", 10 => "10111101000101110101111011110001", 11 => "10111100100110001101111001111100", 
    12 => "10111110101000100011000100100110", 13 => "00111101001100111001010011100101", 14 => "10111110000010111100110010101110", 15 => "00111110101001111100100010101011");



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

