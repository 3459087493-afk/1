-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_LAYERS_0_ATTHfu is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_LAYERS_0_ATTHfu is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101000011011100100011101101", 1 => "10111100011010011010101110001011", 2 => "10111100010011110101001110111010", 3 => "00111011001110101001110101110100", 
    4 => "00111011101110001011011011001010", 5 => "10111000011101000011111011010000", 6 => "10111011011101100111011001010010", 7 => "10111100000111011011010101111100", 
    8 => "10111011101011010100100001111010", 9 => "10111100110000111000111000010100", 10 => "00111011010100000101011110101100", 11 => "00111100111101010001001000100101", 
    12 => "00111011101110101101111100011101", 13 => "00111101011100000000000101001111", 14 => "10111100001010110110011010110001", 15 => "00111100000001001100001100000111");



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

