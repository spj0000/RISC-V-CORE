set_global_assignment -entity "spj_fp_add" -library "lib_spj_fp_add" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "spj_fp_add" -library "lib_spj_fp_add" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "spj_fp_add" -library "lib_spj_fp_add" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_spj_fp_add" -name SPD_FILE [file join $::quartus(sip_path) "spj_fp_add.spd"]

set_global_assignment -library "lib_spj_fp_add" -name MISC_FILE [file join $::quartus(sip_path) "spj_fp_add_sim/spj_fp_add.vo"]
