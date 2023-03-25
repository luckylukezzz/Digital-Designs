----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 05:09:47 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

    component Decoder_3_to_8
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
                EN : in STD_LOGIC;
                Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
 
    signal Y0 : STD_LOGIC_VECTOR (7 downto 0);


begin
   Decoder_3_to_8_0:Decoder_3_to_8
   port map(
    I=>S,
    EN=>EN,
    Y=>Y0);


Y<=( Y0(0) and D(0) ) or ( Y0(1) and D(1) ) or ( Y0(2) and D(2) ) or ( Y0(3) and D(3) ) or ( Y0(4) and D(4) ) or ( Y0(5) and D(5) ) or ( Y0(6) and D(6) ) or ( Y0(7) and D(7) ) ;
end Behavioral;
