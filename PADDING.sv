module PADDING 
	       ( input  logic [4:0] P_IN,
	     	 output logic [31:0] P_OUT
            	);

always_comb begin
	P_OUT = {27'b0, P_IN};
end


endmodule
