-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_216_24_VITIS_LOOP_217_25_LAYERS_0bXr is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_216_24_VITIS_LOOP_217_25_LAYERS_0bXr is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101100011111010010010000011", 1 => "00111011110011110111010110100011", 2 => "10111101000110101110110110000010", 3 => "10111101100100100000101001000100", 
    4 => "10111110001100001110100001010011", 5 => "10111101110001100001111110001011", 6 => "00111101111011100000100010101100", 7 => "10111100111000110110011000111001", 
    8 => "00111100101010101101001010000011", 9 => "00111101000000011110011001000110", 10 => "10111100111111000000100011011110", 11 => "10111101010100010100111010100110", 
    12 => "00111110000000100101010001100001", 13 => "00111110001010111000100101110000", 14 => "00111101111111001110011011111110", 15 => "00111100001010110001011010001010");



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

