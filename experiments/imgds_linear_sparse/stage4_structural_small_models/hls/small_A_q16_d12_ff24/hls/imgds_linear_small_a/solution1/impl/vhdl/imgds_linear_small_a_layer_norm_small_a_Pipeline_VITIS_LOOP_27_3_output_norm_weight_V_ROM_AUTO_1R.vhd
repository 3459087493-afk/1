-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity imgds_linear_small_a_layer_norm_small_a_Pipeline_VITIS_LOOP_27_3_output_norm_weight_V_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 11; 
             AddressWidth     : integer := 4; 
             AddressRange    : integer := 12
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of imgds_linear_small_a_layer_norm_small_a_Pipeline_VITIS_LOOP_27_3_output_norm_weight_V_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "10000001010", 1 => "01111011010", 2 => "10000001110", 3 => "10100000111", 
    4 => "10010010101", 5 => "10011010001", 6 => "10000010001", 7 => "10101110100", 
    8 => "10101010100", 9 => "10010101111", 10 => "10001101100", 11 => "10011100110");



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

