-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_tiny_linear_attention_tiny_Pipeline_VITIS_LOOP_48_3_layers_0_attention_key_weight_dEe is 
    generic(
             DataWidth     : integer := 11; 
             AddressWidth     : integer := 6; 
             AddressRange    : integer := 36
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of imgds_linear_tiny_linear_attention_tiny_Pipeline_VITIS_LOOP_48_3_layers_0_attention_key_weight_dEe is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "11011010001", 1 => "10101101001", 2 => "11001111001", 3 => "01000100001", 
    4 => "11011001101", 5 => "11011101000", 6 => "11110011100", 7 => "11111111110", 
    8 => "11010011101", 9 => "00110101101", 10 => "00011101000", 11 => "00011111001", 
    12 => "10101110011", 13 => "01000000110", 14 => "01000010010", 15 => "00101000011", 
    16 => "00100111011", 17 => "11000100011", 18 => "00010010011", 19 => "00111111011", 
    20 => "00111010110", 21 => "00001010110", 22 => "10011110011", 23 => "11010110000", 
    24 => "10110001110", 25 => "01000100001", 26 => "00000100001", 27 => "11110100001", 
    28 => "10011001100", 29 => "10101011110", 30 => "11001111110", 31 => "00010100000", 
    32 => "00000000001", 33 => "00111110110", 34 => "01001111100", 35 => "11000010000");



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

