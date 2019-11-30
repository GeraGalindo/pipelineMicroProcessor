onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label ADDRESS -radix hexadecimal /iFetch_TestBench/DUT_INST_FETCH/instructionMemory/ADDRESS
add wave -noupdate -label FUNC /iFetch_TestBench/DUT_INST_FETCH/instructionMemory/FUNC
add wave -noupdate -label OPCODE /iFetch_TestBench/DUT_INST_FETCH/instructionMemory/OPCODE
add wave -noupdate -label RS -radix unsigned /iFetch_TestBench/DUT_INST_FETCH/instructionMemory/RS
add wave -noupdate -label RT -radix unsigned /iFetch_TestBench/DUT_INST_FETCH/instructionMemory/RT
add wave -noupdate -label RD -radix unsigned /iFetch_TestBench/DUT_INST_FETCH/instructionMemory/RD
add wave -noupdate -divider {iFETCH Inputs}
add wave -noupdate -label IF_ret_enable -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_ret_enable
add wave -noupdate -label IF_RF_D_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_RF_D_SEL
add wave -noupdate -label IF_DM_WE -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_DM_WE
add wave -noupdate -label IF_A_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_A_SEL
add wave -noupdate -label IF_B_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_B_SEL
add wave -noupdate -label IF_RF_WE -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_RF_WE
add wave -noupdate -label IF_RD_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_RD_SEL
add wave -noupdate -label IF_ALU_OP -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_ALU_OP
add wave -noupdate -label IF_DM_ADDR_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_DM_ADDR_SEL
add wave -noupdate -label IF_INSTRUCTION -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/IF_INSTRUCTION
add wave -noupdate -divider {iDECODE Stage}
add wave -noupdate -label ID_ret_enable /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_ret_enable
add wave -noupdate -label ID_RF_D_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_RF_D_SEL
add wave -noupdate -label ID_DM_WE -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_DM_WE
add wave -noupdate -label ID_A_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_A_SEL
add wave -noupdate -label ID_B_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_B_SEL
add wave -noupdate -label ID_RF_WE -radix unsigned /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_RF_WE
add wave -noupdate -label ID_RD_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_RD_SEL
add wave -noupdate -label ID_ALU_OP -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_ALU_OP
add wave -noupdate -label ID_DM_ADDR_SEL -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_DM_ADDR_SEL
add wave -noupdate -label ID_INSTRUCTION -radix decimal /iFetch_TestBench/DUT_INST_FETCH/IF_ID_REGISTER/ID_INSTRUCTION
add wave -noupdate -label A_MUX/OUT -radix unsigned /iFetch_TestBench/DUT_INST_FETCH/A_MUX/OUT
add wave -noupdate -label B_MUX/OUT -radix unsigned /iFetch_TestBench/DUT_INST_FETCH/B_MUX/OUT
add wave -noupdate -label RF_rd_MUX/OUT -radix unsigned /iFetch_TestBench/DUT_INST_FETCH/RF_rd_MUX/OUT
add wave -noupdate -label {R[31]} -radix unsigned {/iFetch_TestBench/DUT_INST_FETCH/regFile/reg_file[31]}
add wave -noupdate -divider {EXECUTE Stage}
add wave -noupdate -label ID_muxA -radix decimal /iFetch_TestBench/DUT_INST_FETCH/ID_EX_REGISTER/ID_muxA
add wave -noupdate -label ID_muxB -radix decimal /iFetch_TestBench/DUT_INST_FETCH/ID_EX_REGISTER/ID_muxB
add wave -noupdate -label EX_ALU_OP -radix decimal /iFetch_TestBench/DUT_INST_FETCH/ID_EX_REGISTER/EX_ALU_OP
add wave -noupdate -label EX_muxA -radix decimal /iFetch_TestBench/DUT_INST_FETCH/ID_EX_REGISTER/EX_muxA
add wave -noupdate -label EX_muxB -radix decimal /iFetch_TestBench/DUT_INST_FETCH/ID_EX_REGISTER/EX_muxB
add wave -noupdate -label {ALU A} /iFetch_TestBench/DUT_INST_FETCH/alu/A
add wave -noupdate -label {ALU B} /iFetch_TestBench/DUT_INST_FETCH/alu/B
add wave -noupdate -label ALU_OP /iFetch_TestBench/DUT_INST_FETCH/alu/OP
add wave -noupdate -label ALU_RESULT /iFetch_TestBench/DUT_INST_FETCH/alu/RESULT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {75500 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 161
configure wave -valuecolwidth 96
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {62500 ps} {123100 ps}
