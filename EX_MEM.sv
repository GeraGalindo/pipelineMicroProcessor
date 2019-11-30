module EX_MEM(
	input logic clk,
	input logic EX_DM_WE,
	input logic [31:0]EX_ALU_RES,
	input logic [31:0]EX_muxB,
	input logic [15:0]EX_DM_ADDR,
	input logic EX_NEXT_PC,
	input logic EX_RF_D_SEL,
	
	output logic MEM_DM_WE,
	output logic MEM_AL_RES,	
	output logic [31:0]MEM_muxB,
	output logic [15:0]MEM_DM_ADDR,
	output logic MEM_NEXT_PC,
	output logic MEM_RF_D_SEL
);

`define SIMULATION
`ifdef SIMULATION
initial begin
	MEM_AL_RES = 0;
	MEM_DM_WE = 0;
	MEM_DM_ADDR = 0;
	MEM_muxB = 0;
	MEM_NEXT_PC = 0;
	MEM_RF_D_SEL = 0;
end
`endif

always @(posedge clk) begin
	MEM_DM_WE = EX_DM_WE;
	MEM_AL_RES = EX_ALU_RES;
	MEM_muxB = EX_muxB;
	MEM_DM_ADDR = EX_DM_ADDR;
	MEM_NEXT_PC = EX_NEXT_PC;
	MEM_RF_D_SEL = EX_RF_D_SEL;
end

endmodule