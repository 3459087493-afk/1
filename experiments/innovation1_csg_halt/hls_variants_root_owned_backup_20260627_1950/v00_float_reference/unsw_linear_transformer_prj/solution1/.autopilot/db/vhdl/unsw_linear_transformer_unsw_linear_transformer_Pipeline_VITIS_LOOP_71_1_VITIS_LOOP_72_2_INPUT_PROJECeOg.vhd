-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECeOg is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECeOg is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101110100110011100110110110", 1 => "00111110001100101001101100011110", 2 => "10111110001000110001101101100100", 3 => "10111101111011001100001010100111", 
    4 => "00111101010011110111001100100110", 5 => "00111101101111100100110000010100", 6 => "10111110000001000010111001000000", 7 => "10111110001111010011101000011001", 
    8 => "10111100101010100010001100110101", 9 => "00111110000101111001101110101100", 10 => "10111101010100001010110011001010", 11 => "00111101100010001010010011000110", 
    12 => "10111100000101001111001000100000", 13 => "00111110100011100100111111000111", 14 => "10111101100111010100011011100000", 15 => "10111110000111000111110011101000");



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

