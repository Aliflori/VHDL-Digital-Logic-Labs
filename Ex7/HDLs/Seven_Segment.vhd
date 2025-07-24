library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity Seven_Segment is

   Port(Din  : in  STD_LOGIC_VECTOR (3 downto 0);
        CLK, Hit  : in  STD_LOGIC;
		COM  : buffer STD_LOGIC_VECTOR(1 downto 0) := "01";
        Dout : out STD_LOGIC_VECTOR (7 downto 0));
        
end Seven_Segment;

architecture BHV of Seven_Segment is
    signal temp_Byte   : STD_LOGIC_VECTOR(7 downto 0);
    signal temp_Nibble : STD_LOGIC_VECTOR(3 downto 0);
    signal temp_Dout   : STD_LOGIC_VECTOR (7 downto 0);
    
	type memory1_t is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    signal BIN2BCD : memory1_t := (  
    b"0000_0000", -- BCD for 0  
    b"0000_0001", -- BCD for 1  
    b"0000_0010", -- BCD for 2  
    b"0000_0011", -- BCD for 3  
    b"0000_0100", -- BCD for 4  
    b"0000_0101", -- BCD for 5  
    b"0000_0110", -- BCD for 6  
    b"0000_0111", -- BCD for 7  
    b"0000_1000", -- BCD for 8  
    b"0000_1001", -- BCD for 9  
    b"0001_0000", -- BCD for 10  
    b"0001_0001", -- BCD for 11  
    b"0001_0010", -- BCD for 12  
    b"0001_0011", -- BCD for 13  
    b"0001_0100", -- BCD for 14  
    b"0001_0101"  -- BCD for 15  
    );
    
    type memory2_t is array (0 to 9) of STD_LOGIC_VECTOR(7 downto 0);
    signal BCD2Segments : memory2_t := (
    "11000000", -- BCD for 0
    "11111001", -- BCD for 1
    "10100100", -- BCD for 2
    "10110000", -- BCD for 3
    "10011001", -- BCD for 4
    "10010010", -- BCD for 5
    "10000010", -- BCD for 6
    "11111000", -- BCD for 7
    "10000000", -- BCD for 8
    "10010000"  -- BCD for 9
);

begin

    temp_Byte <= BIN2BCD(conv_integer(Din));

	process(CLK)
	begin
		if (CLK'event and CLK = '1') then
			if (COM = "10" or COM = "00") then
				COM  <= "01";
				temp_Nibble <= temp_Byte(3 downto 0);
			elsif (COM = "01") then
				if (Din > 9) then 
				    COM <= "10";
				else
				    COM <= "00";    
				end if;
				temp_Nibble <= temp_Byte(7 downto 4);
			end if;
		end if;
	end process;

    temp_Dout <= BCD2Segments(conv_integer(temp_Nibble));
    
    Dout <= "10111111" when Hit='0' else temp_Dout;
            
end BHV;