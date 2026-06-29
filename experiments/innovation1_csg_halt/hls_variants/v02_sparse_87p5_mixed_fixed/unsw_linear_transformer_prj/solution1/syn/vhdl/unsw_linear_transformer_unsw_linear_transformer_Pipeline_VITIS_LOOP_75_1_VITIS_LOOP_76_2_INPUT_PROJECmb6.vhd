-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_INPUT_PROJECmb6 is 
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


architecture rtl of unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_INPUT_PROJECmb6 is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "00111101111100010100110001111000", 1 => "00111110100000001110010100111000", 2 => "00111110100001110100111110100001", 3 => "00111101111101111001010100111110", 
    4 => "00111101100000001001011100110111", 5 => "00111110100001011001000010011110", 6 => "00111101100011001001111001011100", 7 => "10111101100001010101101100101010", 
    8 => "00111110110001100001101110010100", 9 => "10111101011100001110101111111010", 10 => "10111101100111010010101010111111", 11 => "00111101110010101111101001101101", 
    12 => "10111101111000011011101111000001", 13 => "00111110100111001011101001010001", 14 => "00111101100111110101001010111011", 15 => "00111101101001001111010101101110");



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

