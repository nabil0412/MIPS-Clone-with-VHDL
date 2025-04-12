----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:04:25 11/03/2024 
-- Design Name: 
-- Module Name:    shifter_32_32 - Behavioral 
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

entity shifter_32_32 is

	port(A: in Std_logic_vector (31 downto 0);
	B: out std_logic_vector (31 downto 0));

end shifter_32_32;

architecture Behavioral of shifter_32_32 is

begin


	B(31 downto 2) <= A(29 downto 0);
	B(1 downto 0) <= "00";
	

end Behavioral;

