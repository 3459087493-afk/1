-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity q16_qksv3_s30_layer_norm_Pipeline_VITIS_LOOP_47_3_output_norm_bias_V_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 8; 
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


architecture rtl of q16_qksv3_s30_layer_norm_Pipeline_VITIS_LOOP_47_3_output_norm_bias_V_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10101010", 1 => "10111010", 2 => "10010000", 3 => "10001110", 
    4 => "01010111", 5 => "01010010", 6 => "01010010", 7 => "10100100", 
    8 => "10101100", 9 => "01000000", 10 => "01011011", 11 => "10101000", 
    12 => "10111111", 13 => "10101010", 14 => "01010010", 15 => "01011001");



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

