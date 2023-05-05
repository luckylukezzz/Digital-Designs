----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 06:45:21 PM
-- Design Name: 
-- Module Name: LUT_16_7_Sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_16_7_Sim is
--  Port ( );
end LUT_16_7_Sim;

architecture Behavioral of LUT_16_7_Sim is
component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

SIGNAL address :STD_LOGIC_VECTOR (3 downto 0);
SIGNAL data :STD_LOGIC_VECTOR (6 downto 0);

begin
 UUT: LUT_16_7 PORT MAP(
       address=>address,
       data=>data
       );


process
            begin
                address <= "0111";
             wait for 100ns;        
                address <= "1110";
            WAIT FOR 100 ns;
                address <= "0101";
            wait  for 100ns;
                address <= "0011";
            wait  for 100ns;
                address <= "1111";
            wait  for 100ns;
                address <= "0001";
            wait  for 100ns;
                address <= "0000";
            wait  for 100ns;
                address <= "1010";
           
        WAIT; 
  
      end process;
end Behavioral;