----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:38 12/23/2024 
-- Design Name: 
-- Module Name:    instruction_file - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_file is

	Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
			  CLK : in STD_LOGIC;
           INSTRUCTION : out  STD_LOGIC_VECTOR (31 downto 0));
end instruction_file;

architecture Behavioral of instruction_file is

type mem is array(0 to 27) of STD_LOGIC_VECTOR(7 downto 0);
signal inst_mem: mem:= (X"00",X"85",X"10",X"20",
								X"AC",X"02",X"00",X"08",
								X"8C",X"02",X"00",X"08",
								X"10",X"46",X"00",X"01",
								X"00",X"46",X"88",X"2A",
								X"00",X"A4",X"88",X"22",
								X"00",X"46",X"98",X"2A");
						
begin
process(clk,PC)
	begin
	if (rising_edge(CLK)) then
	INSTRUCTION (31 downto 24) <= inst_mem(to_integer(unsigned(PC)));
	INSTRUCTION(23 downto 16) <= inst_mem(to_integer(unsigned(PC)+1));
	INSTRUCTION (15 downto 8) <= inst_mem(to_integer(unsigned(PC)+2));
	INSTRUCTION (7 downto 0) <= inst_mem(to_integer(unsigned(PC)+3));
	end if;	
end process;


end Behavioral;

