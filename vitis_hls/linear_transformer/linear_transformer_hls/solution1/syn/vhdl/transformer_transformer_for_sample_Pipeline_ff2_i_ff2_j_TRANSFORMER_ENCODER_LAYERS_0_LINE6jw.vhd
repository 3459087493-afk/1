-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE6jw is 
    generic(
             DataWidth     : integer := 32; 
             AddressWidth     : integer := 3; 
             AddressRange    : integer := 8
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE6jw is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101010000111000000110010101", 1 => "10111110101101010010000101010111", 2 => "10111110101100100110111001110110", 3 => "10111110101010010011110011001101", 
    4 => "10111110111111001000000010100110", 5 => "00111111000010000001001000000110", 6 => "00111110011001010101100000100001", 7 => "00111110110000110111011100111010");



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

