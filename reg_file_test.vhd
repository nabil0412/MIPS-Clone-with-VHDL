LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY regfiletest IS
END regfiletest;
 
ARCHITECTURE behavior OF regfiletest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_file
    PORT(
         readreg1 : IN  std_logic_vector(4 downto 0);
         readreg2 : IN  std_logic_vector(4 downto 0);
         writereg : IN  std_logic_vector(4 downto 0);
         writedata : IN  std_logic_vector(31 downto 0);
         readdata1 : OUT  std_logic_vector(31 downto 0);
         readdata2 : OUT  std_logic_vector(31 downto 0);
         regwrite : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal readreg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal readreg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal writereg : std_logic_vector(4 downto 0) := (others => '0');
   signal writedata : std_logic_vector(31 downto 0) := (others => '0');
   signal regwrite : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal readdata1 : std_logic_vector(31 downto 0);
   signal readdata2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_file PORT MAP (
          readreg1 => readreg1,
          readreg2 => readreg2,
          writereg => writereg,
          writedata => writedata,
          readdata1 => readdata1,
          readdata2 => readdata2,
          regwrite => regwrite,
          clk => clk
        );

  

   -- Stimulus process
  stim_proc: process
begin
readreg1 <= "00001"; -- => X"11111111"
readreg2 <= "11111"; -- => X"111AFACC"
wait for 11 ns;
regwrite <= '1';
writereg<= "00000"; -- => reg 0 (First reg)
writedata <= X"ABABABAB";
wait for 100 ns;
readreg1 <= "00000";
wait;
end process;
END;
