----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 01:43:20 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is
component RCA_4
        port 
            ( A0 : in STD_LOGIC;
             A1 : in STD_LOGIC;
             A2 : in STD_LOGIC;
             A3 : in STD_LOGIC;
             B0 : in STD_LOGIC;
             B1 : in STD_LOGIC;
             B2 : in STD_LOGIC;
             B3 : in STD_LOGIC;
             C_in : in STD_LOGIC;
             S0 : out STD_LOGIC;
             S1 : out STD_LOGIC;
             S2 : out STD_LOGIC;
             S3 : out STD_LOGIC;
             C_out : out STD_LOGIC);
    end component; 
component Reg 
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               Clk : in STD_LOGIC;
               En : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal Q_B,Q_A,S1:std_logic_vector(3 downto 0);
signal en1,slw:std_logic;

begin
    slowclk:Slow_Clk
    port map(
        Clk_in=> Clk,
        Clk_out=> slw);
    RegA : Reg
        port map ( 
        D => A, 
        En=>RegSel,
        Clk => slw, 
        Q => Q_A);
     RegB : Reg
        port map ( 
        D => A, 
        En=>en1,
        Clk => slw, 
        Q => Q_B);
         
    RCA_40 : RCA_4
        port map (
            A0 =>Q_A(0),
            A1 =>Q_A(1),
            A2 =>Q_A(2),
            A3 =>Q_A(3),
            B0 =>Q_B(0),
            B1 =>Q_B(1),
            B2 =>Q_B(2),
            B3 =>Q_B(3),
            C_in =>'0',
            S0 =>S1(0),
            S1 =>S1(1),
            S2 =>S1(2),
            S3 =>S1(3),
            C_out => carry);
    en1 <= not(RegSel);
    Zero <= not( S1(0) or S1(1) or S1(2) or S1(3) ); 
    S(0) <= S1(0); 
    S(1) <= S1(1);
    S(2) <= S1(2);  
    S(3) <= S1(3);             
end Behavioral;
