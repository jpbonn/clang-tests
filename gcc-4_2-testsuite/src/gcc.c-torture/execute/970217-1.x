# this is currently a bug in clang 
# http://llvm.org/bugs/show_bug.cgi?id=9559

if { [istarget "mico32-*-*"] } {
      set torture_execute_xfail "mico32-*-*"
}

return 0

