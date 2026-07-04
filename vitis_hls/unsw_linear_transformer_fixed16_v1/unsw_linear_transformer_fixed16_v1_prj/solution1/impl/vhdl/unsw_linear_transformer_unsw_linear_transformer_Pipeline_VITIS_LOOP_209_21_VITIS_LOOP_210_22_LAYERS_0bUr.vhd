-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bUr is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_LAYERS_0bUr is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "1100011101", 1 => "1110100001", 2 => "0010010000", 3 => "0000101110", 
    4 => "0001100010", 5 => "1110001011", 6 => "1111001101", 7 => "0001111001", 
    8 => "0000001100", 9 => "0001100000", 10 => "1110101101", 11 => "1010110100", 
    12 => "0010001001", 13 => "0000101110", 14 => "1110101110", 15 => "1110100010", 
    16 => "0000000111", 17 => "0000110011", 18 => "1111110111", 19 => "1101000001", 
    20 => "0001100001", 21 => "1111000110", 22 => "0000111000", 23 => "1111100100", 
    24 => "1111101110", 25 => "1111011010", 26 => "0001101001", 27 => "0010101000", 
    28 => "0010011010", 29 => "1111100001", 30 => "1101001111", 31 => "0000001111");



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

