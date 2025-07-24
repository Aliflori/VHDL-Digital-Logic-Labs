library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MatrixKey_TB is
--  Port ( );
end MatrixKey_TB;

architecture DF of MatrixKey_TB is

    signal Column   : std_logic_vector(1 to 4) := (others => '1');
    signal CLK      : std_logic := '0';
    signal Row      : std_logic_vector(1 to 4);
    signal Hit      : std_logic;
    signal Output   : std_logic_vector(3 downto 0);
    constant Period : time := 0.5 ms;

begin
    DUT: entity work.MatrixKey port map(Column, CLK, Row, Hit, Output);
    CLK    <= not CLK after (Period/2);
    Column <= "1111", "1011" after (1.15*Period), "1111" after (1.5*Period + 10 us), "1011" after (3.5*Period + 10 us), "1111" after (4.5*Period + 10 us);
end DF;