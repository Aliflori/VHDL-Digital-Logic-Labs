library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( CLK : in STD_LOGIC;
           Column : in STD_LOGIC_VECTOR (1 to 4);
           Row : out STD_LOGIC_VECTOR (1 to 4);
           Output : out STD_LOGIC_VECTOR (7 downto 0);
           COM : out STD_LOGIC_VECTOR (1 downto 0));
end main;

architecture Structural of main is
    signal C : STD_LOGIC_VECTOR (1 to 4);
    signal CLK_MK : STD_LOGIC;
    signal CLK_SS : STD_LOGIC;
    signal Hit : STD_LOGIC;
    signal O : STD_LOGIC_VECTOR (3 downto 0);
    
begin

    DUT0_0: entity work.debounce port map(CLK, Column(1), C(1));
    DUT0_1: entity work.debounce port map(CLK, Column(2), C(2));
    DUT0_2: entity work.debounce port map(CLK, Column(3), C(3));
    DUT0_3: entity work.debounce port map(CLK, Column(4), C(4));
    
    DUT1_0: entity work.Freq_Div generic map(12500) port map(CLK, CLK_MK);
    DUT1_1: entity work.Freq_Div generic map(25*(10**3)) port map(CLK, CLK_SS);

    DUT2: entity work.MatrixKey port map(C, CLK_MK, Row, Hit, O);
    DUT3: entity work.Seven_Segment port map(O, CLK_SS, Hit, COM, Output);

end Structural;
