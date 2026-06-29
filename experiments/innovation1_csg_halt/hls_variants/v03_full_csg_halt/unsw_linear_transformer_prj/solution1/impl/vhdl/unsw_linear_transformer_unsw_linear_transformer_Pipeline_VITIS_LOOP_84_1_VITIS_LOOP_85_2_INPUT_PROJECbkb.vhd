-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_84_1_VITIS_LOOP_85_2_INPUT_PROJECbkb is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_84_1_VITIS_LOOP_85_2_INPUT_PROJECbkb is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101001010001100001110011101", 1 => "00111101110010001010111111111101", 2 => "10111101110000011011100011100010", 3 => "10111100110111111010010101001100", 
    4 => "00111101011010110001000100010110", 5 => "10111100101111010000010101110101", 6 => "10111101011000110011011000010011", 7 => "10111101011000100000110111011101", 
    8 => "00111101101101001111010010000010", 9 => "00111101010110100111111000101110", 10 => "00111100111001001110110101001100", 11 => "10111101010011000001000111100111", 
    12 => "10111101110010101111100110101011", 13 => "10111100101111000011011101000011", 14 => "00111100100110101001111101101110", 15 => "10111101100000101001101100110001");



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

