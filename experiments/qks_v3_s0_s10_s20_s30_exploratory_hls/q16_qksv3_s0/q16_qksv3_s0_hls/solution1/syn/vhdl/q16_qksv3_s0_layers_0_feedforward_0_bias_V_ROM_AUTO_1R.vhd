-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity q16_qksv3_s0_layers_0_feedforward_0_bias_V_ROM_AUTO_1R is 
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


architecture rtl of q16_qksv3_s0_layers_0_feedforward_0_bias_V_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "0001011100", 1 => "1111100000", 2 => "1100000011", 3 => "0001011110", 
    4 => "1010100110", 5 => "0001101100", 6 => "0000001010", 7 => "0000110010", 
    8 => "0011001000", 9 => "0000010000", 10 => "1111100110", 11 => "1100110111", 
    12 => "1100110011", 13 => "0010001101", 14 => "0010111011", 15 => "1101111100", 
    16 => "0000110110", 17 => "1110101010", 18 => "0011001001", 19 => "1101111011", 
    20 => "0011000111", 21 => "0010000111", 22 => "0010011011", 23 => "0010010011", 
    24 => "0000111100", 25 => "0001010001", 26 => "1100100010", 27 => "1110110011", 
    28 => "1111000100", 29 => "0000101010", 30 => "1101110100", 31 => "0010100001");



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

