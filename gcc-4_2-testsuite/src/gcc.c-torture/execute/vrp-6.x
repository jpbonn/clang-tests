load_lib target-supports.exp

if { [check_effective_target_int16] } {
	return 1
}

# mico32 currently does not support libraries.
if { [istarget "mico32-*-elf"] } {
    set torture_compile_xfail "mico32-*-elf"
}

return 0;
