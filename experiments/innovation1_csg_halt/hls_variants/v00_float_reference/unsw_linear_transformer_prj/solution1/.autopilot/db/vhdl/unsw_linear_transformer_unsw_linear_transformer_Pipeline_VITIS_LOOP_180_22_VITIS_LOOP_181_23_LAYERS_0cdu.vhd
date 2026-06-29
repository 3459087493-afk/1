-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0cdu is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0cdu is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110000000001000111111101110", 1 => "10111101001110010000000000111101", 2 => "00111101000011010110010111010101", 3 => "00111110001000100100001111001011", 
    4 => "00111100111100101011111111100001", 5 => "00111110000111000010001101110000", 6 => "00111000101110101000011011011101", 7 => "10111101101011001010010110111011", 
    8 => "00111101010010011110101001001000", 9 => "00111101110001101110111010100000", 10 => "00111100111010101100100000101101", 11 => "00111101110111001101001011110100", 
    12 => "10111011001110010011101111010101", 13 => "10111101011000000000000100001100", 14 => "10111101100110100111111000110101", 15 => "10111101101010010011110000111110");



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

