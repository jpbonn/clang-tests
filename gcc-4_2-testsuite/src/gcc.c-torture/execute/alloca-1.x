# Alloca will be at least 4 byte aligned but there is no
# guarantee of higher alignment on Mico32.
# In this particular test BIGGEST_ALIGNMENT is 16.
# 
if { [istarget "lm32-*-*"] } {
      set torture_execute_xfail "lm32-*-*"
}

return 0

