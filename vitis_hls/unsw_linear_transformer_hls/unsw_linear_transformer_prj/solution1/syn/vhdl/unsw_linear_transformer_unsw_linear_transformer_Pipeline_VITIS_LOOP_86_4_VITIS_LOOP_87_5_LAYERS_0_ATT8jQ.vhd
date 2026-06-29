-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATT8jQ is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATT8jQ is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101000110011011100110011010", 1 => "10111101000000001001111000011001", 2 => "10111100011001000000111011111110", 3 => "10111010101101010111101111000100", 
    4 => "00111100011010011000100111110011", 5 => "10111100110100010100010000010111", 6 => "00111101000000110000010100001100", 7 => "10111101000011110010011110110100", 
    8 => "10111100111010000101110111000100", 9 => "00111101001011011011001010111111", 10 => "00111100010010101101000111010110", 11 => "00111101000101001001111101110110", 
    12 => "00111100101000000001111110001000", 13 => "00111101000101010001010111000001", 14 => "10111100110111111111110011100001", 15 => "00111100111011000011010100100101");



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

