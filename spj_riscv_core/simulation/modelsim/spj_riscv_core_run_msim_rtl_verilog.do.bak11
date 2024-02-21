transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core {C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core/spj_fp_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core {C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core/spj_riscv_core.v}
vlog -vlog01compat -work work +incdir+C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core {C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core/spj_CAM_v2.v}
vlog -vlog01compat -work work +incdir+C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core {C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core/spj_cache_v.v}
vlog -vlog01compat -work work +incdir+C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core {C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core/spj_cache_4w_v2.v}
vlog -vlog01compat -work work +incdir+C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core {C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core/spj_riscv_ram1.v}

vlog -vlog01compat -work work +incdir+C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core {C:/Users/spjac/OneDrive/Documents/School_Work/EE721-ATDCS/spj_riscv_core/spj_risc_core_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  spj_risc_core_tb

add wave *
view structure
view signals
run -all
