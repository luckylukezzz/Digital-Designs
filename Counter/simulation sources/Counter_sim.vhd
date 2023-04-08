----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2023 02:00:01 PM
-- Design Name: 
-- Module Name: Counter_sim - Behavioral
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


entity Counter_sim is
--  Port ( );
end Counter_sim;

architecture Behavioral of Counter_sim is
    component Counter
        Port ( Dir : in STD_LOGIC;
                Q :out STD_LOGIC_VECTOR  (2 downto 0);
                Res : in STD_LOGIC;
                Clk : in STD_LOGIC);
    end component;

 SIGNAL Dir,Res,Clk : std_logic;
 SIGNAL Q :STD_LOGIC_VECTOR(2 downto 0);

    
begin
    UUT: Counter PORT MAP(
        Q=>Q,
        Dir=>Dir,
        Res=>Res,
        Clk=>Clk
  );

  process
      begin
        Dir <= '0';
        Res <= '1';
        for i in 1 to 20 loop
          Clk <= '0';
          WAIT FOR 2 ns;
          Clk <= '1';
          WAIT FOR 2 ns;
        end loop;
        WAIT FOR 50 ns;
        Res <= '0';
        for i in 1 to 100 loop
          Clk <= '0';
          WAIT FOR 2 ns;
          Clk <= '1';
          WAIT FOR 2 ns;
        end loop;

        WAIT FOR 50 ns;
        Dir <= '1';
        for i in 1 to 100 loop
            Clk <= '0';
            WAIT FOR 2 ns;
            Clk <= '1';
            WAIT FOR 2 ns;
        end loop;
    WAIT; 
      
end process;
end Behavioral;