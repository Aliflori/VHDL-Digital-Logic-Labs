library IEEE;
use IEEE.std_logic_1164.all;

entity Ex_4_1 is

    port(PS2_CLK, PS2_data : in std_logic;
         PS2_code_new      : out std_logic;
         PS2_code          : out std_logic_vector(7 downto 0));

end entity;

architecture BHV of Ex_4_1 is

    type state_t is (start, D0, D1, D2, D3, D4, D5, D6, D7, parity, stop);
    signal state : state_t := start;
    signal P : std_logic :='0';

begin

    P1: process(PS2_CLK)
        begin
            if (PS2_CLK'event and PS2_CLK = '0') then
                case state is
                when start => 
                                if (PS2_data = '0') then PS2_code_new <= '0';
                                                         P            <= '0';
                                                         state        <= D0;
                                                     
                                else state <= start; end if;
            
                when D0 =>
                                PS2_code(0) <= PS2_data;
                                P           <= P xor PS2_data;
                                state    <= D1;
                            
                when D1 =>
                                PS2_code(1) <= PS2_data;
                                P           <= P xor PS2_data;
                                state       <= D2;                                                     

                when D2 =>
                                PS2_code(2) <= PS2_data;
                                P           <= P xor PS2_data;
                                state       <= D3; 

                when D3 =>
                                PS2_code(3) <= PS2_data;
                                P           <= P xor PS2_data;
                                state       <= D4; 

                when D4 =>
                                PS2_code(4) <= PS2_data;
                                P           <= P xor PS2_data;
                                state       <= D5; 

                when D5 =>
                                PS2_code(5) <= PS2_data;
                                P           <= P xor PS2_data;
                                state       <= D6;

                when D6 =>
                                PS2_code(6) <= PS2_data;
                                P           <= P xor PS2_data;
                                state    <= D7;

                when D7 =>
                                PS2_code(7) <= PS2_data;
                                P           <= P xor PS2_data;
                                state       <= parity;
                            
                when parity => 
                                P        <= P xor PS2_data;
                                state    <= stop;
                         
                when stop => 
                                PS2_code_new <= (Ps2_data) and (not p);
                                state        <= start;
                             
                when others => 
                                state <= start;                                            
                                                     
                end case;
            end if;      
        end process;


end architecture;