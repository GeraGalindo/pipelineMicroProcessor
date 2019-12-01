module ID_EX(
	input logic clk,
	input logic ID_ret_enable,
	input logic [1:0]ID_RF_D_SEL,
	input logic ID_DM_WE,
	//input logic IF_RF_WE,
	//input logic [1:0]IF_RD_SEL,
	input logic [1:0]ID_RD_SEL,
	input logic [4:0]ID_ALU_OP,
	input logic ID_DM_ADDR_SEL,
	input logic [15:0]ID_IMMEDIATE,
	input logic [31:0]ID_muxA,
	input logic [31:0]ID_muxB,
	input logic [31:0]ID_NEXT_PC,
	
	output logic EX_ret_enable,
	output logic [1:0]EX_RF_D_SEL,
	output logic EX_DM_WE,
	//output logic ID_RF_WE,
	//output logic [1:0]ID_RD_SEL,
	output logic [1:0]EX_RD_SEL,
	output logic [4:0]EX_ALU_OP,
	output logic EX_DM_ADDR_SEL,
	output logic [15:0]EX_IMMEDIATE,
	output logic [31:0]EX_muxA,
	output logic [31:0]EX_muxB,
	output logic [31:0]EX_NEXT_PC
);

`define SIMULATION
`ifdef SIMULATION
initial begin
	EX_ret_enable = 0;
	EX_RF_D_SEL = 0;
	EX_DM_WE = 0;
	//ID_RF_WE = 0;
	//ID_RD_SEL = 0;
	EX_RD_SEL = 0;
	EX_ALU_OP = 0;
	EX_DM_ADDR_SEL = 0;
	EX_IMMEDIATE = 0;
	EX_muxA = 0;
	EX_muxB = 0;
	EX_NEXT_PC = 0;
end
`endif

always @(posedge clk) begin
	EX_ret_enable = ID_ret_enable;
	EX_RF_D_SEL = ID_RF_D_SEL;
	EX_DM_WE = ID_DM_WE;
	//ID_RF_WE = IF_RF_WE;
	//ID_RD_SEL = IF_RD_SEL;
	EX_RD_SEL = ID_RD_SEL;
	EX_ALU_OP = ID_ALU_OP;
	EX_DM_ADDR_SEL = ID_DM_ADDR_SEL;
	EX_IMMEDIATE = ID_IMMEDIATE;
	EX_muxA = ID_muxA;
	EX_muxB = ID_muxB;
	EX_NEXT_PC = ID_NEXT_PC;
end

endmodule


