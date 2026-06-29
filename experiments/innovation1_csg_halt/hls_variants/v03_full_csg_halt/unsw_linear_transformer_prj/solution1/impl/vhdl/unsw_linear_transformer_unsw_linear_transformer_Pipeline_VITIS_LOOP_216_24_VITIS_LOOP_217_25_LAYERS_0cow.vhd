-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_216_24_VITIS_LOOP_217_25_LAYERS_0cow is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_216_24_VITIS_LOOP_217_25_LAYERS_0cow is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110010010101001011100011011", 1 => "00111110101100011100011101110100", 2 => "00111101010000001100010011100000", 3 => "10111011000110110100010111101110", 
    4 => "10111110100110101001010011100110", 5 => "00111110000001011001011101011111", 6 => "10111101111101001111001100001011", 7 => "10111101111110000110110101101010", 
    8 => "00111101011110111100010100111100", 9 => "10111110001000110100111101110101", 10 => "10111110001100000110111000100111", 11 => "10111100001011110110101011001010", 
    12 => "00111100101011000110110100000101", 13 => "00111110011110000111111110110111", 14 => "00111101000001111000000010010000", 15 => "00111100111000011100110100100110");



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

