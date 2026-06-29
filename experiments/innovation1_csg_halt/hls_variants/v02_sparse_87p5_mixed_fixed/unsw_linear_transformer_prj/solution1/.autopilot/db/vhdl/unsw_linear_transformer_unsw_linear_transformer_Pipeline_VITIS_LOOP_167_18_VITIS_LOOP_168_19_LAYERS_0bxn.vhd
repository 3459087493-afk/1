-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_LAYERS_0bxn is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_LAYERS_0bxn is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101110001110000001111100001", 1 => "10111101100110011101101000000000", 2 => "10111101100001111100111110000011", 3 => "00111101100000110110011110101011", 
    4 => "10111110100101100101100010000000", 5 => "00111110010110101000010101100100", 6 => "10111101101010011010010101110011", 7 => "00111100101000000010110011000101", 
    8 => "10111101010001001010101110111100", 9 => "00111101010010011100101101010111", 10 => "10111101110001101101100111111011", 11 => "10111110001001010100111010100101", 
    12 => "00111101100111100010001111001110", 13 => "00111110011100101000001111100011", 14 => "10111101100001000111111000011101", 15 => "10111110011010010010001011110110");



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

