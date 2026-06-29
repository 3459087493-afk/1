-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATTbbk is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_86_4_VITIS_LOOP_87_5_LAYERS_0_ATTbbk is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10111011100001001011010000000010", 1 => "00111011111011000111001010101100", 2 => "10111011000001101100011111000001", 3 => "00111011000000001010110100100011", 
    4 => "00111100100010111010101101000010", 5 => "00111100010000001000101111110100", 6 => "10111101000111101110011000001010", 7 => "00111100100010010110000011110011", 
    8 => "00111100101101110010110111100100", 9 => "10111101010001100101000100110001", 10 => "00111011011101000111110011101001", 11 => "00111011000101111001111010101110", 
    12 => "00111011000000011100010001111101", 13 => "00111100111001011011110101001101", 14 => "00111100000011111100101100101101", 15 => "00111011010101100110100111101010");



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

