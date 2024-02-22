onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /spj_risc_core_tb/Resetn_tb
add wave -noupdate /spj_risc_core_tb/Clock_tb
add wave -noupdate -radix hexadecimal /spj_risc_core_tb/SW_in_tb
add wave -noupdate -radix hexadecimal /spj_risc_core_tb/Display_out_tb
add wave -noupdate -radix binary /spj_risc_core_tb/dut/DM_Done
add wave -noupdate -radix binary /spj_risc_core_tb/dut/PM_Done
add wave -noupdate -radix decimal /spj_risc_core_tb/dut/PC
add wave -noupdate -radix hexadecimal /spj_risc_core_tb/dut/PM_out
add wave -noupdate -radix hexadecimal /spj_risc_core_tb/dut/DM_out
add wave -noupdate -radix hexadecimal /spj_risc_core_tb/dut/SP
add wave -noupdate -radix decimal -childformat {{{/spj_risc_core_tb/dut/R[31]} -radix decimal} {{/spj_risc_core_tb/dut/R[30]} -radix decimal} {{/spj_risc_core_tb/dut/R[29]} -radix decimal} {{/spj_risc_core_tb/dut/R[28]} -radix decimal} {{/spj_risc_core_tb/dut/R[27]} -radix decimal} {{/spj_risc_core_tb/dut/R[26]} -radix decimal} {{/spj_risc_core_tb/dut/R[25]} -radix decimal} {{/spj_risc_core_tb/dut/R[24]} -radix decimal} {{/spj_risc_core_tb/dut/R[23]} -radix decimal} {{/spj_risc_core_tb/dut/R[22]} -radix decimal} {{/spj_risc_core_tb/dut/R[21]} -radix decimal} {{/spj_risc_core_tb/dut/R[20]} -radix decimal} {{/spj_risc_core_tb/dut/R[19]} -radix decimal} {{/spj_risc_core_tb/dut/R[18]} -radix decimal} {{/spj_risc_core_tb/dut/R[17]} -radix decimal} {{/spj_risc_core_tb/dut/R[16]} -radix decimal} {{/spj_risc_core_tb/dut/R[15]} -radix decimal} {{/spj_risc_core_tb/dut/R[14]} -radix decimal} {{/spj_risc_core_tb/dut/R[13]} -radix decimal} {{/spj_risc_core_tb/dut/R[12]} -radix decimal} {{/spj_risc_core_tb/dut/R[11]} -radix decimal} {{/spj_risc_core_tb/dut/R[10]} -radix decimal} {{/spj_risc_core_tb/dut/R[9]} -radix decimal} {{/spj_risc_core_tb/dut/R[8]} -radix decimal} {{/spj_risc_core_tb/dut/R[7]} -radix decimal} {{/spj_risc_core_tb/dut/R[6]} -radix decimal} {{/spj_risc_core_tb/dut/R[5]} -radix decimal} {{/spj_risc_core_tb/dut/R[4]} -radix decimal} {{/spj_risc_core_tb/dut/R[3]} -radix decimal} {{/spj_risc_core_tb/dut/R[2]} -radix decimal} {{/spj_risc_core_tb/dut/R[1]} -radix decimal} {{/spj_risc_core_tb/dut/R[0]} -radix decimal}} -subitemconfig {{/spj_risc_core_tb/dut/R[31]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[30]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[29]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[28]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[27]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[26]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[25]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[24]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[23]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[22]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[21]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[20]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[19]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[18]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[17]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[16]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[15]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[14]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[13]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[12]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[11]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[10]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[9]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[8]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[7]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[6]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[5]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[4]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[3]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[2]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[1]} {-height 15 -radix decimal} {/spj_risc_core_tb/dut/R[0]} {-height 15 -radix decimal}} /spj_risc_core_tb/dut/R
add wave -noupdate -divider Instructions
add wave -noupdate -radix hexadecimal /spj_risc_core_tb/dut/IR1
add wave -noupdate -radix hexadecimal /spj_risc_core_tb/dut/IR2
add wave -noupdate -radix hexadecimal /spj_risc_core_tb/dut/IR3
add wave -noupdate -divider {DF Registers}
add wave -noupdate -radix unsigned /spj_risc_core_tb/dut/rs1
add wave -noupdate -radix unsigned /spj_risc_core_tb/dut/rs2
add wave -noupdate -radix unsigned /spj_risc_core_tb/dut/rd_2
add wave -noupdate -divider {ALU Regisgters}
add wave -noupdate -radix decimal /spj_risc_core_tb/dut/TA
add wave -noupdate -radix decimal /spj_risc_core_tb/dut/TB
add wave -noupdate -radix decimal /spj_risc_core_tb/dut/TALUH
add wave -noupdate -radix decimal /spj_risc_core_tb/dut/TALUL
add wave -noupdate -divider {Stall Control}
add wave -noupdate -radix binary /spj_risc_core_tb/dut/stall_mc0
add wave -noupdate -radix binary /spj_risc_core_tb/dut/stall_mc1
add wave -noupdate -radix binary /spj_risc_core_tb/dut/stall_mc2
add wave -noupdate -radix binary /spj_risc_core_tb/dut/stall_mc3
add wave -noupdate -divider {Floating Point}
add wave -noupdate -group {FP Signals} -radix hexadecimal -childformat {{{/spj_risc_core_tb/dut/FP[31]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[30]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[29]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[28]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[27]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[26]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[25]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[24]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[23]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[22]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[21]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[20]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[19]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[18]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[17]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[16]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[15]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[14]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[13]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[12]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[11]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[10]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[9]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[8]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[7]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[6]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[5]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[4]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[3]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[2]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[1]} -radix hexadecimal} {{/spj_risc_core_tb/dut/FP[0]} -radix hexadecimal}} -subitemconfig {{/spj_risc_core_tb/dut/FP[31]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[30]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[29]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[28]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[27]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[26]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[25]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[24]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[23]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[22]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[21]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[20]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[19]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[18]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[17]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[16]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[15]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[14]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[13]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[12]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[11]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[10]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[9]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[8]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[7]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[6]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[5]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[4]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[3]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[2]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[1]} {-height 15 -radix hexadecimal} {/spj_risc_core_tb/dut/FP[0]} {-height 15 -radix hexadecimal}} /spj_risc_core_tb/dut/FP
add wave -noupdate -group {FP Signals} -radix hexadecimal {/spj_risc_core_tb/dut/FP[1]}
add wave -noupdate -group {FP Signals} -radix hexadecimal {/spj_risc_core_tb/dut/FP[0]}
add wave -noupdate -group {FP Signals} -radix hexadecimal /spj_risc_core_tb/dut/fp_x
add wave -noupdate -group {FP Signals} -radix hexadecimal /spj_risc_core_tb/dut/fp_y
add wave -noupdate -group {FP Signals} /spj_risc_core_tb/dut/start_fp_add
add wave -noupdate -group {FP Signals} -radix hexadecimal /spj_risc_core_tb/dut/fp_sum
add wave -noupdate -group {FP Signals} /spj_risc_core_tb/dut/fp_add_valid
add wave -noupdate -divider {PM Cache Signals}
add wave -noupdate -group {PM Cache} /spj_risc_core_tb/dut/pm_cache/FETCH
add wave -noupdate -group {PM Cache} /spj_risc_core_tb/dut/pm_cache/tag
add wave -noupdate -group {PM Cache} /spj_risc_core_tb/dut/pm_cache/group
add wave -noupdate -group {PM Cache} /spj_risc_core_tb/dut/pm_cache/word
add wave -noupdate -group {PM Cache} /spj_risc_core_tb/dut/pm_cache/mm_word_cnt
add wave -noupdate -group {PM Cache} /spj_risc_core_tb/dut/pm_cache/cm_word_cnt
add wave -noupdate -group {PM Cache} -radix binary /spj_risc_core_tb/dut/pm_cache/cam_hit
add wave -noupdate -group {PM Cache} /spj_risc_core_tb/dut/pm_cache/Done
add wave -noupdate -group {PM Cache} /spj_risc_core_tb/dut/pm_cache/early_restart
add wave -noupdate -divider {DM Cache}
add wave -noupdate -group {DM Cache} /spj_risc_core_tb/dut/dm_cache/FETCH
add wave -noupdate -group {DM Cache} -radix binary /spj_risc_core_tb/dut/dm_cache/cam_hit
add wave -noupdate -group {DM Cache} /spj_risc_core_tb/dut/dm_cache/tag
add wave -noupdate -group {DM Cache} /spj_risc_core_tb/dut/dm_cache/group
add wave -noupdate -group {DM Cache} /spj_risc_core_tb/dut/dm_cache/word
add wave -noupdate -group {DM Cache} /spj_risc_core_tb/dut/dm_cache/mm_word_cnt
add wave -noupdate -group {DM Cache} /spj_risc_core_tb/dut/dm_cache/cm_word_cnt
add wave -noupdate -group {DM Cache} /spj_risc_core_tb/dut/dm_cache/Done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {540000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {460800 ps} {972800 ps}
