-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEPgM is 
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


architecture rtl of transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEPgM is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110110100101010010101000000", 1 => "00111111101100000101111111100001", 2 => "10111101011111000111000111010110", 3 => "10111111111001100110101000100011", 
    4 => "00111111000001011101011111001011", 5 => "10111110010111111010011011011111", 6 => "00111110000100110000011111110010", 7 => "00111111011000010101010011101011", 
    8 => "00111110000000110011010111010010", 9 => "00111100110001101101000111100001", 10 => "00111100111100101000100001001000", 11 => "10111110101101001110000000010001", 
    12 => "00111110101101011000001010011001", 13 => "00111111010101110000100111001000", 14 => "00111110001000001100000000100111", 15 => "00111101011111110010001011000000");



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

