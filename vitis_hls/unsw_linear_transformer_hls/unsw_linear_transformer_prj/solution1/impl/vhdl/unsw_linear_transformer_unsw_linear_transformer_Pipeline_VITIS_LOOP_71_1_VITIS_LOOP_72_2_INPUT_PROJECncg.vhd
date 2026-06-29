-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECncg is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECncg is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101011011110101110111110101", 1 => "00111110000001110011010101100010", 2 => "10111101101111011101010011101010", 3 => "10111101111010010101111000110110", 
    4 => "10111101110011110100100010100100", 5 => "00111110001100001000110100010111", 6 => "10111101100001011100001001100110", 7 => "10111110000000000101010000001100", 
    8 => "00111100001001110010100100001110", 9 => "00111101101111000000011010001101", 10 => "10111010111011000100100111001110", 11 => "10111100101100001001100000000101", 
    12 => "00111101000000101010010111100010", 13 => "00111100101110001101010011101010", 14 => "10111100111000110101010010000110", 15 => "00111100001100110010101001100000");



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

