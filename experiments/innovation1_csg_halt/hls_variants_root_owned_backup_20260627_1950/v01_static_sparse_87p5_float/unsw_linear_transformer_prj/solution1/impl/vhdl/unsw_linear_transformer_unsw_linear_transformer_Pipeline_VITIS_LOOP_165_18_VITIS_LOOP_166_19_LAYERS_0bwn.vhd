-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_165_18_VITIS_LOOP_166_19_LAYERS_0bwn is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_165_18_VITIS_LOOP_166_19_LAYERS_0bwn is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110100011100110101001000101", 1 => "00111100011001110000001101000011", 2 => "10111101101011111011111100100001", 3 => "00111110101010111011001100010100", 
    4 => "00111110001100100000110101011110", 5 => "00111101111000011001111101111001", 6 => "00111101100101010011011100111111", 7 => "10111110010010111100011011010100", 
    8 => "10111101100101110011110011111011", 9 => "00111101110010101111010000001100", 10 => "00111101001011110110111010101001", 11 => "10111110100100110111101100101000", 
    12 => "00111110000010111111110111110101", 13 => "00111101101100000001000011010001", 14 => "00111110011010111011010000110111", 15 => "10111110011001100011101101110010");



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

