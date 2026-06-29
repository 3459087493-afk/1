-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0b1s is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0b1s is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111100101111110110011010000000", 1 => "10111101110010101110100110001001", 2 => "00111110010000010100100111100000", 3 => "10111110000111100100101000010001", 
    4 => "00111101100001100000011011000000", 5 => "10111110001111010010111100000101", 6 => "00111110010000100110011000100011", 7 => "00111110101010000011000000110101", 
    8 => "10111101011100111011001111110110", 9 => "10111110001010111111001111101011", 10 => "10111101010111000001111001101101", 11 => "00111100011001100101100000000101", 
    12 => "00111110000010011010111011100101", 13 => "10111110010101001001010010101110", 14 => "00111011000001011110000111110110", 15 => "00111011011011010101101000001110");



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

