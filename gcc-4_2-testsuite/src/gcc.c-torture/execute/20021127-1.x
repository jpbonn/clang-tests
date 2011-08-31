set additional_flags "-std=c99"

# This is a gcc-ism and the behavior is undefined.
# See bug http://llvm.org/bugs/show_bug.cgi?id=9556
if { [istarget "mico32-*-elf"] } {
    set torture_compile_xfail "mico32-*-elf"
}
return 0
