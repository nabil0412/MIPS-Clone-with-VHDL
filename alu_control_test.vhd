--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:08:06 10/27/2024
-- Design Name:   
-- Module Name:   D:/Student/Downloads/Lab 3/Lab 3/AbdelrahmanNabil_221000309/alu_control_test.vhd
-- Project Name:  AbdelrahmanNabil_221000309
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_Control
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
 
ENTITY alu_control_test IS
END alu_control_test;
 
ARCHITECTURE behavior OF alu_control_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_Control
    PORT(
         ALUop : IN  std_logic_vector(1 downto 0);
         fn : IN  std_logic_vector(5 downto 0);
         oper : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUop : std_logic_vector(1 downto 0) := (others => '0');
   signal fn : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal oper : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_Control PORT MAP (
          ALUop => ALUop,
          fn => fn,
          oper => oper
        );


 

   -- Stimulus process
   stim_proc: process	
		   begin		
				ALUop <= "00";
				wait for 100 ns;
				ALUop <="01";
				wait for 100 ns;
				ALUop <= "10";
				fn <= "100000";
				wait for 100 ns;
				fn <="100010";
				wait;
				

		
		
   end process;

END;
