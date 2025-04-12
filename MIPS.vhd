library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MIPS is
	PORT(CLK: in STD_LOGIC);
end MIPS;

architecture Behavioral of MIPS is



component ALU_Control is

	port(
	ALUop:in STD_LOGIC_VECTOR(1 downto 0);
	fn: in STD_LOGIC_VECTOR(5 downto 0);
	oper : out STD_LOGIC_VECTOR (3 downto 0));

end component;

component ALU is

	Port(
		A: in STD_LOGIC_VECTOR (31 downto 0);
		B: in STD_LOGIC_VECTOR (31 downto 0);
		ALU_CONTROL : in STD_LOGIC_VECTOR (3 downto 0);
		ALU_RESULT : out STD_LOGIC_VECTOR(31 downto 0);
		ZERO : out STD_LOGIC);
end component;

component Adder is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C: out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component PC is
	Port ( CLK : in STD_Logic;
			  INPUT : in  STD_LOGIC_VECTOR (31 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component PC_adder_4 is
    Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           New_PC : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component control_unit is

	Port(Op: in STD_LOGIC_VECTOR(5 downto 0);
			RegDst: out STD_LOGIC;
			AluSrc: out STD_LOGIC;
			MemtoReg: out STD_LOGIC;
			RegWrite: out STD_LOGIC;
			MemRead: out STD_LOGIC;
			MemWrite: out STD_LOGIC;
			Branch: out STD_LOGIC;
			ALUOp1: out STD_LOGIC;
			ALUOp0: out STD_LOGIC);
	
end component;


component instruction_file is

	Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
			  CLK : in STD_LOGIC;
           INSTRUCTION : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component mem_file is
		
		Port(Address: in STD_LOGIC_VECTOR (31 downto 0);
			  WriteData: in STD_LOGIC_VECTOR (31 downto 0);
			  MemWrite: in STD_LOGIC;
			  MemRead: in STD_LOGIC;
			  CLK: in STD_LOGIC;
			  ReadData: out STD_LOGIC_VECTOR (31 downto 0));
end component;


component mux_2_x_1 is

	generic(
		N:integer := 32
	);

	port(
		sel : in STD_LOGIC;
		A : in STD_LOGIC_VECTOR(N-1  downto 0 );
		B : in STD_LOGIC_VECTOR(N-1  downto 0 );
		Y: out STD_LOGIC_VECTOR(N-1  downto 0 )
	);

end component;


component reg_dst_mux is

    Port ( Rt : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           RegDst : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (4 downto 0));
end component;




component reg_file is
Port ( readreg1 : in STD_LOGIC_VECTOR (4 downto 0);
		readreg2 : in STD_LOGIC_VECTOR (4 downto 0);
		writereg : in STD_LOGIC_VECTOR (4 downto 0);
		writedata : in STD_LOGIC_VECTOR (31 downto 0);
		readdata1 : out STD_LOGIC_VECTOR (31 downto 0);
		readdata2 : out STD_LOGIC_VECTOR (31 downto 0);
		regwrite : in STD_LOGIC;
		clk : in STD_LOGIC);
end component;


component shifter_32_32 is
	port(A: in Std_logic_vector (31 downto 0);
	B: out std_logic_vector (31 downto 0));
end component;


component sign_extend is
		port(A: in Std_logic_vector (15 downto 0);
		B: out std_logic_vector (31 downto 0));
end component;



signal NextPC : STD_LOGIC_VECTOR(31 downto 0);
signal InstructionAddress: STD_LOGIC_VECTOR (31 downto 0);
signal Instruction: STD_LOGIC_VECTOR (31 downto 0);


signal PCAdder_Out : STD_LOGIC_VECTOR (31 downto 0);
signal BranchAdder_Out : STD_LOGIC_VECTOR (31 downto 0);


signal Opcode : STD_LOGIC_VECTOR(5 downto 0);
signal RegDst : STD_LOGIC;
signal Branch : STD_LOGIC;
signal MemRead : STD_LOGIC;
signal MemtoReg : STD_LOGIC;
signal ALUOP1: STD_LOGIC;
signal ALUOP0 : STD_LOGIC;
signal ALUOP : STD_LOGIC_VECTOR (1 downto 0);
signal MemWrite: STD_LOGIC;
signal ALUsrc: STD_LOGIC;
signal RegWrite: STD_LOGIC;


signal rs: STD_LOGIC_VECTOR (4 downto 0); -- Read Register 1
signal rt: STD_LOGIC_VECTOR (4 downto 0); -- Read Register 2
signal rd: STD_LOGIC_VECTOR (4 downto 0); 
signal RegDst_Output : STD_LOGIC_VECTOR (4 downto 0); -- Write Register (rt or rd)
signal ReadData1 : STD_LOGIC_VECTOR (31 downto 0);
signal ReadData2 : STD_LOGIC_VECTOR (31 downto 0);
signal RegWriteData : STD_LOGIC_VECTOR (31 downto 0);



signal ALU_In1: STD_LOGIC_VECTOR (31 downto 0);
signal ALU_In2: STD_LOGIC_VECTOR (31 downto 0); -- (Read data 2 or immediate)
signal ALU_Out: STD_LOGIC_VECTOR (31 downto 0);
signal Zero : STD_LOGIC;

--ALUOp already defined in control signals
signal ALUControl_In : STD_LOGIC_VECTOR(5 downto 0); -- function(instruction 5->0)
signal ALUControl_Out : STD_LOGIC_VECTOR (3 downto 0);

--Address is same as ALU_Out
signal MemReadData :  STD_LOGIC_VECTOR (31 downto 0);
--WriteData is same as ReadData2

signal SignExtendIn: STD_LOGIC_VECTOR (15 downto 0);
signal SignExtendOut: STD_LOGIC_VECTOR (31 downto 0);
-- ShiftLeftIn same as SignExtendOut
signal ShiftLeftOut: STD_LOGIC_VECTOR(31 downto 0);


begin	
--portmap

-------------------Fetching Instruction----------------------
PC_comp: PC port map (CLK,NextPC,InstructionAddress);
Instruction_comp: instruction_file port map(InstructionAddress,CLK,Instruction);
-------------------------------------------------------------------


------------Decoding Instruction-------------------------------
Opcode <= Instruction(31 downto 26);
control_unit_comp: control_unit port map(Opcode,RegDst,AluSrc, MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0);
ALUOp <= ALUOp1 & ALUOp0;
-----------------------------------------------------------------------

-------------Dividing Instruction-------------------------------
rs <= Instruction(25 downto 21);
rt<= Instruction(20 downto 16);
rd <= Instruction(15 downto 11);
SignExtendIn <= Instruction(15 downto 0);
ALUControl_In <= Instruction(5 downto 0); 
----------------------------------------------------------------------

-------------------------Reg_Dst + Register File-----------------------
reg_dst_mux_comp : reg_dst_mux port map(rt,rd,RegDst,RegDst_Output);
regfile_component : reg_file port map(rs,rt,RegDst_Output,RegWriteData,ReadData1,ReadData2,RegWrite,CLK);
---------------------------------------------------------------------------


-----------------------Sign extend and Shift left 2----------------------------
sign_extend_comp : sign_extend port map(SignExtendIn,SignExtendOut);
shift_left_2_comp : shifter_32_32 port map(SignExtendOut,ShiftLeftOut);
---------------------------------------------------------------

--------------ALU Control & ALU------------------------------
alu_control_comp : ALU_Control port map(ALUOp,ALUControl_In,ALUControl_Out);
ALU_In1 <= ReadData1;
alu_src_mux : mux_2_x_1 port map(ALUSrc,ReadData2,SignExtendOut,ALU_In2);
alu_comp : ALU port map(ALU_In1,ALU_In2,AlUControl_Out,ALU_Out,Zero);
---------------------------------------------------------------------

-------------------Data Memory -------------------------------------
data_mem_comp : mem_file port map(ALU_Out,ReadData2,MemWrite,MemRead,CLK,MemReadData);
mem_to_reg_mux: mux_2_x_1 port map(MemtoReg,ALU_Out,MemReadData,RegWriteData);
---------------------------------------------------------------------

---------Adders-----------------------------------------------
PC_adder_4_comp : PC_adder_4 port map (InstructionAddress,PCAdder_Out);
Branch_Adder : Adder port map (PCAdder_Out, ShiftLeftOut,BranchAdder_Out);
Branch_MUX : mux_2_x_1 port map (Branch AND Zero,PCAdder_Out, BranchAdder_Out,NextPC);

----------------------------------------------------------


end Behavioral;

