-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_84_1_VITIS_LOOP_85_2_INPUT_PROJECqcK is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_84_1_VITIS_LOOP_85_2_INPUT_PROJECqcK is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110010001101111011010010101", 1 => "10111110001100001101000001011000", 2 => "00111110001100100110011011100100", 3 => "10111110000110001100000111011010", 
    4 => "10111101111011111110101111000001", 5 => "10111101100101111110100111011001", 6 => "00111110100110110011001000100000", 7 => "00111101110100000110110011010010", 
    8 => "10111110011111011011110000011001", 9 => "10111110100000011000011101000101", 10 => "10111101001110001011000101101100", 11 => "10111110001010111000010111111000", 
    12 => "00111100111101111010010010011001", 13 => "10111110000001001111101011000100", 14 => "00111110000110010010001111010101", 15 => "10111110000010101010011110111110");



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

