-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_99_4_VITIS_LOOP_100_5_LAYERS_0_AT7jG is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_99_4_VITIS_LOOP_100_5_LAYERS_0_AT7jG is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111101000110111111110100101000", 1 => "10111011011100101010101000011100", 2 => "10111110100010100100000111000000", 3 => "00111100111010010100011100111000", 
    4 => "10111110100011000111100010111100", 5 => "10111110101001110000001110011101", 6 => "10111110101000001111011001111011", 7 => "10111101011101110010001010100101", 
    8 => "00111101000000100100001111000000", 9 => "10111011000010101100101101010001", 10 => "00111110001101101111001110100000", 11 => "00111011111110110001001111011000", 
    12 => "00111110100111111000001011110100", 13 => "00111101010100101011000101011101", 14 => "00111100111011110010100010001001", 15 => "10111110110101011010011001000000");



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

