LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY experiment_2_1_TB IS
END experiment_2_1_TB;
 
ARCHITECTURE behavior OF experiment_2_1_TB IS 
 
   --Inputs
   signal CLK_IN : std_logic := '0';

    --BiDirs
   signal CLK_OUT : std_logic;

   -- Clock period definitions
   constant CLK_IN_period : time := 20 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: entity work.experiment_2_1 generic map ( n => 2 ) PORT MAP ( CLK_IN => CLK_IN, CLK_OUT => CLK_OUT);
        
        CLK_IN <= not(CLK_IN) after CLK_IN_period/2;
 
END;