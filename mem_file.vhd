library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_file is
		
		Port(Address: in STD_LOGIC_VECTOR (31 downto 0);
			  WriteData: in STD_LOGIC_VECTOR (31 downto 0);
			  MemWrite: in STD_LOGIC;
			  MemRead: in STD_LOGIC;
			  CLK: in STD_LOGIC;
			  ReadData: out STD_LOGIC_VECTOR (31 downto 0));
			  
end mem_file;

architecture Behavioral of mem_file is

type Memory is array(0 to 31) of STD_LOGIC_VECTOR(7 downto 0);

signal MM: Memory := (X"AB",X"CD",X"EF",X"00",
							 X"75",X"74",X"65",X"72",
							 X"20",X"41",X"72",X"63",
							 X"68",X"69",X"74",X"65",
							 X"7F",X"7F",X"6D",X"6D",
							 X"00",X"00",X"00",X"00",
							 X"78",X"78",X"6A",X"6A",
							 X"00",X"00",X"00",X"00");


begin

	process (MemRead, MemWrite, Address, WriteData, CLK) 
	begin
	if MemRead = '1' and MemWrite = '0' then 
			ReadData (31 downto 24) <= MM(to_integer (unsigned (Address))); 
			ReadData (23 downto 16) <= MM(to_integer (unsigned (Address) +1));
			ReadData (15 downto 8) <= MM(to_integer (unsigned (Address) +2)) ;
			ReadData (7 downto 0) <= MM(to_Integer (unsigned (Address) +3));
	elsif MemRead = '0' and MemWrite = '1' and rising_edge (CLK) then 
		MM (to_integer (unsigned (Address))) <= WriteData (31 downto 24);
		MM (to_integer (unsigned (Address) +1))<= WriteData (23 downto 16);
		MM (to_integer (unsigned (Address) +2))<= WriteData (15 downto 8) ; 
		MM (to_integer (unsigned (Address) +3))<= WriteData (7 downto 0); 
	end if; 
	end process;

end Behavioral;

