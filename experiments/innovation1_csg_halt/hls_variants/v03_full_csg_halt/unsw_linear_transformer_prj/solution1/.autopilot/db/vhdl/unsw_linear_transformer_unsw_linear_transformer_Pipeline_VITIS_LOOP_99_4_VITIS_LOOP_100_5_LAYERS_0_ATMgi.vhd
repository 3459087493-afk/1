-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_99_4_VITIS_LOOP_100_5_LAYERS_0_ATMgi is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_99_4_VITIS_LOOP_100_5_LAYERS_0_ATMgi is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111110100011110101101101010101", 1 => "10111101010000110111001111110011", 2 => "00111100000001000010110010011100", 3 => "10111110000101001010111010001001", 
    4 => "00111110001111111000110001000010", 5 => "10111110010111001001100100011110", 6 => "10111101101100110101100101100001", 7 => "10111110110011011011111101001001", 
    8 => "10111101001000000001100110100001", 9 => "10111110110010110100111010110011", 10 => "00111101111111001100111110000011", 11 => "10111101011001110001011100010110", 
    12 => "10111110100010010011110001111101", 13 => "00111110001100110101101100000011", 14 => "00111110101001100111100101000100", 15 => "10111110100011001111100111010010");



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

