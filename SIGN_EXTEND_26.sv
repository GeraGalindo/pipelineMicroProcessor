module SIGN_EXTEND_26
(
	input  logic [25:0] S_IN,
	output logic [31:0] S_OUT
);

always_comb begin
	S_OUT = {6'b0, S_IN};
end


endmodule
