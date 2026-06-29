-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_99_4_VITIS_LOOP_100_5_LAYERS_0_ATFfa is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_99_4_VITIS_LOOP_100_5_LAYERS_0_ATFfa is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110011000110111111001001000", 1 => "00111101111000111110111000010000", 2 => "00111101001101000100100101100000", 3 => "10111101111011010111110101101001", 
    4 => "10111110001000010111100001011010", 5 => "00111001111000101101010101111110", 6 => "00111110111000110000110010111111", 7 => "00111110001111001111100000111100", 
    8 => "00111101111001101000010100010100", 9 => "00111110110010001011011111101010", 10 => "10111110100011011111011100011011", 11 => "00111101110001111001110110100110", 
    12 => "10111110011000000001000111001110", 13 => "00111110111010101000101110101101", 14 => "00111011100101000010111011011001", 15 => "10111110100011000011101101111110");



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

