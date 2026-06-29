-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_INPUT_PROJECtde is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_INPUT_PROJECtde is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111100011010010111000011101000", 1 => "00111101110000101011011001001011", 2 => "00111101001111001001010000111101", 3 => "00111100100011011010001011101111", 
    4 => "10111101110001000001010100101010", 5 => "10111101001000011010101111101100", 6 => "00111101110111111101111001101001", 7 => "00111100010011101101111110010111", 
    8 => "00111010001110110001001010111010", 9 => "00111101011011111100111011111000", 10 => "10111101110101111110001100110111", 11 => "10111100011100100000111000101010", 
    12 => "00111110000010011001010101100010", 13 => "00111011111000100010001000100001", 14 => "00111100111011001111111111111000", 15 => "10111010000001111010011000001001");



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

