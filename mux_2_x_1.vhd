----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:24 10/13/2024 
-- Design Name: 
-- Module Name:    mux_2_x_1 - Behavioral 
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

entity mux_2_x_1 is

	generic(
		N:integer := 32
	);

	port(
		sel : in STD_LOGIC;
		A : in STD_LOGIC_VECTOR(N-1  downto 0 );
		B : in STD_LOGIC_VECTOR(N-1  downto 0 );
		Y: out STD_LOGIC_VECTOR(N-1  downto 0 )
	);


end mux_2_x_1;

architecture Behavioral of mux_2_x_1 is

begin

	process(A,B,sel)
	begin

	if sel = '0' then
		Y<= A;
	else
		Y<= B;
	end if;
	
	end process;


end Behavioral;

