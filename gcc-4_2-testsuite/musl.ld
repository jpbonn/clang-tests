/*
 * LM32 linker script for GCC C testsuite using musl C library
 * running on QEMU.
 */
OUTPUT_FORMAT("elf32-lm32")
ENTRY(_start)

__DYNAMIC = 0;

/* force inclusion of crt1.o from musl C library */
STARTUP ( crt1.o )

MEMORY {
	ram : ORIGIN = 0x08000000, LENGTH = 0x04000000  /* 64M */
}

SECTIONS
{

	.text :
	{
		_ftext = .;
		*(.boot)
		*(.text.crt1 .text.crti .text .stub .text.* .gnu.linkonce.t.* .text.crtn)
		_etext = .;
	} > ram

	.rodata :
	{
		. = ALIGN(4);
		_frodata = .;
		*(.rodata .rodata.* .gnu.linkonce.r.*)
		*(.rodata1)
		_erodata = .;
	} > ram

	.data :
	{
		. = ALIGN(4);
		_fdata = .;
		*(.data .data.* .gnu.linkonce.d.*)
		*(.data1)
		_gp = ALIGN(16);
		*(.sdata .sdata.* .gnu.linkonce.s.*)
		_edata = .;
	} > ram

	.bss :
	{
		. = ALIGN(4);
		_fbss = .;
		*(.dynsbss)
		*(.sbss .sbss.* .gnu.linkonce.sb.*)
		*(.scommon)
		*(.dynbss)
		*(.bss .bss.* .gnu.linkonce.b.*)
		*(COMMON)
                /* The initialization code assumes the end of .bss is aligned. */
                . = ALIGN(4);
		_ebss = .;
		_end = .;
	} > ram
}

PROVIDE(_fstack = ORIGIN(ram) + LENGTH(ram) - 4);

