-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0cnw is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0cnw is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111110001101001001010011011000", 1 => "10111110101110111110100011100001", 2 => "00111101010000011001000011000011", 3 => "00111101110110001001111010110110", 
    4 => "00111110010010001101010100010100", 5 => "00111101001010011011100000001001", 6 => "10111101111010011010001111001100", 7 => "10111011110000001011011000111001", 
    8 => "10111110000010010001110011011011", 9 => "00111101101011110111101110001101", 10 => "00111101101000111100001110110111", 11 => "10111101011011110010100000000100", 
    12 => "10111101111001110001101101111011", 13 => "00111101011010001000100000101110", 14 => "00111011111110100101111100011001", 15 => "00111110001110101111011111101101");



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

