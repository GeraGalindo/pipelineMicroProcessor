module IM #(parameter INST_WIDTH=32,
			parameter MAX_NUM_INST=128)
			
		(input logic [31:0] addr,
		 output logic [INST_WIDTH-1:0] inst
		 );
 
logic [31:0] inst_mem[128];

always_comb begin
	inst = inst_mem[addr];
end

endmodule