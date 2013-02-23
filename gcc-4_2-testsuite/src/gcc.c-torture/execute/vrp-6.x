load_lib target-supports.exp

if { [check_effective_target_int16] } {
	return 1
}

# lm32 currently does not support libraries.
if { [istarget "lm32-*-elf"] } {
    set torture_compile_xfail "lm32-*-elf"
}

return 0;
