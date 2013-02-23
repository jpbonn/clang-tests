# sprintf() does not support %f on m6811/m6812 target.
if { [istarget "m6811-*-*"] || [istarget "m6812-*-*"]} {
	return 1
}
# lm32 currently does not support libraries.
if { [istarget "lm32-*-elf"] } {
    set torture_compile_xfail "lm32-*-elf"
}
return 0
