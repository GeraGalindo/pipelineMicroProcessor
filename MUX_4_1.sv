module MUX_4_1#(parameter N=32)
( 
	input  logic [N-1:0]IN_1,
	input  logic [N-1:0]IN_2,
	input  logic [N-1:0]IN_3,
	input  logic [N-1:0]IN_4,
	input  logic [1:0]SEL,
	output logic [N-1:0]OUT
);

always_comb begin
	case (SEL)
		0: OUT = IN_1;
		1: OUT = IN_2;
		2: OUT = IN_3;
		3: OUT = IN_4;
		default: OUT = 0;
	endcase
end


endmodule
