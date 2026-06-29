-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATT0iy is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATT0iy is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111100101100100001100010100111", 1 => "10111100000101110111010111110100", 2 => "00111101001110000111000101100100", 3 => "10111110010011100011111010000001", 
    4 => "00111101000111011011110011110100", 5 => "00111001100101100000100100001110", 6 => "00111101101011101100000101101010", 7 => "10111101000101010011000100011111", 
    8 => "10111101011100110001100010001111", 9 => "00111110010011100100000011000011", 10 => "10111110100110000101101000101011", 11 => "10111110100101111001010101111010", 
    12 => "10111100111010000111010111111000", 13 => "00111110100001010010000000110100", 14 => "00111011100001111110000000000111", 15 => "00111101100111000100010010000110");



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

