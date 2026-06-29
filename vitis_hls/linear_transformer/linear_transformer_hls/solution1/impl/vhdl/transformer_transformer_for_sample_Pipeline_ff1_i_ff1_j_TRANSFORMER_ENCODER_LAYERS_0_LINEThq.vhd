-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEThq is 
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


architecture rtl of transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEThq is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111111100101100101001001100001", 1 => "10111111111011110111001001010000", 2 => "11000000100110011001000001100010", 3 => "10111111001001010010101000001111", 
    4 => "10111111100101000100110111110100", 5 => "11000000001011101110010110010111", 6 => "00111101100001110010110100011011", 7 => "10111111100010111101010111010100", 
    8 => "10111111001011001011111110100001", 9 => "10111111011000010100100111101001", 10 => "11000000010100011110011000111010", 11 => "10111111111000101100111100101001", 
    12 => "10111111010010110001010011111101", 13 => "11000000101000010100010111001000", 14 => "10111111000001111110110101000010", 15 => "11000000011010011111111110110101");



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

