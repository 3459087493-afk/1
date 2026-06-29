-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17_LAYERS_0brm is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17_LAYERS_0brm is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110001000111111110000110001", 1 => "00111110001001100100000010100011", 2 => "10111101001011000101011001110111", 3 => "10111110010111101000010000111111", 
    4 => "10111110001110101100101010000000", 5 => "00111101101110001100111011010100", 6 => "10111110100011010111100010101100", 7 => "00111110100111100101100011111110", 
    8 => "10111101001011000001101101110110", 9 => "10111100000000101110110100010000", 10 => "00111101101010101110001011010000", 11 => "10111110100000111111000011011111", 
    12 => "00111101111110100001001111010110", 13 => "00111100100000001110100000101111", 14 => "00111110100101000111110010010110", 15 => "00111101110110011111001000100001");



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

