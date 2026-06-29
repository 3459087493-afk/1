-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_LAYERS_0cpw is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_LAYERS_0cpw is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110001101010101100011110101", 1 => "00111101011001100000100111011001", 2 => "00111110000011110011010100111111", 3 => "10111110011110010011000010001101", 
    4 => "00111110011001111000101111111111", 5 => "00111110100100111110010101000111", 6 => "00111110100101001010111100000110", 7 => "00111110010010111011111011001010", 
    8 => "10111110001001000001000011111000", 9 => "10111110101110010001110100101100", 10 => "00111101001000101011000000100111", 11 => "10111011011001001111111111101010", 
    12 => "10111101101000000010111110010111", 13 => "00111101110110111101011111001101", 14 => "10111101101000001010011101010110", 15 => "10111110011100001011010100011000");



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

