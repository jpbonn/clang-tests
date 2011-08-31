# Clang currently miscompiles this as varargs with -O0
# see http://llvm.org/bugs/show_bug.cgi?id=10810
# Do not run at -O0.

set torture_eval_before_compile {
if { [istarget "mico32-*-elf"] } {
  if {[string match {*-O0*} "$option"]} {
    set torture_compile_xfail "mico32-*-elf"
  }
}
}

return 0


