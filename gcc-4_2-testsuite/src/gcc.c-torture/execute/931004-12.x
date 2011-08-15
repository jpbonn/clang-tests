if { [istarget "powerpc-*-darwin*] } {
    # xfail this on powerpc-*-darwin, see PR 15923
    set torture_execute_xfail [istarget]
}

# mico32 currently does not support libraries.
if { [istarget "mico32-*-elf"] } {
    set torture_compile_xfail "mico32-*-elf"
}
return 0
