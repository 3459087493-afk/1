-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_LAYERS_0_ATT1iI is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_LAYERS_0_ATT1iI is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101111000011100101110110110", 1 => "10111110010011100110011110001100", 2 => "00111110100000001100100111110111", 3 => "10111101110101010111000000101110", 
    4 => "00111110100010010101111101110010", 5 => "10111101010110011100100110010101", 6 => "00111100100011110111011110011001", 7 => "10111110110100111010110100010100", 
    8 => "00111110100111100101000011101001", 9 => "10111110000110100011110001101000", 10 => "00111110000101001001011111001111", 11 => "00111110000011110000110011100010", 
    12 => "00111101100100111010101010000001", 13 => "00111110101111010110010001011101", 14 => "00111100110001111101010111100011", 15 => "00111110101110010010100100101011");



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

