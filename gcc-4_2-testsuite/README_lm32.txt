
Install qemu from the source tree.
See directions on the wiki:
http://www.milkymist.org/wiki/index.php?title=Using_QEMU
On OS X macports is the easiest way to obtain qemu.

build and install the lm32 gcc toolchain.

set the PATH to include qemu-wrapper (this directory).

Also the GCC lm32 toolchain is needed for the assembler and linker which are both invoked through the compiler.  Therefore lm32-elf-gcc tools needs to be on your PATH.

Install dejagnu:
sudo apt-get install dejagnu


make -f Makefile.mico32 check-gcc


To test with Musl C library:

cp musl.ld linker.ld
make -f Makefile.musl


To run single test directly on QEMU for debugging:
qemu-wrapper -M lm32-evr -nographic -semihosting -net none -kernel /<path>/clang-tests/gcc-4_2-testsuite/obj/20000112-1.x6

ctrl-a x  exits qemu.

Add "-s -S" to use GDB. Connect GDB with "target remote localhost:1234"
