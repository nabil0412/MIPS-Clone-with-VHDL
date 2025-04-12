--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:18:17 10/20/2024
-- Design Name:   
-- Module Name:   D:/Student/Downloads/Lab 2/Lab 1/AbdelrahmanNabil_221000309/alu_test.vhd
-- Project Name:  AbdelrahmanNabil_221000309
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alu_test IS
END alu_test;
 
ARCHITECTURE behavior OF alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         ALU_CONTROL : IN  std_logic_vector(3 downto 0);
         ALU_RESULT : OUT  std_logic_vector(31 downto 0);
         ZERO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_CONTROL : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_RESULT : std_logic_vector(31 downto 0);
   signal ZERO : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALU_CONTROL => ALU_CONTROL,
          ALU_RESULT => ALU_RESULT,
          ZERO => ZERO
        );


   -- Stimulus process
   stim_proc: process
   begin		
		
      A <= X"0000000A";
		B <= X"00000001";
		ALU_CONTROL <= "0000" ; wait for 100 ns;
		ALU_CONTROL <= "0001" ; wait for 100 ns;
		ALU_CONTROL <= "0010" ; wait for 100 ns;
		ALU_CONTROL <= "0110" ; wait for 100 ns;
		ALU_CONTROL <= "0111" ; wait; 

   end process;

END;
