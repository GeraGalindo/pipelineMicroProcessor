module PC(
	input  logic clk,
	input  logic [31:0]D,
	output logic [31:0]Q
);

`define SIMULATION
`ifdef SIMULATION
initial begin
	Q = 0;
end
`endif

always @(posedge clk) begin
	Q <= D + 1;
end

endmodule