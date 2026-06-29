-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_INPUT_PROJEClbW is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_INPUT_PROJEClbW is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110100111000001111010101110", 1 => "10111110001011010111100100110000", 2 => "10111110100001000110010010100001", 3 => "10111110010111001010001000001101", 
    4 => "10111110100110001000111011001011", 5 => "10111110001011111100010000010010", 6 => "00111110000111111001000101110010", 7 => "00111110000111111010100011000111", 
    8 => "10111110100101110100111100110110", 9 => "00111101110101000110110010010101", 10 => "00111101111001011000111001111101", 11 => "10111101010000010110111110111000", 
    12 => "00111100100011111100101110111010", 13 => "10111101100011011101110011111010", 14 => "10111101000001010110001011011101", 15 => "10111110001001000100000100110000");



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

