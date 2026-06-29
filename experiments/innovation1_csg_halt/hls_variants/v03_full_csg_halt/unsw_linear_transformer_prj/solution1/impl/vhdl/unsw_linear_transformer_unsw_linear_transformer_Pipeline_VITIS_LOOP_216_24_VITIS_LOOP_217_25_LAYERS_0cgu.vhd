-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_216_24_VITIS_LOOP_217_25_LAYERS_0cgu is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_216_24_VITIS_LOOP_217_25_LAYERS_0cgu is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101001111001110110000100000", 1 => "10111101101001000001111110100000", 2 => "00111101100010000011011000101001", 3 => "00111101010011000110001010110100", 
    4 => "10111101100000111000001001101001", 5 => "00111110011000011010000110100101", 6 => "10111101010110000101010111101111", 7 => "00111101000001000011010111110101", 
    8 => "10111100100010101000010011011001", 9 => "10111101111100110010111100111001", 10 => "10111100011100001110010101001010", 11 => "00111101100101011111001000101110", 
    12 => "10111101000000000010100001010110", 13 => "10111110000001110011010110110011", 14 => "00111101100100000110110011010001", 15 => "00111100001011110001001111111000");



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

