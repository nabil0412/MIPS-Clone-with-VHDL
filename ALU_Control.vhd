----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:36 10/27/2024 
-- Design Name: 
-- Module Name:    ALU_Control - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Control is

		
	port(
	ALUop:in STD_LOGIC_VECTOR(1 downto 0);
	fn: in STD_LOGIC_VECTOR(5 downto 0);
	oper : out STD_LOGIC_VECTOR (3 downto 0));

end ALU_Control;

architecture Behavioral of ALU_Control is
	
	
begin
	

			process (ALUop,fn)
			begin
					if ALUop="00"  then oper <= "0010";
					elsif ALUop="01" then oper <= "0110";
					elsif ALUop="10" and fn = "100000" then oper <= "0010";
					elsif ALUop="10" and fn = "100010" then oper <= "0110";
					elsif ALUop="10" and fn = "100100" then oper <= "0000";
					elsif ALUop="10" and fn = "100101" then oper <= "0001";
					elsif ALUop="10" and fn = "101010" then oper <= "0111";
					end if;
			end process;
		

	
end Behavioral;

