----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 03:12:43 PM
-- Design Name: 
-- Module Name: AU_Sim - Behavioral
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

entity AU_Sim is
--  Port ( );
end AU_Sim;

architecture Behavioral of AU_Sim is
component AU 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end component;
SIGNAL RegSel,Zero,Carry : std_logic;
SIGNAL A,S :STD_LOGIC_VECTOR (3 downto 0);
signal Clk : std_logic :='0';

begin
 UUT: AU PORT MAP(
       A=>A,
       RegSel=>RegSel,
       S=>S,
       Zero=>Zero,
       Clk => Clk,
       Carry => Carry);
Clk <= not clk after 3ns;       
 process
            begin
                RegSel <= '1';
                A <= "1111";
             wait for 100ns;
                RegSel <= '0';
                A <= "1001";
            WAIT FOR 100 ns;
                A <= "0001";
            wait  for 100ns;
                A <= "1000";
            wait  for 100ns;
                 <= "1100";
            wait  for 100ns;
                A <= "1011";
            wait  for 100ns;
                A <= "1010";
            wait  for 100ns;
                A <= "1111";
        
          WAIT; 
  
      end process;

end Behavioral;
