----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:02 12/23/2024 
-- Design Name: 
-- Module Name:    reg_dst_mux - Behavioral 
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

entity reg_dst_mux is

    Port ( Rt : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           RegDst : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (4 downto 0));
end reg_dst_mux;

architecture Behavioral of reg_dst_mux is

begin
				
	process(Rt,Rd,RegDst)
		begin
		if (RegDst = '0') then
			Y <= Rt;
		else
			Y <= Rd;
		end if;	
	end process;

end Behavioral;

