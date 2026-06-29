-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATTbck is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATTbck is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111011000001111100011111110000", 1 => "00111011111000110000111001000100", 2 => "00111110000111010001011000001010", 3 => "00111100111000111101001011010111", 
    4 => "10111101110111100111100111001000", 5 => "10111101001111011010111110001010", 6 => "00111110011011011001111111000011", 7 => "00111101101101101011110111110001", 
    8 => "00111101101111110100100000010011", 9 => "00111110011111111111100110100011", 10 => "00111101100000111101111110101011", 11 => "00111110011101001101100111101101", 
    12 => "00111101101111110000001010010000", 13 => "00111110001110000001000111110100", 14 => "10111101001000001110010000000000", 15 => "00111110000111111100010011110011");



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

