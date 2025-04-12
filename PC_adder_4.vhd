----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:47 12/23/2024 
-- Design Name: 
-- Module Name:    PC_adder_4 - Behavioral 
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

entity PC_adder_4 is
	
    Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           New_PC : out  STD_LOGIC_VECTOR (31 downto 0));

end PC_adder_4;

architecture Behavioral of PC_adder_4 is

begin
	NEW_PC<= STD_LOGIC_VECTOR(unsigned(PC)+4);
end Behavioral;

