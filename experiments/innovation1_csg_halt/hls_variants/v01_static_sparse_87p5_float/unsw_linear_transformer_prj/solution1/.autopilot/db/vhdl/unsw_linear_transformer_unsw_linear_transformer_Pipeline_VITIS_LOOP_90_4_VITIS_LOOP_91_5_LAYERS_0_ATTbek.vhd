-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_LAYERS_0_ATTbek is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_LAYERS_0_ATTbek is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111100011001100010000001010001", 1 => "10111101001011111101100110010010", 2 => "10111101000100010100000010100011", 3 => "10111100110101010001001011000001", 
    4 => "10111100110101000010110000001010", 5 => "10111100011001101000110100010011", 6 => "00111100011011011110100000011010", 7 => "10111101000001010000101001110000", 
    8 => "10111101000001001011100001101100", 9 => "10111100110100010101011100100110", 10 => "10111100000011000000101100100101", 11 => "00111110000011011110100110111101", 
    12 => "00111011111110100111011011010101", 13 => "00111101001110000111000000001011", 14 => "10111100111101101000000100000000", 15 => "10111101000010110001111101000001");



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

