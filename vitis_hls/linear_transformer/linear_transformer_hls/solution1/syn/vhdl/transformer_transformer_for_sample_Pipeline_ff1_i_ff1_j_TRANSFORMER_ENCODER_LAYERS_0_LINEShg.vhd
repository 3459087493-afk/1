-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEShg is 
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


architecture rtl of transformer_transformer_for_sample_Pipeline_ff1_i_ff1_j_TRANSFORMER_ENCODER_LAYERS_0_LINEShg is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111111011010101000000100110100", 1 => "00111111011110101110000111001110", 2 => "00111111100110010001000011011100", 3 => "00111110111010101000101110110001", 
    4 => "00111111000011100010000110000110", 5 => "00111111000001000011010010110001", 6 => "00111111001110101101100011110101", 7 => "00111111000101101010001010110001", 
    8 => "00111110100011110100101111101000", 9 => "00111110111001101101101011101100", 10 => "01000000000000101100010111011111", 11 => "00111110101110010001011000000001", 
    12 => "00111110110011111110000010001011", 13 => "00111111001101010101011111001101", 14 => "00111111100000111111001111100000", 15 => "00111111100101001101010101111100");



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

