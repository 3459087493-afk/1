-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_LAYERS_0cbu is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_LAYERS_0cbu is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110101011101011110111101001", 1 => "00111101000110010110001000011010", 2 => "10111101110100110111010110110101", 3 => "00111110001111000110100111011000", 
    4 => "00111110000111001010100101011111", 5 => "00111011001011110110000001000100", 6 => "10111110010111101011011101100110", 7 => "10111110100000111100110111110100", 
    8 => "00111101111101000101011010100110", 9 => "00111110100111001111111011001101", 10 => "00111110001000001011101010110111", 11 => "00111101111111101010000111000001", 
    12 => "00111101101001001101101010110110", 13 => "10111101010010001001011001100000", 14 => "00111101000010111101111010001111", 15 => "00111011100101001110001001111011");



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

