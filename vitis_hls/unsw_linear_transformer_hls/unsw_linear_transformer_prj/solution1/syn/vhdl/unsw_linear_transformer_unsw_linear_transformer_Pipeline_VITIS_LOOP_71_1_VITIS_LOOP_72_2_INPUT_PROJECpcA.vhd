-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECpcA is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_71_1_VITIS_LOOP_72_2_INPUT_PROJECpcA is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101010000010101111111010000", 1 => "00111110010010001010010010001011", 2 => "10111110100000010100011111110010", 3 => "10111110000011100011010010001111", 
    4 => "10111110000010110111111110110010", 5 => "10111101110111001010001101011011", 6 => "00111100111000000000011000100100", 7 => "00111110011001011110111011000111", 
    8 => "10111110001111101011100010100011", 9 => "10111110000010111100011000101101", 10 => "10111110100011000010111100011101", 11 => "10111101110111100111100001110100", 
    12 => "10111101001010000001101000100001", 13 => "10111110110111111001111111110010", 14 => "00111110010111111100100011000010", 15 => "10111110100010010000001010000010");



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

