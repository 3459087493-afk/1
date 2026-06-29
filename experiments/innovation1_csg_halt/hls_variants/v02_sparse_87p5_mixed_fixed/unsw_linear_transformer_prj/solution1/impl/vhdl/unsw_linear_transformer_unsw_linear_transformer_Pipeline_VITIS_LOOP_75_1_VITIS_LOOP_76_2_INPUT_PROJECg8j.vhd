-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_INPUT_PROJECg8j is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_INPUT_PROJECg8j is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101111100111010011010010011", 1 => "10111101011111100111100000011101", 2 => "10111011101000101111101010101100", 3 => "10111110011011010101000001110101", 
    4 => "10111100101011110111111001101110", 5 => "10111110001111101000001011001101", 6 => "00111101101001101100101101000001", 7 => "00111101110111010010100100100110", 
    8 => "00111101011001011000010001100000", 9 => "10111110010001010010000001011001", 10 => "10111110011110000110111010001000", 11 => "10111101011001101000101111010011", 
    12 => "10111110011101000110101100111101", 13 => "00111101011001000000111001110100", 14 => "10111101101110101101010001001010", 15 => "00111110011100000001100100011011");



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

