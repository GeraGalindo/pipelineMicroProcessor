module iFETCH(
	input logic clk,
	input logic ALU_Z,
	input logic BRANCH,
	input logic [31:0]SE_B,
	input logic [31:0]SE_PC,
	input logic [31:0]QT_B,
	output logic [31:0]INSTRUCTION,
	output logic [4:0]ALU_OP,
	output logic [1:0]RF_D_SEL,
	output logic [1:0]RD_SEL,
	output logic DM_ADDR_SEL,
	output logic DM_WE,
	output logic A_SEL,
	output logic B_SEL,
	output logic RF_WE,
	output logic ret_enable
);

logic [31:0]PCMUX_2_D;
logic [31:0]NEXT_INST;
logic [5:0]IMQ_FUNC;
logic [5:0]IMQ_OPCODE;
logic [1:0]PC_SEL;

logic ID_ret_enable;
logic [1:0]ID_RF_D_SEL;
logic ID_DM_WE;
logic ID_A_SEL;
logic ID_B_SEL;
logic ID_RF_WE;
logic [1:0]ID_RD_SEL;
logic [4:0]ID_ALU_OP;
logic ID_DM_ADDR_SEL;
logic [31:0]ID_INSTRUCTION;
logic [4:0]ID_RS;
logic [4:0]ID_RT;
logic [4:0]ID_RD;
logic [4:0]FIXED31;
logic [4:0]ZERO5;
logic [4:0]muxRFRD;
logic [31:0]muxRFD;
logic [15:0]ID_IMMEDIATE;
logic [31:0]ID_SE_B;
logic [4:0]ID_SA;
logic [31:0]ID_PA_A;
logic [31:0]QS_A;
logic [31:0]ID_QT_B;
logic [31:0]ID_muxA;
logic [31:0]ID_muxB;
logic [31:0]MEM_DM_Q;
logic [31:0]ID_NEXT_PC;
logic [31:0]ZERO32;

logic EX_ret_enable;
logic EX_DM_WE;
logic [4:0]EX_ALU_OP;
logic EX_DM_ADDR_SEL;
logic [15:0]EX_IMMEDIATE;
logic [31:0]EX_muxA;
logic [31:0]EX_muxB;
logic [31:0]EX_ALU_RESULT;
logic EX_ALU_Z;


// INSTRUCTION FETCH STAGE
INST_MEM instructionMemory(.ADDRESS(NEXT_INST),.INSTRUCTION(INSTRUCTION));
CONTROL_UNIT controlUnit(
	.FUNC(IMQ_FUNC),
	.OPCODE(IMQ_OPCODE),
	.ALU_Z(ALU_Z),
	.BRANCH(BRANCH),
	.ALU_OP(ALU_OP),
	.RF_WE(RF_WE),
	.DM_WE(DM_WE),
	.A_SEL(A_SEL),
	.B_SEL(B_SEL),
	.PC_SEL(PC_SEL),
	.RD_SEL(RD_SEL),
	.RF_D_SEL(RF_D_SEL),
	.DM_ADDR_SEL(DM_ADDR_SEL),
	.ret_enable(ret_enable));
MUX_4_1 PC_MUX(
	.IN_1(NEXT_INST),.IN_2(SE_B),.IN_3(SE_PC),.IN_4(QT_B),.SEL(PC_SEL),
	.OUT(PCMUX_2_D));
PC pc(.clk(clk),.D(PCMUX_2_D),.Q(NEXT_INST));

// IF / ID REGISTER
IF_ID IF_ID_REGISTER(
	.clk(clk),
	.IF_ret_enable(ret_enable),
	.IF_RF_D_SEL(RF_D_SEL),
	.IF_DM_WE(DM_WE),
	.IF_A_SEL(A_SEL),
	.IF_B_SEL(B_SEL),
	.IF_RF_WE(RF_WE),
	.IF_RD_SEL(RD_SEL),
	.IF_ALU_OP(ALU_OP),
	.IF_DM_ADDR_SEL(DM_ADDR_SEL),
	.IF_INSTRUCTION(INSTRUCTION),
	.ID_ret_enable(ID_ret_enable),
	.ID_RF_D_SEL(ID_RF_D_SEL),
	.ID_DM_WE(ID_DM_WE),
	.ID_A_SEL(ID_A_SEL),
	.ID_B_SEL(ID_B_SEL),
	.ID_RF_WE(ID_RF_WE),
	.ID_RD_SEL(ID_RD_SEL),
	.ID_ALU_OP(ID_ALU_OP),
	.ID_DM_ADDR_SEL(ID_DM_ADDR_SEL),
	.ID_INSTRUCTION(ID_INSTRUCTION));

// INSTRUCTION DECODE STAGE
MUX_4_1#(.N(5)) RF_rd_MUX(
	.IN_1(ID_RD),.IN_2(ID_RT),.IN_3(FIXED31),.IN_4(ZERO5),.SEL(ID_RD_SEL),
	.OUT(muxRFRD));
MUX_4_1 RF_D_MUX(
	.IN_1(EX_ALU_RESULT),.IN_2(MEM_DM_Q),.IN_3(ID_NEXT_PC),.IN_4(ZERO32),.SEL(ID_RF_D_SEL),
	.OUT(muxRFD));
REGFILE regFile(
	.clk(clk),.we(ID_RF_WE),.ret_enable(ID_ret_enable),
	.rs(ID_RS),.rt(ID_RT),.rd(muxRFRD),.d(muxRFD),
	.qs(QS_A),.qt(ID_QT_B));
SIGN_EXTEND signExt16(
	.S_IN(ID_IMMEDIATE),
	.S_OUT(ID_SE_B));
PADDING padding(
	.P_IN(ID_SA),
	.P_OUT(ID_PA_A));
MUX_2_1 A_MUX(
	.IN_1(QS_A),.IN_2(ID_PA_A),.SEL(ID_A_SEL),
	.OUT(ID_muxA));	
MUX_2_1 B_MUX(
	.IN_1(ID_QT_B),.IN_2(ID_SE_B),.SEL(ID_B_SEL),
	.OUT(ID_muxB));
	
// ID / EX REGISTER
ID_EX ID_EX_REGISTER(
	.clk(clk),
	.ID_ret_enable(ID_ret_enable),
	.ID_DM_WE(ID_DM_WE),
	.ID_ALU_OP(ID_ALU_OP),
	.ID_DM_ADDR_SEL(ID_DM_ADDR_SEL),
	.ID_IMMEDIATE(ID_IMMEDIATE),
	.ID_muxA(ID_muxA),
	.ID_muxB(ID_muxB),
	.EX_ret_enable(EX_ret_enable),
	.EX_DM_WE(EX_DM_WE),
	.EX_ALU_OP(EX_ALU_OP),
	.EX_DM_ADDR_SEL(EX_DM_ADDR_SEL),
	.EX_IMMEDIATE(EX_IMMEDIATE),
	.EX_muxA(EX_muxA),
	.EX_muxB(EX_muxB));

// EXECUTION STAGE 
ALU alu(
	.A(EX_muxA),
	.B(EX_muxB),
	.OP(EX_ALU_OP),
	.RESULT(EX_ALU_RESULT),
	.Z(EX_ALU_Z));

always_comb begin
	// IF STAGE RELATED SIGNALS
	IMQ_FUNC = INSTRUCTION[5:0];
	IMQ_OPCODE = INSTRUCTION[31:26];
	
	// ID STAGE RELATED SIGNALS
	FIXED31 = 31;
	ZERO5 = 0;
	ID_RS = ID_INSTRUCTION[25:21];
	ID_RT = ID_INSTRUCTION[20:16];
	ID_RD = ID_INSTRUCTION[15:11];
	ID_SA = ID_INSTRUCTION[10:6];
	ID_IMMEDIATE = ID_INSTRUCTION[15:0];
	
end

always @(posedge clk) begin
	// LOADING PIPELINE'S INSTRUCTION DECODE
	
	
	
end


endmodule
