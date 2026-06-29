-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0b2s is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0b2s is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101010110000010010110100010", 1 => "10111110100000110001001010110110", 2 => "00111110010100100000010111100100", 3 => "10111101100100111111101001011101", 
    4 => "00111101010111100011111101101011", 5 => "10111101111101101100010100000001", 6 => "10111101011110110111101010000011", 7 => "00111110101011111100011000000001", 
    8 => "10111110010001010000001111111111", 9 => "10111101111000011010001101110001", 10 => "10111101110100100010010111111101", 11 => "10111110100011110101101000011001", 
    12 => "00111110000000110011010000001111", 13 => "00111101000101111100000100100101", 14 => "10111011010000101000011010101100", 15 => "00111101101011101100011011111001");



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

