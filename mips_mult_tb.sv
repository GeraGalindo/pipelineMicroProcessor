// The smallest delay is #0.1 or 100ps
`timescale 1ns/100ps;

import func_pkg::*;

func_t FUNC;
opcode_t OP;

// Testbench module name
module mips_mult_tb;

localparam BIN_CODE_FILE = "mult.dat";

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

logic DM_WE;
logic [31:0]DM_D;
logic [31:0]DM_Q;
logic [15:0]DM_ADDR;

IM instructionMem(
	.addr(NEXT_PC),
	.inst(instruction)
);

mips_single_cycle dutMIPS(
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


/*
	R-Type Instruction Encoding

   |__OP__|__RS__|__RT__|__RD__|__SA__|__FUNC__|
   000000  00000  00000   00000  00000 000000
   000000  00001  00011   00011  00000 000000     <---- ADD R3, R3, R1			10.
*/

/*
	I-Type Instruction Encoding

   |__OP__|__RS__|__RT__|______IMMEDIATE_______|
    000000  00000 00000  0000000000000000
	100000  00000 00100  0000000000000111     <---- ADDI R0, R4, 7   			1.
	100000  00000 00101  0000000000000011     <---- ADDI R0, R5, 3				2.
	100000  00000 00110  0000000000000000     <---- ADDI R0, R6, 0				3.
	101000  00000 00100  0000000000000000     <---- SWR R4, (0)					4.
	101000  00001 00101  0000000000000000     <---- SWR R5, (1)					5.
	101000  00010 00110  0000000000000000     <---- SWR R6, (2)					6.
	100111  00000 00001  0000000000000000     <---- LWR R1, (0)					7.
	101001  00000 00010  0000000000000001     <---- LWI R2, 1					8.
	101001  00000 00011  0000000000000010     <---- LWI R3, 2					9.
	100001  00010 00010  0000000000000001     <---- SUBI R2, R2, 1				11.
	101100  00010 00000  0000000000001000     <---- BNE R2, R0, label			12.
	101010  00000 00011  0000000000000010     <---- SWI R3, (2)					13.
	
*/

/*
	J-Type Instruction Encoding

   |__OP__|_______IMMEDIATE__________|
   000000  00000000000000000000000000
   010000  00000000000000000000001011     	<---- JMP 7						14.
*/

initial begin

	$readmemb(BIN_CODE_FILE, mips_mult_tb.instructionMem.inst_mem);
	##100
	
    $stop;
end

endmodule

