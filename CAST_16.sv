module CAST_16 
	       ( input  logic [31:0] S_IN,
	     	 output logic [15:0] S_OUT
            	);

always_comb begin
	S_OUT = S_IN[15:0];
end


endmodule
