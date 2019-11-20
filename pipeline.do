onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Instruction
add wave -noupdate -label instruction /pipeline_tb/instruction
add wave -noupdate -label clk /pipeline_tb/clk
add wave -noupdate -label OPCODE /pipeline_tb_sv_unit::OP
add wave -noupdate -label SA -radix decimal /pipeline_tb/SA
add wave -noupdate -label RS -radix unsigned /pipeline_tb/RS
add wave -noupdate -label RT -radix unsigned /pipeline_tb/RT
add wave -noupdate -label RD -radix decimal /pipeline_tb/RD
add wave -noupdate -label FUNC /pipeline_tb_sv_unit::FUNC
add wave -noupdate -label IMMEDIATE -radix decimal /pipeline_tb/IMMEDIATE
add wave -noupdate -divider {REGISTER FILE}
add wave -noupdate -label RegFile -childformat {{{/pipeline_tb/dutPipeline/regFile/reg_file[0]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[1]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[2]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[3]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[4]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[5]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[6]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[7]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[8]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[9]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[10]} -radix decimal} {{/pipeline_tb/dutPipeline/regFile/reg_file[30]} -radix unsigned} {{/pipeline_tb/dutPipeline/regFile/reg_file[31]} -radix unsigned}} -subitemconfig {{/pipeline_tb/dutPipeline/regFile/reg_file[0]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[1]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[2]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[3]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[4]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[5]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[6]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[7]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[8]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[9]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[10]} {-height 15 -radix decimal} {/pipeline_tb/dutPipeline/regFile/reg_file[30]} {-height 15 -radix unsigned} {/pipeline_tb/dutPipeline/regFile/reg_file[31]} {-height 15 -radix unsigned}} /pipeline_tb/dutPipeline/regFile/reg_file
add wave -noupdate -divider ALU
add wave -noupdate -label A -radix unsigned /pipeline_tb/dutPipeline/iALU/A
add wave -noupdate -label B -radix unsigned /pipeline_tb/dutPipeline/iALU/B
add wave -noupdate -label OP -radix unsigned /pipeline_tb/dutPipeline/iALU/OP
add wave -noupdate -label RESULT -radix decimal /pipeline_tb/dutPipeline/iALU/RESULT
add wave -noupdate -label Z /pipeline_tb/dutPipeline/iALU/Z
add wave -noupdate -divider {DATA MEMORY}
add wave -noupdate -label MEMORY /pipeline_tb/dataMem/memory
add wave -noupdate -divider PC
add wave -noupdate -label {Next Address} -radix decimal /pipeline_tb/dutPipeline/pc/Q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {90000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 209
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
WaveRestoreZoom {15200 ps} {199200 ps}
