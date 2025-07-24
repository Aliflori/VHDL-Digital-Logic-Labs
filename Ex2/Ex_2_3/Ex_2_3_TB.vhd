LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY experiment_2_3_Test_Bench IS
END experiment_2_3_Test_Bench;
 
ARCHITECTURE behavior OF experiment_2_3_Test_Bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT experiment_2_3
    PORT(
         CLK : IN  std_logic;
         ENABLE : IN  std_logic;
         UP_DOWN : IN  std_logic;
         COUNTER_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal ENABLE : std_logic := '1';
   signal UP_DOWN : std_logic := '1';

 	--Outputs
   signal COUNTER_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: experiment_2_3 PORT MAP (
          CLK => CLK,
          ENABLE => ENABLE,
          UP_DOWN => UP_DOWN,
          COUNTER_OUT => COUNTER_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
        wait for 150 ns;
        UP_DOWN <= '0';
        wait for 150 ns;
        ENABLE <= '0';
        wait for 500 ns;
        ENABLE <= '1';
        wait;
   end process;

END;
