module CONTROL_UNIT( 
	input  logic [5:0] FUNC,
	input  logic [5:0] OPCODE,
	input  logic ALU_Z,
	input  logic BRANCH,
	output logic [4:0] ALU_OP,
	output logic RF_WE,
	output logic DM_WE,
	output logic A_SEL,
	output logic B_SEL,
	output logic [1:0]PC_SEL,
	output logic [1:0]RD_SEL,
	output logic [1:0]RF_D_SEL,
	output logic DM_ADDR_SEL,
	output logic ret_enable
);

logic [1:0]insType; // To hold the type of instruction
logic [3:0]subOP;

always_comb begin
	insType = OPCODE[5:4];
	subOP = OPCODE[3:0];
	RF_WE = 0;
	DM_WE = 0;
	A_SEL = 0;
	B_SEL = 0;
	PC_SEL = 0;
	RD_SEL = 0;
	RF_D_SEL = 0;
	ALU_OP = 0;
	DM_ADDR_SEL = 0;
	ret_enable = 0;

	//************** R-Type Operation BEGIN  ****************//
	if (insType == 0) begin
		case(FUNC)
			0: begin
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 0;
				DM_ADDR_SEL = 0;
			end
			1: begin
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 1;
				DM_ADDR_SEL = 0;
			end
			2: begin
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 2;
				DM_ADDR_SEL = 0;
			end
			3: begin
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 3;
				DM_ADDR_SEL = 0;
			end
			4: begin
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 4;
				DM_ADDR_SEL = 0;
			end
			5: begin // SLL
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 1;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 5;
				DM_ADDR_SEL = 0;
			end
			6: begin //SRL
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 1;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 6;
				DM_ADDR_SEL = 0;
			end
			7: begin
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 1;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 7;
				DM_ADDR_SEL = 0;
			end
			8: begin
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 1;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 8;
			end
			default: begin
				RF_WE = 0;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 0;
				ALU_OP = 15;
				DM_ADDR_SEL = 0;
			end
		endcase
	end

	//************** I-Type Operation BEGIN  ****************//
	if (insType == 2) begin
		case(subOP)
			0: begin
				// ADDI
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 1;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 0;
				DM_ADDR_SEL = 0;
			end
			1: begin
				// SUBI
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 1;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 1;
				DM_ADDR_SEL = 0;
			end
			2: begin
				// ANDI
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 1;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 2;
				DM_ADDR_SEL = 0;
			end
			3: begin
				// ORI
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 1;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 3;
				DM_ADDR_SEL = 0;
			end
			4: begin
				// XORI
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 1;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 4;
				DM_ADDR_SEL = 0;
			end
			5: begin
				// LUI
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 1;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 9;
				DM_ADDR_SEL = 0;
			end
			6: begin
				// LLI
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 1;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 10;
				DM_ADDR_SEL = 0;
			end
			7: begin
				// LWR
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 1;
				ALU_OP = 11;
				DM_ADDR_SEL = 0;
			end
			8: begin
				// SWR
				RF_WE = 0;
				DM_WE = 1;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 12;
				DM_ADDR_SEL = 0;
			end
			9: begin
				// LWI
				RF_WE = 1;
				DM_WE = 0;
				A_SEL = 0;
				B_SEL = 1;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 1;
				ALU_OP = 13;
				DM_ADDR_SEL = 1;
			end
			10: begin
				// SWI
				RF_WE = 1;
				DM_WE = 1;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 0;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 14;
				DM_ADDR_SEL = 1;
			end
			11: begin
				// BEQ
				RF_WE = 1;
				DM_WE = 1;
				A_SEL = 0;
				B_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 1;
				ALU_OP = 1;
				DM_ADDR_SEL = 0;
				if (ALU_Z == 1) begin
					PC_SEL = 1;
				end
			end
			12: begin
				// BNE
				RF_WE = 1;
				DM_WE = 1;
				A_SEL = 0;
				B_SEL = 0;
				RD_SEL = 0;
				RF_D_SEL = 1;
				ALU_OP = 1;
				DM_ADDR_SEL = 0;
				if (ALU_Z == 0) begin
					PC_SEL = 1;
				end
			end
			default: begin
				// UNKNOWN
			end
		endcase
	end

	//************** J-Type Operation BEGIN  ****************//
	if (insType == 1) begin
		case(subOP)
			0: begin   // JUMP to Address
				RF_WE = 1;
				DM_WE = 1;
				A_SEL = 0;
				B_SEL = 0;
				PC_SEL = 2;
				RD_SEL = 1;
				RF_D_SEL = 0;
				ALU_OP = 15;
				DM_ADDR_SEL = 1;
			end
			1: begin   // Jump and link
				RF_WE <= 1;
				DM_WE <= 1;
				A_SEL <= 0;
				B_SEL <= 0;
				RD_SEL <= 2;
				RF_D_SEL <= 2;
				PC_SEL <= 2;
				ALU_OP <= 16;
				DM_ADDR_SEL <= 1;
			end
			2: begin    // Return
				ret_enable = 1;
				RF_WE = 1;
				DM_WE = 1;
				A_SEL = 0;
				B_SEL = 0;
				RD_SEL = 2;
				RF_D_SEL = 0;
				PC_SEL = 3;
				ALU_OP = 17;
				DM_ADDR_SEL = 1;
			end
			default: begin
			
			end
		endcase
	end

end


endmodule
