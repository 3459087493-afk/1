-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_99_4_VITIS_LOOP_100_5_LAYERS_0_ATShg is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_99_4_VITIS_LOOP_100_5_LAYERS_0_ATShg is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111011100011111110000110100110", 1 => "10111110010010110010110000010100", 2 => "10111011101100101000011010000101", 3 => "10111110010000110010111110100110", 
    4 => "00111101010010111101110000010011", 5 => "10111110101001111110000111011001", 6 => "10111110010111000111000111101001", 7 => "10111101100100001111010000101111", 
    8 => "00111110100111101010101100101011", 9 => "10111101101010110001100001111001", 10 => "00111110100010110110111101000111", 11 => "10111100100010100101110010000011", 
    12 => "00111101111110110011101111111111", 13 => "00111101111000110010001001011110", 14 => "00111101100001000100111101111001", 15 => "00111101100110101011000110000011");



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

