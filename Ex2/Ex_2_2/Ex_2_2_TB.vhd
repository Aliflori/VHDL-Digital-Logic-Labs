LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY experiment_2_2_TB IS
END experiment_2_2_TB;
 
ARCHITECTURE behavior OF experiment_2_2_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT experiment_2_2
    PORT(
         CLK : IN  std_logic;
         DATA_IN : IN  std_logic_vector(7 downto 0);
         SEG_SEL : OUT  std_logic_vector(3 downto 0);
         SEG_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal DATA_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal SEG_SEL : std_logic_vector(3 downto 0);
   signal SEG_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: experiment_2_2 PORT MAP (
          CLK => CLK,
          DATA_IN => DATA_IN,
          SEG_SEL => SEG_SEL,
          SEG_OUT => SEG_OUT
        );

		DATA_IN <= "00000000" , "11010001" AFTER 40 ns , "11010010" AFTER 80 ns ;
   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;

END;
