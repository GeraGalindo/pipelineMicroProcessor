module MUX_2_1#(parameter N=32)
	       ( input  logic [N-1:0]IN_1,
	     	 input  logic [N-1:0]IN_2,
		 input  logic SEL,
		 output logic [N-1:0]OUT
            	);

always_comb begin
	case (SEL)
		0: OUT = IN_1;
		1: OUT = IN_2;
	endcase
end


endmodule