// The smallest delay is #0.1 or 100ps
`timescale 1ns/100ps

module iFetch_TestBench;

logic clk;
logic ALU_Z;
logic BRANCH;
logic [31:0]SE_B;
logic [31:0]SE_PC;
logic [31:0]QT_B;
logic [31:0]INSTRUCTION;
logic [4:0]ALU_OP;
logic [1:0]RF_D_SEL;
logic [1:0]RD_SEL;
logic DM_ADDR_SEL;
logic DM_WE;
logic A_SEL;
logic B_SEL;
logic RF_WE;
logic ret_enable;

iFETCH DUT_INST_FETCH(
	.clk(clk),
	.ALU_Z(ALU_Z),
	.BRANCH(BRANCH),
	.SE_B(SE_B),
	.SE_PC(SE_PC),
	.QT_B(QT_B),
	.INSTRUCTION(INSTRUCTION),
	.ALU_OP(ALU_OP),
	.RF_D_SEL(RF_D_SEL),
	.RD_SEL(RD_SEL),
	.DM_ADDR_SEL(DM_ADDR_SEL),
	.DM_WE(DM_WE),
	.A_SEL(A_SEL),
	.B_SEL(B_SEL),
	.RF_WE(RF_WE),
	.ret_enable(ret_enable)
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

initial begin
 ##1;
end

endmodule
