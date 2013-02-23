# APPLE LOCAL file radar 4204303
# skip for -fomit-frame-pointer
if { [istarget "*-*-darwin*"] } {
	set additional_flags "-fno-omit-frame-pointer"
}

# lm32 currently does not support libraries.
if { [istarget "lm32-*-elf"] } {
    set torture_compile_xfail "lm32-*-elf"
}

return 0
