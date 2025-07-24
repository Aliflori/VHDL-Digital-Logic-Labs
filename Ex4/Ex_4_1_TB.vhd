library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ex_4_1_TB is
--  Port ( );
end Ex_4_1_TB;

architecture DF of Ex_4_1_TB is

signal PS2_CLK, PS2_data : std_logic := '0';
signal PS2_code_new      : std_logic;
signal PS2_code          : std_logic_vector(7 downto 0);

begin

UUT: Entity work.Ex_4_1 port map(PS2_CLK, PS2_data, PS2_code_new, PS2_code);

PS2_CLK  <= not PS2_CLK after 10 ns;
PS2_data <= '0', '1' after 70 ns, '0' after 150 ns, '1' after 190 ns;

end DF;
