module MEM_WB(
	input logic clk,
	input logic [31:0]MEM_ALU_RES,
	input logic [31:0]MEM_DM_Q,
	input logic MEM_RF_D_SEL,
	
	output logic [31:0]WB_ALU_RES,
	output logic [31:0]WB_DM_Q,
	output logic WB_RF_D_SEL
);

`define SIMULATION
`ifdef SIMULATION
initial begin
	WB_ALU_RES = 0;
	WB_DM_Q = 0;
	WB_RF_D_SEL = 0;
end
`endif

always @(posedge clk) begin
	WB_ALU_RES = MEM_ALU_RES;
	WB_DM_Q = MEM_DM_Q;
	WB_RF_D_SEL = MEM_RF_D_SEL;
end

endmodule