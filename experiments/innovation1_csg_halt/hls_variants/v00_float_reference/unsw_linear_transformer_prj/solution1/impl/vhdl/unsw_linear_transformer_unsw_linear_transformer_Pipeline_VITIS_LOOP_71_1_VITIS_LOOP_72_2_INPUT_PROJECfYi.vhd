-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECfYi is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECfYi is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110011001110111101011110001", 1 => "10111110000111110111101001110011", 2 => "10111110000110100011000110100110", 3 => "10111110100001111110110111111110", 
    4 => "10111110000100010000101001011111", 5 => "10111110111001011100011001110100", 6 => "00111101011110010100100101101101", 7 => "00111101000100100000110000001000", 
    8 => "10111101011010111111100001000110", 9 => "00111101111010111111001101100011", 10 => "00111101110110100111101001000011", 11 => "10111110010101010110111010000111", 
    12 => "00111100011010111010110011100101", 13 => "10111101101001010011100011001000", 14 => "10111101111101000000101101110011", 15 => "10111101001100100011000101000010");



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

