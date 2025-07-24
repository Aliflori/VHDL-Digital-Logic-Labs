
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity experiment_2_3 is
    Port ( CLK : in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
           UP_DOWN : in  STD_LOGIC;
           COUNTER_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end experiment_2_3;

architecture Behavioral of experiment_2_3 is

    signal counter : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	 
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if ENABLE = '1' then
                if UP_DOWN = '1' then
                    counter <= counter + 1;
                else
                    counter <= counter - 1;
                end if;
            end if;
        end if;
    end process;

    COUNTER_OUT <= counter;


end Behavioral;

