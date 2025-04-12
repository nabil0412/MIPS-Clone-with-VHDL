--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:34:48 12/01/2024
-- Design Name:   
-- Module Name:   D:/Student/Downloads/Lab 5+6/Lab 4-20241124T104148Z-001/Lab 4/Lab 4/AbdelrahmanNabil_221000309/controlunit_test.vhd
-- Project Name:  AbdelrahmanNabil_221000309
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control_unit
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
 
ENTITY controlunit_test IS
END controlunit_test;
 
ARCHITECTURE behavior OF controlunit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
    PORT(
         Op : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         AluSrc : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         RegWrite : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemWrite : OUT  std_logic;
         Branch : OUT  std_logic;
         ALUOp1 : OUT  std_logic;
         ALUOp0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegDst : std_logic;
   signal AluSrc : std_logic;
   signal MemtoReg : std_logic;
   signal RegWrite : std_logic;
   signal MemRead : std_logic;
   signal MemWrite : std_logic;
   signal Branch : std_logic;
   signal ALUOp1 : std_logic;
   signal ALUOp0 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name ;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_unit PORT MAP (
          Op => Op,
          RegDst => RegDst,
          AluSrc => AluSrc,
          MemtoReg => MemtoReg,
          RegWrite => RegWrite,
          MemRead => MemRead,
          MemWrite => MemWrite,
          Branch => Branch,
          ALUOp1 => ALUOp1,
          ALUOp0 => ALUOp0
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
		Op<= "000000";wait for 100 ns;
		Op <= "100011"; wait for 100 ns;
		Op <="101011"; wait for 100 ns;
		Op <="000100";
      wait;
   end process;

END;
