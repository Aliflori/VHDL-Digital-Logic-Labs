library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity experiment_2_2 is
    Port ( CLK : in  STD_LOGIC;
           DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           SEG_SEL : out  STD_LOGIC_VECTOR (3 downto 0);
           SEG_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end experiment_2_2;

architecture Behavioral of experiment_2_2 is

	 signal digit_select : STD_LOGIC := '0';
    signal digit_ones : STD_LOGIC_VECTOR(3 downto 0);
    signal digit_tens : STD_LOGIC_VECTOR(3 downto 0);
    signal digit_out : STD_LOGIC_VECTOR(3 downto 0);
begin
    digit_ones <= DATA_IN(3 downto 0);
    digit_tens <= DATA_IN(7 downto 4);

    process(CLK)
    begin
        if rising_edge(CLK) then
            if digit_select = '0' then
                SEG_SEL <= "0001";
                digit_out <= digit_ones;
                digit_select <= '1';
            else
                SEG_SEL <= "0010";
                digit_out<= digit_tens;
                digit_select <= '0';
            end if;
        end if;
    end process;
	 
	 WITH digit_out SELECT
	 SEG_OUT <= "11000000" WHEN "0000" ,
				"11111001" WHEN "0001" ,
				"10100100" WHEN "0010" ,
				"10110000" WHEN "0011" ,
				"10011001" WHEN "0100" ,
				"10010010" WHEN "0101" ,
				"10000010" WHEN "0110" ,
				"11111000" WHEN "0111" ,
				"10000000" WHEN "1000" ,
				"10010000" WHEN "1001" ,
				"10001000" WHEN "1010" ,
				"10000011" WHEN "1011" ,
				"11100110" WHEN "1100" ,
				"10100001" WHEN "1101" ,
				"10000110" WHEN "1110" ,
				"10001110" WHEN "1111" ,
				"00000000" WHEN others ;

end Behavioral;

