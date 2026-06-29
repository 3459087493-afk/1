-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_LAYERS_0cdu is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_LAYERS_0cdu is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101100100011010101000001110", 1 => "10111110001110111110111011010011", 2 => "00111101101101000111100001100101", 3 => "10111110100111110000001101001110", 
    4 => "00111101110010111111001000011011", 5 => "00111100100110100000100100010010", 6 => "00111110100110001000110110100010", 7 => "00111110101010001001111000011011", 
    8 => "10111110100001100000100011110101", 9 => "10111110100000001111000110000010", 10 => "00111100111010011000000001000010", 11 => "10111110001111110011010100011011", 
    12 => "00111101101111000000110111001001", 13 => "00111101100001100001101101110011", 14 => "00111110101001010000011111111011", 15 => "10111110001100110101011010101011");



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

