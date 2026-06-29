-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_LAYERS_0_ATTQgW is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_LAYERS_0_ATTQgW is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101001011100101001010111111", 1 => "10111101011000001010101101010001", 2 => "10111100000111110001101101111011", 3 => "10111100011010011111110011101101", 
    4 => "10111101000110010001101111000011", 5 => "10111100101011100001000001001110", 6 => "00111101011111011010101101110011", 7 => "10111100100010010100110011111010", 
    8 => "10111100110011111100000010011110", 9 => "00111101000000110000100110110111", 10 => "10111100000001111100111000010000", 11 => "00111101101111010000000100101100", 
    12 => "00111010110101010010001011100011", 13 => "00111101101011100101111110111100", 14 => "10111101001000001001100010100110", 15 => "10111011111100010100101100000001");



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

