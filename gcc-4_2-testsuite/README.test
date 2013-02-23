
Install qemu from the source tree.
See directions on the wiki:
http://www.milkymist.org/wiki/index.php?title=Using_QEMU

build and install the lm32 gcc toolchain.

set the PATH to include qemu-wrapper (this directory).

Also the GCC lm32 toolchain is needed for the assembler and linker which are both invoked through the compiler.  Therefore lm32-rtems-gcc needs to be on your PATH.

Install dejagnu:
sudo apt-get install dejagnu


make -f Makefile.mico32 check-gcc


To test with Musl C library:

cp musl.ld linker.ld
make -f Makefile.musl
