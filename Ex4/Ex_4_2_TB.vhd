library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ex_4_2_TB is
--  Port ( );
end Ex_4_2_TB;

architecture DF of Ex_4_2_TB is

signal CLK  : STD_LOGIC                    := '0';
signal Din  : STD_LOGIC_VECTOR(7 downto 0);
signal COM  : STD_LOGIC_VECTOR(3 downto 0);
signal Dout : STD_LOGIC_VECTOR(7 downto 0); 

begin

UUT: entity work.Ex_4_2 port map(CLK, Din, COM, Dout);

CLK <= not CLK after 0.33 sec;
Din <= b"1000_0110";

end DF;