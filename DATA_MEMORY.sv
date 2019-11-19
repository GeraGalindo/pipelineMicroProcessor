module DATA_MEMORY #(parameter DATA_WIDTH=32,
             parameter N_WORDS=32)
            (input  logic             		clk,
             input  logic              		WE,
             input  logic 	[N_WORDS-1:0] 	D,
			 input  logic 	[15:0]    	ADDR,
             output logic      	[31:0] 		Q
            );

// YOUR CODE GOES HERE
logic [DATA_WIDTH-1:0] memory [1024];

always @(posedge clk) begin
	if (WE == 1) begin
		memory[ADDR] <= D;
	end
end

always_comb begin
	Q = memory[ADDR];
end

endmodule
