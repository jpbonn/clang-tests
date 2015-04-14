# Unimplemented - frame index limited to 32767 byte offset.
# This is not currently supported by LM32 clang
if { [istarget "lm32-*-elf"] } {
    set torture_compile_xfail "lm32-*-elf"
}
return 0
