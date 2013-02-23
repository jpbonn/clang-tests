# this is currently a bug in clang 
# http://llvm.org/bugs/show_bug.cgi?id=9559

if { [istarget "lm32-*-*"] } {
      set torture_execute_xfail "lm32-*-*"
}

return 0

