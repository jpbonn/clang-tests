# APPLE LOCAL file radar 4204303
# skip for -fomit-frame-pointer
if { [istarget "*-*-darwin*"] } {
	set additional_flags "-fno-omit-frame-pointer"
}

# mico32 currently does not support libraries.
if { [istarget "mico32-*-elf"] } {
    set torture_compile_xfail "mico32-*-elf"
}

return 0
