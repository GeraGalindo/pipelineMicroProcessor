module EX_MEM(
	input logic clk,
	input logic EX_DM_WE,
	input logic [31:0]EX_ALU_RES,
	input logic [31:0]EX_muxB,
	input logic [15:0]EX_DM_ADDR,
	input logic [1:0]EX_RF_D_SEL,
	input logic [31:0]EX_NEXT_PC,
	input logic [1:0]EX_RD_SEL,
	
	output logic MEM_DM_WE,
	output logic [31:0]MEM_ALU_RES,	
	output logic [31:0]MEM_muxB,
	output logic [15:0]MEM_DM_ADDR,
	output logic [1:0]MEM_RF_D_SEL,
	output logic [31:0]MEM_NEXT_PC,
	output logic [1:0]MEM_RD_SEL
);

`define SIMULATION
`ifdef SIMULATION
initial begin
	MEM_ALU_RES = 0;
	MEM_DM_WE = 0;
	MEM_DM_ADDR = 0;
	MEM_muxB = 0;
	MEM_RF_D_SEL = 0;
	MEM_NEXT_PC = 0;
	MEM_RD_SEL = 0;
end
`endif

always @(posedge clk) begin
	MEM_DM_WE = EX_DM_WE;
	MEM_ALU_RES = EX_ALU_RES;
	MEM_muxB = EX_muxB;
	MEM_DM_ADDR = EX_DM_ADDR;
	MEM_RF_D_SEL = EX_RF_D_SEL;
	MEM_NEXT_PC = EX_NEXT_PC;
	MEM_RD_SEL = EX_RD_SEL;
end

endmodule
