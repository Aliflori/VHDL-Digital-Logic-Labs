library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Freq_Div is
   generic ( n : integer := 25 * (10**6) );
    Port ( CLK_IN : in  STD_LOGIC;
           CLK_OUT : inout  STD_LOGIC:= '0' );
end entity;

architecture Behavioral of Freq_Div is
    signal count : INTEGER := 0;
   signal CLK : STD_LOGIC := '0';
    constant Div : INTEGER := n;
begin
    process(Clk_in)
    begin
        if rising_edge(Clk_in) then 
            count <= count + 1;  
            if count = (Div-1) then
        CLK <= NOT CLK;
            count <= 0;          
            end if;
        end if;
    end process;
   CLK_OUT <= CLK;

end Behavioral;