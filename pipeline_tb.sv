// The smallest delay is #0.1 or 100ps
`timescale 1ns/100ps;

import func_pkg::*;

func_t FUNC;
opcode_t OP;

// Testbench module name
module pipeline_tb;

// I/O ports from R-Type.sv are internal 
// signals in the testbench.
logic [31:0]instruction;
logic clk;
logic [31:0]NEXT_PC;

logic [4:0]SA;
logic [4:0]RS;
logic [4:0]RT;
logic [4:0]RD;

logic [15:0]IMMEDIATE;
logic [25:0]JmpAddr;

logic DM_WE;
logic [31:0]DM_D;
logic [31:0]DM_Q;
logic [15:0]DM_ADDR;

pipeline dutPipeline(
	.clk(clk),
	.INSTRUCTION(instruction),
	.DM_Q(DM_Q),
	.DM_WE(DM_WE),
	.DM_D(DM_D),
	.DM_ADDR(DM_ADDR),
	.NEXT_PC(NEXT_PC)
	);
	
DATA_MEMORY dataMem(
	.clk(clk),
	.WE(DM_WE),
	.D(DM_D),
	.ADDR(DM_ADDR),
	.Q(DM_Q)
	);

localparam real TCLK = 10;
always begin
    clk = 1'b0;
    #(0.5*TCLK);
    clk = 1'b1;
    #(0.5*TCLK);
end

default clocking clock @(posedge clk);
endclocking

// Create some stimulus for the RType gate
// initial blocks are executed only once

/*
	R-Type Instruction Encoding

   |__OP__|__RS__|__RT__|__RD__|__SA__|__FUNC__|
*/
initial begin
	//@@@@@@@@@@ R-TYPE INSTRUCTIONS START @@@@@@@@@@//
    	// ADDITION
	OP = RType; // R-Type
	RS = 1; // Contains 1
	RT = 2; // Contains 2
	RD = 10; // Contains 10 but after Addition it should contain 3
	SA = 0; // Unused field for a Addition
	FUNC = ADD; // Addition
	instruction = {OP,RS,RT,RD,SA,FUNC};
	##1

	// SUBSTRACTION
	OP = RType; // R-Type
	RS = 4; // Contains 4
	RT = 2; // Contains 2
	RD = 10; // Contains 3 but after Substraction it should contain 2
	SA = 0; // Unused field for a Substraction
	FUNC = SUB; // Substraction
	instruction = {OP,RS,RT,RD,SA,FUNC};
	##1

	// Logical AND
	OP = RType; // R-Type
	RS = 5; // Contains 5
	RT = 7; // Contains 7
	RD = 10; // Contains 2 but after Logical AND it should contain 5
	SA = 0; // Unused field for a Logical AND
	FUNC = AND; // Logical AND
	instruction = {OP,RS,RT,RD,SA,FUNC};
	##1

	// Logical OR
	OP = RType; // R-Type
	RS = 5; // Contains 5
	RT = 2; // Contains 2
	RD = 10; // Contains 5 but after Logical OR it should contain 7
	SA = 0; // Unused field for a Logical OR
	FUNC = OR; // Logical OR
	instruction = {OP,RS,RT,RD,SA,FUNC};
	##1

	// Logical XOR
	OP = RType; // R-Type
	RS = 5; // Contains 5
	RT = 3; // Contains 3
	RD = 10; // Contains 7 but after Logical XOR it should contain 6
	SA = 0; // Unused field for a Logical XOR
	FUNC = XOR; // Logical XOR
	instruction = {OP,RS,RT,RD,SA,FUNC};
	##1

	// Shift Left Logical
	OP = RType; // R-Type
	RS = 1; // Contains 1
	RT = 2; // Contains 2
	RD = 10; // Contains 6 but after Shift Left Logical it should contain 4
	SA = 0; // Unused field for a Shift Left Logical
	FUNC = SLL; // Shift Left Logical
	instruction = {OP,RS,RT,RD,SA,FUNC};
	##1

	// Shift Right Logical
	OP = RType; // R-Type
	RS = 2; // Contains 6
	RT = 4; // Contains 7
	RD = 10; // Contains 4 but after Shift Right Logical it should contain 1
	SA = 0; // Unused field for a Shift Right Logical
	FUNC = SRL; // Shift Right Logical
	instruction = {OP,RS,RT,RD,SA,FUNC};
	##1
	
	// Shift Left Arithmetical
	OP = RType; // R-Type
	RS = 2; // Contains 6
	RT = 4; // Contains 7
	RD = 10; // Contains 4 but after Shift Right Logical it should contain 1
	SA = 0; // Unused field for a Shift Right Logical
	FUNC = SLA; // Shift Right Logical
	instruction = {OP,RS,RT,RD,SA,FUNC};
	##1
	
	// Shift Right Arithmetical
	OP = RType; // R-Type
	RS = 2; // Contains 6
	RT = 16; // Contains 7
	RD = 10; // Contains 4 but after Shift Right Logical it should contain 1
	SA = 0; // Unused field for a Shift Right Logical
	FUNC = SRA; // Shift Right Logical
	instruction = {OP,RS,RT,RD,SA,FUNC};
	##1
	//@@@@@@@@@@ R-TYPE INSTRUCTIONS END @@@@@@@@@@//

	//@@@@@@@@@@ I-TYPE INSTRUCTIONS START @@@@@@@@@@//
	// ADDI
	OP = ADDI; //ADDI
	RS = 1;
	RT = 10;
	IMMEDIATE = -3;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// SUBI
	OP = SUBI; //SUBI
	RS = 1;
	RT = 10;
	IMMEDIATE = 1;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// ANDI
	OP = ANDI; //ANDI
	RS = 1;
	RT = 10;
	IMMEDIATE = 3;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// ORI
	OP = ORI; //ORI
	RS = 2;
	RT = 10;
	IMMEDIATE = 5;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// XORI
	OP = XORI; //XORI
	RS = 2;
	RT = 10;
	IMMEDIATE = 1;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// LUI
	OP = LUI; //LUI
	RS = 2;
	RT = 10;
	IMMEDIATE = 8;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// LLI
	OP = LLI; //LLI
	RS = 2;
	RT = 10;
	IMMEDIATE = 8;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// SWR
	OP = SWR; //SWR
	RS = 2;
	RT = 5;
	IMMEDIATE = 2;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// LWR
	OP = LWR; //LWR
	RS = 2;
	RT = 10;
	IMMEDIATE = 10;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// SWI
	OP = SWI; //SWI
	RS = 2;
	RT = 10;
	IMMEDIATE = 8;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// LWI
	OP = LWI; //LWI
	RS = 2;
	RT = 10;
	IMMEDIATE = 8;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	OP = ADDI; //ADDI
	RS = 1;
	RT = 10;
	IMMEDIATE = 10;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// BEQ NOT BRANCHING
	OP = BEQ;
	RS = 2;
	RT = 10;
	IMMEDIATE = 0;
	instruction = {OP,RS,RT,IMMEDIATE};
	
##1
	// BEQ BRANCHING
	OP = BEQ;
	RS = 2;
	RT = 2;
	IMMEDIATE = 0;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	// BNE NOT BRANCHING
	OP = BNE;
	RS = 2;
	RT = 2;
	IMMEDIATE = 0;
	instruction = {OP,RS,RT,IMMEDIATE};

##1
	// BNE BRANCHING
	OP = BNE;
	RS = 2;
	RT = 10;
	IMMEDIATE = 0;
	instruction = {OP,RS,RT,IMMEDIATE};
##1
	//@@@@@@@@@@ I-TYPE INSTRUCTIONS END @@@@@@@@@@//
	
	//@@@@@@@@@@ J-TYPE INSTRUCTIONS BEGIN @@@@@@@@@@//
	OP = JMP;
	JmpAddr = 42;
	instruction = {OP,JmpAddr};
	##1
	OP = ADDI; //ADDI
	RS = 1;
	RT = 10;
	IMMEDIATE = 1;
	instruction = {OP,RS,RT,IMMEDIATE};
	##1
	OP = JAL;
	JmpAddr = 24;
	instruction = {OP,JmpAddr};
	##1
	OP = ADDI; //ADDI
	RS = 1;
	RT = 10;
	IMMEDIATE = 1;
	instruction = {OP,RS,RT,IMMEDIATE};
	##1
	OP = ADDI; //ADDI
	RS = 1;
	RT = 10;
	IMMEDIATE = 1;
	instruction = {OP,RS,RT,IMMEDIATE};
	##1
	OP = ADDI; //ADDI
	RS = 1;
	RT = 10;
	IMMEDIATE = 1;
	instruction = {OP,RS,RT,IMMEDIATE};
	##1
	OP = ADDI; //ADDI
	RS = 1;
	RT = 10;
	IMMEDIATE = 1;
	instruction = {OP,RS,RT,IMMEDIATE};
	##1
	OP = RET;
	JmpAddr = 24;
	instruction = {OP,JmpAddr};
	##1
	OP = ADDI; //ADDI
	RS = 1;
	RT = 10;
	IMMEDIATE = 1;
	instruction = {OP,RS,RT,IMMEDIATE};
	##1
	//@@@@@@@@@@ J-TYPE INSTRUCTIONS END @@@@@@@@@@//
	$stop;
end

endmodule

