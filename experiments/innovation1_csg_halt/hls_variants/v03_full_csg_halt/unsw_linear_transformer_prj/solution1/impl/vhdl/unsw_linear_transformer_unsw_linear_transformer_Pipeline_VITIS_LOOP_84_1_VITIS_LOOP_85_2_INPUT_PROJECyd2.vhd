-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_84_1_VITIS_LOOP_85_2_INPUT_PROJECyd2 is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_84_1_VITIS_LOOP_85_2_INPUT_PROJECyd2 is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101011001101101100100110101", 1 => "00111101100111001000110111100111", 2 => "00111110000100010111011000000001", 3 => "10111110011000001000100001110011", 
    4 => "00111101001011011111010111100111", 5 => "00111100111011101001101100100010", 6 => "10111110001011001010011110110010", 7 => "00111011010101100101111111101000", 
    8 => "10111101101000000001101010010101", 9 => "10111101000010110111110100001011", 10 => "00111101001101010100011101110110", 11 => "00111100010110111000111110010001", 
    12 => "00111110000001011010011000000010", 13 => "10111101010000110001110111000100", 14 => "10111110001101000010100001010011", 15 => "00111100101110010001011001001101");



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

