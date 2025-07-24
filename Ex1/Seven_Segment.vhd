library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seven_Segment is

   Port(inDigit   : in  STD_LOGIC_VECTOR (3 downto 0);
        inSelect  : in  STD_LOGIC_VECTOR (3 downto 0);
        outSelect : out STD_LOGIC_VECTOR (3 downto 0);
        out7Seg   : out STD_LOGIC_VECTOR (7 downto 0));
        
end Seven_Segment;

architecture DataFlow of Seven_Segment is

begin

outSelect <= inSelect;

with inDigit select
    out7Seg <= X"C0"   when "0000",  -- 0
               X"F9"   when "0001",  -- 1
               X"A4"   when "0010",  -- 2
               X"B0"   when "0011",  -- 3
               X"99"   when "0100",  -- 4
               X"92"   when "0101",  -- 5
               X"82"   when "0110",  -- 6
               X"F8"   when "0111",  -- 7
               X"80"   when "1000",  -- 8
               X"90"   when "1001",  -- 9
               X"88"   when "1010",  -- A
               X"83"   when "1011",  -- b
               X"C6"   when "1100",  -- C
               X"A1"   when "1101",  -- d
               X"86"   when "1110",  -- E
               X"8E"   when "1111",  -- F
               X"FF"   when others;  -- Default: all segments off (invalid input)

end DataFlow;