-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEOgC is 
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


architecture rtl of transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEOgC is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111111100110110110111110111001", 1 => "10111111111110010110010011101001", 2 => "10111111101101100100001001001010", 3 => "10111111001011001011100010111111", 
    4 => "10111111001011111010111010001010", 5 => "10111111101111000011010101001000", 6 => "10111110110110101100111101010011", 7 => "00111110100010011000110110101100", 
    8 => "10111111000001100100111110000111", 9 => "10111111001000111110110101100011", 10 => "11000000000000101010110000000100", 11 => "10111111000110001001101111111010", 
    12 => "10111111011001111101110011110000", 13 => "10111111110101100011001001011101", 14 => "10111111100100000011000000000001", 15 => "10111110100100100111100011110010");



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

