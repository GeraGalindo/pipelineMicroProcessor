package aluPkg;

typedef enum logic [4:0] { 
	ADD = 0,
	SUB = 1, 
	AND = 2, 
	OR = 3, 
	XOR = 4, 
	SLL = 5, 
	SRL = 6, 
	SLA = 7,
	SRA = 8,
	LUI = 9,
	LLI = 10
} aluop_t;

endpackage

