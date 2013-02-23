if { [istarget "powerpc-*-darwin*] } {
    # xfail this on powerpc-*-darwin, see PR 15923
    set torture_execute_xfail [istarget]
}

# lm32 currently does not support libraries.
if { [istarget "lm32-*-elf"] } {
    set torture_compile_xfail "lm32-*-elf"
}
return 0
