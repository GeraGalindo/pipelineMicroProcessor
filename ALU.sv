module ALU#(parameter N=32)
(
input logic signed [N-1:0]A,          
input logic signed [N-1:0]B,
input logic [4:0]OP, 
output logic signed [N-1:0]RESULT,
output logic Z
);

import aluPkg::*;

aluop_t OPCODE;

always_comb begin
	Z = 0;
	OPCODE = aluop_t'(OP);
	case (OPCODE)
		ADD: begin
			// Addition
			RESULT = A + B;
		end
		SUB: begin
			// Substraction
			RESULT = A - B;
		end
		AND: begin
			// Logical AND
			RESULT = A & B;
		end
		OR: begin
			// Logical OR
			RESULT = A | B;
		end
		XOR: begin
			// Logical XOR
			RESULT = A ^ B;
		end
		SLL: begin
			RESULT = B << A;
		end
		SRL: begin
			RESULT = B >> A;
		end
		SLA: begin
			RESULT = B <<< A;
		end
		SRA: begin
			RESULT = B >>> A;
		end
		LUI: begin
			//LUI
			RESULT = {B[15:0], 16'b0};
		end
		LLI: begin
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

