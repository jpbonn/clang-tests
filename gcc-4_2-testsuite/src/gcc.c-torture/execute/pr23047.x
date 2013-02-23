set additional_flags "-fwrapv"

# lm32 currently does not support libraries.
if { [istarget "lm32-*-elf"] } {
    set torture_compile_xfail "lm32-*-elf"
}
return 0
