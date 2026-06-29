-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECvdy is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECvdy is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110001100000101111010011011", 1 => "00111110001100111111111111010100", 2 => "00111101001011010001110010110101", 3 => "10111101110110100101111110001110", 
    4 => "00111011001100110011010100010110", 5 => "00111101111001010010101110100000", 6 => "10111100001010011111110100011000", 7 => "00111101001010110001100101000111", 
    8 => "00111101100011011000010100010111", 9 => "10111101110011011010001000111010", 10 => "00111101100000011011010111011001", 11 => "10111101011001001001000010000010", 
    12 => "00111110001111000101011101010000", 13 => "00111101101001001011101100011001", 14 => "00111110010101110100001100100001", 15 => "10111110011111010111101011001110");



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

