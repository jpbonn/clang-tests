# mico32 currently does not support nested functions.
if { [istarget "mico32-*-elf"] } {
    set torture_compile_xfail "mico32-*-elf"
}
return 0
