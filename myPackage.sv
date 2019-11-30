package myPackage;

typedef enum logic [5:0] { 
	RType = 0,
	JMP = 16,
	JAL = 17,
	RET = 18,
	ADDI = 32,
	SUBI = 33,
	ANDI = 34,
	ORI = 35,
	XORI = 36,
	LUI = 37,
	LLI = 38,
	LWR = 39,
	SWR = 40,
	LWI = 41,
	SWI = 42,
	BEQ = 43,
	BNE = 44
} opcode_t;

typedef enum logic [5:0] { 
	ADD = 0,
	SUB = 1, 
	AND = 2, 
	OR = 3, 
	XOR = 4, 
	SLL = 5, 
	SRL = 6, 
	SLA = 7,
	SRA = 8
} func_t;

endpackage
