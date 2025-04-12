----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:18 10/20/2024 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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


use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is

	Port(
	
		A: in STD_LOGIC_VECTOR (31 downto 0);
		B: in STD_LOGIC_VECTOR (31 downto 0);
		ALU_CONTROL : in STD_LOGIC_VECTOR (3 downto 0);
		ALU_RESULT : out STD_LOGIC_VECTOR(31 downto 0);
		ZERO : out STD_LOGIC);
	
	
end ALU;

architecture Behavioral of ALU is

signal resultX: STD_LOGIC_VECTOR (31 downto 0);
begin 

	process (A, B, ALU_CONTROL)
	begin 

		CASE ALU_CONTROL IS
			WHEN "0000" => resultX <= A AND B;
			WHEN "0001" => resultX <= A OR B;
			WHEN "0010" => resultX <= A + B;
			WHEN "0110" => resultX <= A - B;

			WHEN "0111" =>
				 if A < B then resultX <= X"00000001";
				 else resultX <= X"00000000";
				 end if;

			WHEN "1100" => resultX <= A NOR B;
			
			WHEN OTHERS => resultX <= X"00000000";
		end CASE; 
		
	end process; 


ALU_RESULT<=resultX;
ZERO <= '1' WHEN resultX = X"00000000" ELSE '0';

end Behavioral;	 
	 


