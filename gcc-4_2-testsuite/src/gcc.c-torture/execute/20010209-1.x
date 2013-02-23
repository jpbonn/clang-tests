# lm32 currently does not support nested functions.
if { [istarget "lm32-*-elf"] } {
    set torture_compile_xfail "lm32-*-elf"
}
return 0
