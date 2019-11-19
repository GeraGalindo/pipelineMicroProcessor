module REGFILE #(parameter DATA_WIDTH=32,
             parameter N_WORDS=32)
            (input  logic                       clk,
             input  logic                       we,
			 input  logic 				ret_enable,
             input  logic [$clog2(N_WORDS)-1:0] rs,
	     input  logic [$clog2(N_WORDS)-1:0] rt,
	     input  logic [$clog2(N_WORDS)-1:0] rd,
             input  logic      [DATA_WIDTH-1:0] d,
             output logic      [DATA_WIDTH-1:0] qs,
             output logic      [DATA_WIDTH-1:0] qt
            );

// YOUR CODE GOES HERE
logic [DATA_WIDTH-1:0] reg_file [N_WORDS];

always @(posedge clk) begin
	if (we == 1 && rd != 0) begin // Preserving the value of Register Zero
		reg_file[rd] <= d;
	end
end

always_comb begin
	qs <= reg_file[rs];
	
	if (ret_enable) begin
		qt <= reg_file[rd];
	end
	if (!ret_enable) begin
		qt <= reg_file[rt];
	end
end

`define SIMULATION
`ifdef SIMULATION
initial begin
	for(int reg_index=0; reg_index<N_WORDS; reg_index++)
		reg_file[reg_index] = reg_index;
end
`endif

endmodule
