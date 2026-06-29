-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEMgi is 
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


architecture rtl of transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEMgi is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110101011000110100111010111", 1 => "10111111111010110111000101100101", 2 => "10111111100111101100001010111101", 3 => "10111110011110100010011101101011", 
    4 => "10111111011110101100100101101101", 5 => "11000000001000111000000010011101", 6 => "10111111001111111110011110110000", 7 => "10111111100100010101001111011111", 
    8 => "10111111101001010111010101100100", 9 => "10111111001100101111010000010111", 10 => "10111111000110000011011000010001", 11 => "10111111110110010101100100000100", 
    12 => "10111111011101111010101011001110", 13 => "11000000000001110111011101001111", 14 => "10111111011110001111011110101001", 15 => "11000000000001000111101100000111");



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

