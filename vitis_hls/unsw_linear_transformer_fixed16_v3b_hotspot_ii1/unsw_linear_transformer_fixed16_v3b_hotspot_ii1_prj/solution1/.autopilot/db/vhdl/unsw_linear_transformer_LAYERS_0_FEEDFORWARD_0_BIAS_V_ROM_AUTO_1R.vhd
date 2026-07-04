-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_LAYERS_0_FEEDFORWARD_0_BIAS_V_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 10; 
             AddressWidth     : integer := 5; 
             AddressRange    : integer := 32
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of unsw_linear_transformer_LAYERS_0_FEEDFORWARD_0_BIAS_V_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "0000000100", 1 => "1110001101", 2 => "0000101011", 3 => "1101111110", 
    4 => "1111101010", 5 => "1110110110", 6 => "1101011101", 7 => "1111100011", 
    8 => "1100001000", 9 => "0000100101", 10 => "1111011101", 11 => "1101001001", 
    12 => "1110010011", 13 => "1011101001", 14 => "1100011001", 15 => "1011110001", 
    16 => "1011110001", 17 => "1101011100", 18 => "0000110001", 19 => "1100110010", 
    20 => "1011100000", 21 => "1111111011", 22 => "1010101010", 23 => "1110110101", 
    24 => "0000001111", 25 => "0001100110", 26 => "1111100001", 27 => "1101000000", 
    28 => "1110001100", 29 => "1100101001", 30 => "1111011110", 31 => "1111100111");



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

