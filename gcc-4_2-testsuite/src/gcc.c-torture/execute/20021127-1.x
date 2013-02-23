set additional_flags "-std=c99"

# This is a gcc-ism and the behavior is undefined.
# See bug http://llvm.org/bugs/show_bug.cgi?id=9556
if { [istarget "lm32-*-*"] } {
    set torture_execute_xfail "lm32-*-*"
}
return 0
