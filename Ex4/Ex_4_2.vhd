library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_textio.ALL;
use std.textio.all;

entity Ex_4_2 is

	Port (CLK  : in     STD_LOGIC;
		  Din  : in     STD_LOGIC_VECTOR(7 downto 0);
		  COM  : buffer STD_LOGIC_VECTOR(3 downto 0) := "0001";
		  Dout : out    STD_LOGIC_VECTOR(7 downto 0));

end entity;


architecture Behavioral of Ex_4_2 is

    signal temp     : STD_LOGIC_VECTOR(3 downto 0);
	type memory_t is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
	impure function init_RAM (input : string) return memory_t is 
	
		file my_file          : text open read_mode is input;
		variable current_line : line;
		variable RAM          : memory_t;
		variable OK          : boolean;
		
	begin

		for i in memory_t'range loop
            readline(my_file, current_line);
            hread(current_line, RAM(i),OK);
            assert OK
            report "Read 'RAM' failed for line: " & current_line.all
            severity failure;                                   
		end loop;
		file_close(my_file);
        return RAM;
	end function;
	
	signal RAM : memory_t := init_RAM("C:\Users\Ali\Desktop\Ex_4_3\7seg.txt"); 

begin

	process(CLK)

	begin

		if (CLK'event and CLK = '1') then
			if (COM = "0010") then
				COM  <= "0001";
				temp <= Din(3 downto 0);
			elsif (COM = "0001") then
				COM  <= "0010";
				temp <= Din(7 downto 4);
			end if;
		end if;

	end process;

    Dout <= RAM(conv_integer(temp));

end architecture;

