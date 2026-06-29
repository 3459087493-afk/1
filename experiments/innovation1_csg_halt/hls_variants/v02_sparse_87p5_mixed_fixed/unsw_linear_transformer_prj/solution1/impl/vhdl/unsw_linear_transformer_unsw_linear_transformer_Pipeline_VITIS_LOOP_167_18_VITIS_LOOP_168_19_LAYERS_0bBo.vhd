-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_LAYERS_0bBo is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_LAYERS_0bBo is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110010010110011111010100010", 1 => "10111110001100010000000110111111", 2 => "00111100001011110101100101101001", 3 => "10111110001101010011010011001110", 
    4 => "10111100100111100111110011000001", 5 => "10111110010101001110101011101000", 6 => "10111110100111111100110010111010", 7 => "10111110000010001001010100011000", 
    8 => "00111100111111000111100011010111", 9 => "10111101110011100111011010010110", 10 => "10111101111010100110101111011000", 11 => "10111110001110010110011110000110", 
    12 => "00111100100111110110101010110011", 13 => "10111101011110111001110010011101", 14 => "10111110100111001000010100001000", 15 => "10111110011011000010100001110101");



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

