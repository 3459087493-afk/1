-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATTbfk is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATTbfk is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110011111110010110100011101", 1 => "00111110100101000111000111101011", 2 => "00111101101110110011100101101010", 3 => "00111011000011101010111010010110", 
    4 => "00111110010000011010010001001001", 5 => "00111100110111000100010001110010", 6 => "00111101000111111110010011101100", 7 => "00111110001101110000010000110110", 
    8 => "00111110001101001010011011101101", 9 => "00111110001111011111110110100100", 10 => "00111110011001011101111001001101", 11 => "10111101001101100000010100010110", 
    12 => "10111101110001111001000001001000", 13 => "00111101001001100101010011001010", 14 => "00111110001101001011101110000111", 15 => "10111100101101000101000100111110");



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

