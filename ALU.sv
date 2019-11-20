module ALU#(parameter N=32)
(
input logic signed [N-1:0]A,          
input logic signed [N-1:0]B,
input logic [4:0]OP, 
output logic signed [N-1:0]RESULT,
output logic Z
);

	always_comb begin
		Z = 0;
		case (OP)
			0: begin
				// Addition
				RESULT = A + B;
			end
			1: begin
				// Substraction
				RESULT = A - B;
			end
			2: begin
				// Logical AND
				RESULT = A & B;
			end
			3: begin
				// Logical OR
				RESULT = A | B;
			end
			4: begin
				// Logical XOR
				RESULT = A ^ B;
			end
			5: begin
				RESULT = B << A;
			end
			6: begin
				RESULT = B >> A;
			end
			7: begin
				RESULT = B <<< A;
			end
			8: begin
				RESULT = B >>> A;
			end
			9: begin
				//LUI
				RESULT = {B[15:0], 16'b0};
			end
			10: begin
				//LLI
				RESULT = {16'b0, B[15:0]};
			end
			default: begin
				RESULT = 0;
			end
		endcase
		if (RESULT == 0) begin
			Z = 1;
		end
		if (RESULT != 0) begin
			Z = 0;
		end
	end
	
endmodule
