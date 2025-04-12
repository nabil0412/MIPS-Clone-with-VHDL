--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:34:53 10/13/2024
-- Design Name:   
-- Module Name:   D:/AbdelrahmanNabil_221000309/mux_2x1_test.vhd
-- Project Name:  AbdelrahmanNabil_221000309
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_2_x_1
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
 
ENTITY mux_2x1_test IS
END mux_2x1_test;
 
ARCHITECTURE behavior OF mux_2x1_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_2_x_1
    PORT(
         sel : IN  std_logic;
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Y : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic := '0';
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_2_x_1 PORT MAP (
          sel => sel,
          A => A,
          B => B,
          Y => Y
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
		
		A<= X"FFFFFFFF";
		B <= X"00000000";
		
		sel<= '0'; wait for 200 ns;
		sel<= '1'; wait;

   end process;

END;
