library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ex_4_3 is
    port(CLK_50MHz, PS2_CLK, PS2_data : in  std_logic;
         PS2_code_out                 : out std_logic_vector(7 downto 0);
         COM                          : out std_logic_vector(3 downto 0);
         PS2_code_new                 : out std_logic);
end Ex_4_3;

architecture Structural of Ex_4_3 is

    signal PS2_CLK_Debounced, PS2_data_Debounced : std_logic;
    signal PS2_code : std_logic_vector(7 downto 0);
    signal div : std_logic;


begin

    UUT1: entity work.debounce port map(CLK_50MHz, PS2_CLK, PS2_CLK_Debounced);
    UUT2: entity work.debounce port map(CLK_50MHz, PS2_data, PS2_data_Debounced);
    UUT3: entity work.Ex_4_1 port map(PS2_CLK_Debounced, PS2_data_Debounced, PS2_code_new, PS2_code);
    UUT4: entity work.EX_4_2 port map(div, PS2_code, COM, PS2_code_out);
    UUT5: entity work.Freq_Div generic map (25 * (10**6)) port map(CLK_50MHz, div);


end Structural;
