-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bIp is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bIp is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "1011110010", 1 => "1010011110", 2 => "0001101001", 3 => "0001111001", 
    4 => "1111101001", 5 => "0010001101", 6 => "1111110001", 7 => "1110111010", 
    8 => "0000000100", 9 => "0000000101", 10 => "0010011101", 11 => "0000010001", 
    12 => "1111000010", 13 => "1111011001", 14 => "0101010011", 15 => "0000100010", 
    16 => "0001011111", 17 => "1111010011", 18 => "1111110011", 19 => "0001111101", 
    20 => "0001010001", 21 => "1110010000", 22 => "1111010010", 23 => "0001100111", 
    24 => "0001100100", 25 => "1101101100", 26 => "1011001111", 27 => "0000111111", 
    28 => "1111011011", 29 => "0001010000", 30 => "0001011000", 31 => "0001111111");



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

