-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0cpw is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23_LAYERS_0cpw is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110001001111110101011100111", 1 => "10111100101101111101111101100110", 2 => "00111101110011011110000011000100", 3 => "10111110000111010100000111101001", 
    4 => "00111101110110011110101100110001", 5 => "10111110010010101000001011110101", 6 => "00111110010100001000111011100101", 7 => "00111110010111101010100010110001", 
    8 => "10111101101111110000011110001100", 9 => "10111110001011010100101001110100", 10 => "10111101001101110010100000000101", 11 => "10111101110001101010011010100110", 
    12 => "00111101011010001011000011101111", 13 => "10111110000001001000000111101111", 14 => "00111100110110101101110010111111", 15 => "10111011001100011000100101000111");



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

