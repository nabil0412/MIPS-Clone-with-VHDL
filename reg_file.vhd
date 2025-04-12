----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:01 11/17/2024 
-- Design Name: 
-- Module Name:    reg_file - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_file is
Port ( readreg1 : in STD_LOGIC_VECTOR (4 downto 0);
		readreg2 : in STD_LOGIC_VECTOR (4 downto 0);
		writereg : in STD_LOGIC_VECTOR (4 downto 0);
		writedata : in STD_LOGIC_VECTOR (31 downto 0);
		readdata1 : out STD_LOGIC_VECTOR (31 downto 0);
		readdata2 : out STD_LOGIC_VECTOR (31 downto 0);
		regwrite : in STD_LOGIC;
		clk : in STD_LOGIC);
end reg_file;

architecture Behavioral of reg_file is

type regarray is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);

signal reg_file : regarray := (
X"00000000" , X"11111111",X"12121212",X"FFAAFACC",
X"00000005" , X"00000007",X"21212121",X"FFBBFACC",
X"EEFF56FF" , X"11937411",X"21212F21",X"00000000",
X"FF23FFFF" , X"1111AA11",X"00000000",X"111AFACC",
X"FFFFFFFF" , X"11111111",X"12121212",X"FFAAFACC",
X"FF01FFFF" , X"00000000",X"21212121",X"FFBBFACC",
X"EEFF56FF" , X"11937411",X"21212F21",X"00000000",
X"FF23FFFF" , X"1111AA11",X"00000000",X"11AFACCA");


begin
readdata1 <= reg_file (TO_INTEGER (UNSIGNED(readreg1)));
readdata2 <= reg_file (TO_INTEGER (UNSIGNED(readreg2)));

PROCESS (writedata,regwrite,clk)

BEGIN
IF regwrite = '1' AND RISING_EDGE (clk) THEN 
reg_file (TO_INTEGER(UNSIGNED(writereg))) <= writedata;
END IF;

END PROCESS;

end Behavioral;

