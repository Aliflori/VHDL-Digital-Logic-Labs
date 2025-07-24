library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;


entity Seven_Segment_TB is

end entity;

architecture DF of Seven_Segment_TB is

signal inDigit   :  STD_LOGIC_VECTOR (3 downto 0);
signal inSelect  :  STD_LOGIC_VECTOR (3 downto 0);
signal outSelect :  STD_LOGIC_VECTOR (3 downto 0);
signal out7Seg   :  STD_LOGIC_VECTOR (7 downto 0);

constant period : time := 20 ns;

begin

UUT: entity work.Seven_Segment port map(inDigit, inSelect, outSelect, out7Seg);

--inSelect <= "0101", "0110" after 5 sec, "1000" after 10 sec;
--inDigit  <= "0000", "0101" after 2 sec, "1001" after 4 sec, "1101" after 6 sec;

process
begin

inSelect <= "0101";
wait for 10 ns;

inSelect <= "0101";
wait for 50 ns;
wait;
end process;

end  architecture;