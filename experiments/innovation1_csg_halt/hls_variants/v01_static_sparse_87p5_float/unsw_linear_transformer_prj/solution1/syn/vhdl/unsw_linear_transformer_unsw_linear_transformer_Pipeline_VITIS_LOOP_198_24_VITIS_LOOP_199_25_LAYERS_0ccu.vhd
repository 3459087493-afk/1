-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0ccu is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_198_24_VITIS_LOOP_199_25_LAYERS_0ccu is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110010100010100101100000000", 1 => "10111110011011111001101101000000", 2 => "00111110000010011100010101010000", 3 => "10111101001001110001110010111100", 
    4 => "00111100101100000010000010010101", 5 => "10111110100100100000001110011001", 6 => "00111110011111011101100001010111", 7 => "00111110111110111011111100110100", 
    8 => "10111110000010111000101110101100", 9 => "10111101000000001101101101111011", 10 => "10111101010100001011110100111001", 11 => "10111110101010111110000011101100", 
    12 => "00111101110001010111110111010001", 13 => "10111110000100010000100010110011", 14 => "00111101110100100110111111001110", 15 => "10111101101000110100110110111101");



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

