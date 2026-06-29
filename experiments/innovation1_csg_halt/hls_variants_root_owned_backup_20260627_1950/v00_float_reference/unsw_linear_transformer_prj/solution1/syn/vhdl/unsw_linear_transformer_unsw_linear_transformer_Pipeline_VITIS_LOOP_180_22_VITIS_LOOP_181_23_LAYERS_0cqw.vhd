-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0cqw is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0cqw is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101100001100101001011011001", 1 => "00111101100010110100010101100000", 2 => "10111110001110000100110010001111", 3 => "00111100111011101001000000110111", 
    4 => "10111110001000001110100010110000", 5 => "00111110100001001100001000110000", 6 => "10111101101100010110100000110110", 7 => "00111101100110000111101001010100", 
    8 => "00111100001100001001001110001101", 9 => "10111100101001111110101011110110", 10 => "10111011101000100001110111100010", 11 => "00111100110101000101110100100100", 
    12 => "00111101101001000110101110010011", 13 => "10111110001010111011011011110100", 14 => "00111101110100111010010110000000", 15 => "10111101110110111110011011010110");



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

