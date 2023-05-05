----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 09:07:00 PM
-- Design Name: 
-- Module Name: AU_7_Seg_Sim - Behavioral
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

entity AU_7_Seg_Sim is
--  Port ( );
end AU_7_Seg_Sim;

architecture Behavioral of AU_7_Seg_Sim is

component AU_7_seg is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RegSel : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;
signal S_LED,A :  STD_LOGIC_VECTOR (3 downto 0);
signal S_7Seg :  STD_LOGIC_VECTOR (6 downto 0);
signal zero,RegSel,Carry :  STD_LOGIC;
signal Clk : std_logic :='0';

begin
 UUT: AU_7_seg PORT MAP(
       A=>A,
       RegSel=>RegSel,
       S_LED=>S_LED,
       S_7Seg => S_7Seg,
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
                A <= "1100";
            wait  for 100ns;
                A <= "1011";
            wait  for 100ns;
                A <= "1010";
            wait  for 100ns;
                A <= "1111";
        
          WAIT; 
  
      end process;
  

end Behavioral;
