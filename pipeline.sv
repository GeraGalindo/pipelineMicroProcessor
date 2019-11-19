module pipeline#(parameter N=32)
	       ( input  logic clk,
	     	 input  logic [N-1:0]INSTRUCTION,
			 input  logic [31:0]DM_Q,
			 output logic DM_WE,
			 output logic [31:0]DM_D,
			 output logic [15:0]DM_ADDR,
			 output logic [31:0]NEXT_PC
            );

// OPCODE - Valid for every type of instruction
logic [5:0]OP;

// Instruction Splitting for R-Type
logic [5:0]FUNC;
logic [4:0]SA;
logic [4:0]RS;
logic [4:0]RT;
logic [4:0]RD;
logic [4:0]FIXED31;

// Instruction Splitting for I-Type
logic [3:0]iOP;
logic [15:0]iImmediate;

// Instruction Splitting for J-Type
logic [3:0]jOP;
logic [25:0]jImmediate;

// Connecting lines to/from ALU
logic [31:0]ALU_A;
logic [31:0]ALU_B;
logic [4:0]ALU_OP;
logic [31:0]ALU_RESULT;
logic ALU_Z;
logic ret_enable;

//logic SHIFT_MUX;
logic [31:0]in_qs;
logic [31:0]in_sa;
logic A_SEL;
logic B_SEL;
logic [1:0]RD_SEL;
logic [1:0]PC_SEL;
logic [1:0]RF_D_SEL;
logic RF_WE;
//logic DM_WE;
logic DM_ADDR_SEL;
logic [31:0]PA_A;
logic [31:0]muxA;
logic [31:0]muxB;
logic [4:0]muxRFD;
logic [31:0]muxPC;
logic [31:0]QS_A;
logic [31:0]QT_B;
logic [31:0]SE_B;
logic [31:0]SE_PC;
logic [31:0]RF_D;
//logic [31:0]DM_Q;
//logic [4:0]signal_in;
logic [15:0]IMMEDIATE;
//logic [15:0]DM_ADDR;
logic [15:0]CAST_ADDR;

logic [31:0]ZERO32;
logic [4:0]ZERO5;

ALU iALU(.A(muxA),.B(muxB),.OP(ALU_OP),.RESULT(ALU_RESULT),.Z(ALU_Z));
CONTROL_UNIT iCU(
	.FUNC(FUNC),
	.OPCODE(OP),
	.ALU_Z(ALU_Z),
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
MUX_2_1 A_MUX(.IN_1(QS_A),.IN_2(PA_A),.SEL(A_SEL),.OUT(muxA));
MUX_2_1 B_MUX(.IN_1(QT_B),.IN_2(SE_B),.SEL(B_SEL),.OUT(muxB));
MUX_4_1 PC_MUX(.IN_1(NEXT_PC),.IN_2(SE_B),.IN_3(SE_PC),.IN_4(QT_B),.SEL(PC_SEL),.OUT(muxPC));
MUX_4_1 RF_D_MUX(.IN_1(ALU_RESULT),.IN_2(DM_Q),.IN_3(NEXT_PC),.IN_4(ZERO32),.SEL(RF_D_SEL),.OUT(RF_D));
MUX_4_1#(.N(5)) RF_rd_MUX(.IN_1(RD),.IN_2(RT),.IN_3(FIXED31),.IN_4(ZERO5),.SEL(RD_SEL),.OUT(muxRFD));
MUX_2_1#(.N(16)) DM_ADDR_MUX(.IN_1(CAST_ADDR),.IN_2(iImmediate),.SEL(DM_ADDR_SEL),.OUT(DM_ADDR));
PADDING padding(.P_IN(SA),.P_OUT(PA_A));
SIGN_EXTEND signExt16(.S_IN(iImmediate),.S_OUT(SE_B));
SIGN_EXTEND_26 signExt26(.S_IN(jImmediate),.S_OUT(SE_PC));
CAST_16 cast(.S_IN(QS_A),.S_OUT(CAST_ADDR));
PC pc(.clk(clk),.D(muxPC),.Q(NEXT_PC));
REGFILE regFile(.clk(clk),.we(RF_WE),.ret_enable(ret_enable),.rs(RS),.rt(RT),.rd(muxRFD),.d(RF_D),.qs(QS_A),.qt(QT_B));

/*
module PC(
	input  logic clk,
	input  logic [15:0]D,
	output logic [15:0]Q
);
*/

always_comb begin
	FIXED31 = 31;
	OP = INSTRUCTION[31:26];
	FUNC = 0;
	SA = 0;
	RD = 0;
	RT = 0;
	RS = 0;
	iImmediate = 0;
	jImmediate = 0;
	DM_D = muxB;
	ZERO32 = 0;
	ZERO5 = 0;

	if (OP == 0) begin			// R-Type
		FUNC = INSTRUCTION[5:0];
		SA = INSTRUCTION[10:6];
		RD = INSTRUCTION[15:11];
		RT = INSTRUCTION[20:16];
		RS = INSTRUCTION[25:21];
	end

	if (OP[4] == 1) begin			// J-Type
		jOP = OP[3:0];
		jImmediate = INSTRUCTION[25:0];
		FUNC = 0;
		SA = 0;
		RD = 0;
		RT = 0;
		RS = 0;
	end

	if (OP[5] == 1) begin			// I-Type
		iOP = OP[3:0];
		RT = INSTRUCTION[20:16];
		RS = INSTRUCTION[25:21];
		iImmediate = INSTRUCTION[15:0];
		FUNC = 0;
		SA = 0;
		RD = 0;
	end	
	
end
endmodule

