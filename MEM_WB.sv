module MEM_WB(
	input logic clk,
	input logic [31:0]MEM_ALU_RES,
	input logic [31:0]MEM_DM_Q,
	input logic [1:0]MEM_RF_D_SEL,
	input logic [31:0]MEM_NEXT_PC,
	input logic [1:0]MEM_RD_SEL,
	
	
	output logic [31:0]WB_ALU_RES,
	output logic [31:0]WB_DM_Q,
	output logic [1:0]WB_RF_D_SEL,
	output logic [31:0]WB_NEXT_PC,
	output logic [1:0]WB_RD_SEL
);

`define SIMULATION
`ifdef SIMULATION
initial begin
	WB_ALU_RES = 0;
	WB_DM_Q = 0;
	WB_RF_D_SEL = 0;
	WB_NEXT_PC = 0;
	WB_RD_SEL = 0;
end
`endif

always @(posedge clk) begin
	WB_ALU_RES = MEM_ALU_RES;
	WB_DM_Q = MEM_DM_Q;
	WB_RF_D_SEL = MEM_RF_D_SEL;
	WB_NEXT_PC = MEM_NEXT_PC;
	WB_RD_SEL = MEM_RD_SEL;
end

endmodule
