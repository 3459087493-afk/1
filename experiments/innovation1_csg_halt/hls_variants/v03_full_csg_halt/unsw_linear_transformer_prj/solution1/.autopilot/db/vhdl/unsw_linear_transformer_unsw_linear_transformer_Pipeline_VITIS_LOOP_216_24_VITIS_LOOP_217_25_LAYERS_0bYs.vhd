-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_216_24_VITIS_LOOP_217_25_LAYERS_0bYs is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_216_24_VITIS_LOOP_217_25_LAYERS_0bYs is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110011000011111100000001111", 1 => "10111010100111000100000011011110", 2 => "10111100000011101101101100010100", 3 => "00111110100101000110111110110001", 
    4 => "00111110000110110011101010110011", 5 => "00111110100111000110010111001100", 6 => "10111110100010110000010100001011", 7 => "10111110001010110110000001100101", 
    8 => "10111101000000110010111011100110", 9 => "00111101011100010010011011000011", 10 => "00111100111100010010101010011100", 11 => "00111110000000100010110000111110", 
    12 => "10111101010011110100000001101011", 13 => "10111100001100110101011111000100", 14 => "10111110010001010001010011110010", 15 => "00111101110000110011110000101111");



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

