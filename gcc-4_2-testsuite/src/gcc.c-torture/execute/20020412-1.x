# lm32 currently does not support 'variable length array in structure'.
if { [istarget "lm32-*-elf"] } {
    set torture_compile_xfail "lm32-*-elf"
}
return 0
