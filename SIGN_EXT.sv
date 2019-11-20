module SIGN_EXTEND 
	       ( input  logic [15:0] S_IN,
	     	 output logic [31:0] S_OUT
            	);

always_comb begin
	//S_OUT = {16'b0, S_IN};
	S_OUT = {{16{S_IN[15]}}, S_IN};
end


endmodule
