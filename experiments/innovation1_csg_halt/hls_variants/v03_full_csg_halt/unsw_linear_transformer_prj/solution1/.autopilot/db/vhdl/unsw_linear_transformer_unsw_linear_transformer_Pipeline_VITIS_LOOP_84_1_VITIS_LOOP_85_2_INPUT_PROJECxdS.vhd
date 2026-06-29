-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_84_1_VITIS_LOOP_85_2_INPUT_PROJECxdS is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_84_1_VITIS_LOOP_85_2_INPUT_PROJECxdS is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101001001101010101001110001", 1 => "00111101010010101000010011001011", 2 => "10111110000000110000001001101110", 3 => "10111110000000101110110100000100", 
    4 => "10111110010011101110101010111111", 5 => "10111110100000110000101100110000", 6 => "10111100101010101011100100110010", 7 => "00111110000000011111110001101110", 
    8 => "10111110100001011000110010000101", 9 => "10111110100110010010101010110100", 10 => "10111110100010011110111100000110", 11 => "00111101111110110001010000110100", 
    12 => "00111101110000111010010011101011", 13 => "10111110100001110111001001111000", 14 => "00111100011001101011101010010101", 15 => "10111110010011011000001011100001");



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

