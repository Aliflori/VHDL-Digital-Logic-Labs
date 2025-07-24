
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MatrixKey is
	port ( Column  : in  std_logic_vector(1 to 4) := (others => '1');
		   CLK     : in  std_logic;
		   Row     : out std_logic_vector(1 to 4)     := (others => '0');
		   Hit     : out std_logic                    := ('0');
		   Output  : out std_logic_vector(3 downto 0) := (others => '0'));
end MatrixKey;
 
architecture BHV of MatrixKey is
    type state_t is (Check, Row1, Row2, Row3, Row4);
    signal State : state_t := Check;
begin
	STATE_MEMORY: process(CLK)
	begin
		if (CLK'event and CLK='1') then
    		case State is
			when Check => 
				if (Column="1111") then 
					Hit <= '0'; State <= Check; 
				else 
				    Row <= (1 => '0', others => 'Z'); State <= Row1;				    
				end if;
			when Row1  => 
				if (Column="1111") then 
					Row <= (2 => '0', others => 'Z'); State <= Row2;
				else 
					Hit <= '1'; Row <= (others => '0'); State <= Check;
					if    (Column(1)='0') then Output <= x"0";
					elsif (Column(2)='0') then Output <= x"1";
					elsif (Column(3)='0') then Output <= x"2";
					else   					   Output <= x"3";
					end if;				  
				end if;
			when Row2  => 
				if (Column="1111") then 
					Row <= (3 => '0', others => 'Z'); State <= Row3;
				else 
					Hit <= '1'; Row <= (others => '0'); State <= Check;
					if    (Column(1)='0') then Output <= x"4";
					elsif (Column(2)='0') then Output <= x"5";
					elsif (Column(3)='0') then Output <= x"6";
					else   					   Output <= x"7";
					end if;				  
				end if;					
			when Row3  =>
				if (Column="1111") then 
					Row <= (4 => '0', others => 'Z'); State <= Row4;
				else 
					Hit <= '1'; Row <= (others => '0'); State <= Check;
					if    (Column(1)='0') then Output <= x"8";
					elsif (Column(2)='0') then Output <= x"9";
					elsif (Column(3)='0') then Output <= x"A";
					else 					   Output <= x"B";
					end if;				  
				end if;			 	
			when Row4  => 
					Hit <= '1'; Row <= (others => '0'); State <= Check;
					if    (Column(1)='0') then Output <= x"C";
					elsif (Column(2)='0') then Output <= x"D";
					elsif (Column(3)='0') then Output <= x"E";
					else 					   Output <= x"F";
					end if;
			when others =>	State <= Check;	
        end case;
		end if;
	end process STATE_MEMORY;
end architecture BHV;