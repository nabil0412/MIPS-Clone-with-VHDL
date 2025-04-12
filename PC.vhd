----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:23 12/23/2024 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
	
	Port ( CLK : in STD_Logic;
			  INPUT : in  STD_LOGIC_VECTOR (31 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;



architecture Behavioral of PC is

signal temp_signal : STD_LOGIC_VECTOR (31 downto 0):= X"00000000";
begin
	process(INPUT,CLK)
	begin
		if (rising_edge(CLK)) then
			OUTPUT <= temp_signal;
		elsif (falling_edge(CLK)) then
			temp_signal <= INPUT;
		end if;
	end process; 


end Behavioral;

