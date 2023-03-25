----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 04:27:14 PM
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is

COMPONENT Decoder_3_to_8
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
 EN : in STD_LOGIC;
 Y : out STD_LOGIC_VECTOR (7 downto 0));
 END COMPONENT;
 
 signal I :  STD_LOGIC_VECTOR (2 downto 0);
  signal Y : STD_LOGIC_VECTOR (7 downto 0);
  signal EN : STD_LOGIC;

begin

UUT: Decoder_3_to_8 PORT MAP(

I=>I,
Y =>Y,
EN => EN

 );

process
 begin
 I(0) <= '1'; -- set initial values
 I(1) <= '1';
 I(2)<= '1';
 EN<='1';
 WAIT FOR 100 ns; -- after 100 ns change inputs
 I(0) <= '0'; -- set initial values
 I(1) <= '0';
 I(2)<= '1';
 WAIT FOR 100 ns; --change again
 I(0) <= '0'; -- set initial values
 I(1) <= '1';
 I(2)<= '0';
 WAIT FOR 100 ns; --change again
  I(0) <= '1'; -- set initial values
 I(1) <= '1';
 I(2)<= '0';
 WAIT FOR 100 ns; --change again
  I(0) <= '0'; -- set initial values
 I(1) <= '1';
 I(2)<= '1';

wait;

end process;
end Behavioral;
