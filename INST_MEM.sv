module INST_MEM(
	input logic [31:0]ADDRESS,
	output logic [31:0]INSTRUCTION
);

import myPackage::*;

func_t FUNC;
opcode_t OPCODE;

logic [4:0]RS;
logic [4:0]RT;
logic [4:0]RD;
logic [4:0]SA;
logic [15:0]IMMEDIATE;

always_comb begin
	case(ADDRESS)
		0: begin // ADD RS, RT, RD     ->    RD = RS + RT
			OPCODE = RType;
			RS = 2;
			RT = 4;
			RD = 10;
			SA = 0;
			FUNC = ADD;
			INSTRUCTION = {OPCODE, RS, RT, RD, SA, FUNC};
		end
		1: begin // SUB RS, RT, RD     ->    RD = RS - RT
			OPCODE = RType;
			RS = 4;
			RT = 2;
			RD = 10;
			SA = 0;
			FUNC = SUB;
			INSTRUCTION = {OPCODE, RS, RT, RD, SA, FUNC};
		end
		2: begin // AND RS, RT, RD     ->    RD = RS & RT
			OPCODE = RType; // R-Type
			RS = 5; // Contains 5  ->  101
			RT = 7; // Contains 7  ->  111
			RD = 10; // After Logical AND it should contain 5
			SA = 0; // Unused field for a Logical AND
			FUNC = AND; // Logical AND
			INSTRUCTION = {OPCODE, RS, RT, RD, SA, FUNC};
		end
		3: begin // OR RS, RT, RD     ->    RD = RS | RT
			OPCODE = RType; // R-Type
			RS = 5; // Contains 5
			RT = 2; // Contains 2
			RD = 10; // Contains 5 but after Logical OR it should contain 7
			SA = 0; // Unused field for a Logical OR
			FUNC = OR; // Logical OR
			INSTRUCTION = {OPCODE, RS, RT, RD, SA, FUNC};
		end
		4: begin // XOR RS, RT, RD     ->    RD = RS ^ RT
			OPCODE = RType; // R-Type
			RS = 5; // Contains 5
			RT = 3; // Contains 3
			RD = 10; // Contains 7 but after Logical XOR it should contain 6
			SA = 0; // Unused field for a Logical XOR
			FUNC = XOR; // Logical XOR
			INSTRUCTION = {OPCODE, RS, RT, RD, SA, FUNC};
		end
		5: begin // SLL RD, RT, SA     ->    RD = RT << SA
			OPCODE = RType; // R-Type
			RT = 30; // Contains 30
			RD = 10; // After Shift Left Logical it should contain 120
			SA = 2; // Used field for a Shift Left Logical
			FUNC = SLL; // Shift Left Logical
			INSTRUCTION = {OPCODE, RS, RT, RD, SA, FUNC};
		end
		6: begin // SRL RD, RT, SA     ->    RD = RT >> SA
			OPCODE = RType; // R-Type
			RT = 31; // Contains 31
			RD = 10; // After Shift Right Logical it should contain 3
			SA = 3; // Used field for a Shift Right Logical
			FUNC = SRL; // Shift Right Logical
			INSTRUCTION = {OPCODE, RS, RT, RD, SA, FUNC};
		end
		7: begin // SLA RD, RT, SA     ->    RD = RT <<< SA
			OPCODE = RType; // R-Type
			RT = 31; // Contains 31
			RD = 10; // After Shift Left Arithmetical it should contain 248
			SA = 3; // Used field for a Shift Left Arithmetical
			FUNC = SLA; // Shift Left Arithmetical 
			INSTRUCTION = {OPCODE, RS, RT, RD, SA, FUNC};
		end
		8: begin // SRA RD, RT, SA     ->    RD = RT >>> SA
			OPCODE = RType; // R-Type
			RT = 31; // Contains 7
			RD = 10; // After Shift Right Arithmetical it should contain 1
			SA = 4; // Used field for a Shift Right Arithmetical
			FUNC = SRA; // Shift Right Arithmetical 
			INSTRUCTION = {OPCODE, RS, RT, RD, SA, FUNC};
		end
		9: begin // ADDI RT, RS, IMMEDIATE     ->    RT = RS + IMMEDIATE
			OPCODE = ADDI;
			RS = 1;
			RT = 10;
			IMMEDIATE = 5;
			INSTRUCTION = {OPCODE,RS,RT,IMMEDIATE};
		end
		10: begin // SUBI RT, RS, IMMEDIATE     ->    RT = RS - IMMEDIATE
			OPCODE = SUBI;
			RS = 9;
			RT = 10;
			IMMEDIATE = 5;
			INSTRUCTION = {OPCODE,RS,RT,IMMEDIATE};
		end
		11: begin // ANDI RT, RS, IMMEDIATE     ->    RT = RS & IMMEDIATE
			OPCODE = ANDI;
			RS = 7;
			RT = 10;
			IMMEDIATE = 5;
			INSTRUCTION = {OPCODE,RS,RT,IMMEDIATE};
		end
		12: begin // ORI RT, RS, IMMEDIATE     ->    RT = RS | IMMEDIATE
			OPCODE = ORI;
			RS = 5;
			RT = 10;
			IMMEDIATE = 2;
			INSTRUCTION = {OPCODE,RS,RT,IMMEDIATE};
		end
		13: begin // XORI RT, RS, IMMEDIATE     ->    RT = RS ^ IMMEDIATE
			OPCODE = XORI;
			RS = 5;
			RT = 10;
			IMMEDIATE = 7;
			INSTRUCTION = {OPCODE,RS,RT,IMMEDIATE};
		end
		14: begin // LUI RT, RS, IMMEDIATE  ->   RT = {IMMEDIATE[15:0], 16'b0}
			OPCODE = LUI;
			RS = 2;
			RT = 10;
			IMMEDIATE = 8;
			INSTRUCTION = {OPCODE,RS,RT,IMMEDIATE};
		end
		15: begin // LLI RT, RS, IMMEDIATE  ->   RT = {16'b0, IMMEDIATE[15:0]}
			OPCODE = LLI;
			RS = 2;
			RT = 10;
			IMMEDIATE = 8;
			INSTRUCTION = {OPCODE,RS,RT,IMMEDIATE};
		end
		15: begin // SWR RT, RS, IMMEDIATE  ->   RT = {16'b0, IMMEDIATE[15:0]}
			OPCODE = SWR;
			RS = 2;
			RT = 10;
			IMMEDIATE = 8;
			INSTRUCTION = {OPCODE,RS,RT,IMMEDIATE};
		end
		default: begin
			INSTRUCTION = 0;
		end
	endcase
end

endmodule
