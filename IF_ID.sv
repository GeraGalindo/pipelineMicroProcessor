module IF_ID(
	input logic clk,
	input logic IF_ret_enable,
	input logic [1:0]IF_RF_D_SEL,
	input logic IF_DM_WE,
	input logic IF_A_SEL,
	input logic IF_B_SEL,
	input logic IF_RF_WE,
	input logic [1:0]IF_RD_SEL,
	input logic [4:0]IF_ALU_OP,
	input logic IF_DM_ADDR_SEL,
	input logic [31:0]IF_INSTRUCTION,
	input logic IF_NEXT_PC,
	
	output logic ID_ret_enable,
	output logic [1:0]ID_RF_D_SEL,
	output logic ID_DM_WE,
	output logic ID_A_SEL,
	output logic ID_B_SEL,
	output logic ID_RF_WE,
	output logic [1:0]ID_RD_SEL,
	output logic [4:0]ID_ALU_OP,
	output logic ID_DM_ADDR_SEL,
	output logic [31:0]ID_INSTRUCTION,
	output logic ID_NEXT_PC
);

`define SIMULATION
`ifdef SIMULATION
initial begin
	ID_ret_enable = 0;
	ID_RF_D_SEL = 0;
	ID_DM_WE = 0;
	ID_A_SEL = 0;
	ID_B_SEL = 0;
	ID_RF_WE = 0;
	ID_RD_SEL = 0;
	ID_ALU_OP = 0;
	ID_DM_ADDR_SEL = 0;
	ID_INSTRUCTION = 0;
	ID_NEXT_PC = 0;
end
`endif

always @(posedge clk) begin
	ID_ret_enable = IF_ret_enable;
	ID_RF_D_SEL = IF_RF_D_SEL;
	ID_DM_WE = IF_DM_WE;
	ID_A_SEL = IF_A_SEL;
	ID_B_SEL = IF_B_SEL;
	ID_RF_WE = IF_RF_WE;
	ID_RD_SEL = IF_RD_SEL;
	ID_ALU_OP = IF_ALU_OP;
	ID_DM_ADDR_SEL = IF_DM_ADDR_SEL;
	ID_INSTRUCTION = IF_INSTRUCTION;
	ID_NEXT_PC = IF_NEXT_PC;
end

endmodule

