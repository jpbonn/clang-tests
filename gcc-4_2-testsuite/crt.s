
.include "macros.inc"

.text
.global _start

_start:
_reset_handler:
	xor r0, r0, r0
	mvhi r1, hi(_start)
	ori r1, r1, lo(_start)
	wcsr eba, r1
	wcsr deba, r1
	bi _init
	nop
	nop

_breakpoint_handler:
	ori r25, r25, 1
	addi ra, ba, 4
	ret
	nop
	nop
	nop
	nop
	nop

_instruction_bus_error_handler:
	ori r25, r25, 2
	addi ra, ea, 4
	ret
	nop
	nop
	nop
	nop
	nop

_watchpoint_handler:
	ori r25, r25, 4
	addi ra, ba, 4
	ret
	nop
	nop
	nop
	nop
	nop

_data_bus_error_handler:
	ori r25, r25, 8
	addi ra, ea, 4
	ret
	nop
	nop
	nop
	nop
	nop

_divide_by_zero_handler:
	ori r25, r25, 16
	addi ra, ea, 4
	ret
	nop
	nop
	nop
	nop
	nop

_interrupt_handler:
	ori r25, r25, 32
	addi ra, ea, 4
	ret
	nop
	nop
	nop
	nop
	nop

_system_call_handler:
	ori r25, r25, 64
	addi ra, ea, 4
	ret
	nop
	nop
	nop
	nop
	nop

.global _init
_init:
	start
	/* Setup stack and global pointer */
	mvhi    sp, hi(_fstack)
	ori     sp, sp, lo(_fstack)
	mvhi    gp, hi(_gp)
	ori     gp, gp, lo(_gp)

	/* Clear BSS */
	mvhi    r1, hi(_fbss)
	ori     r1, r1, lo(_fbss)
	mvhi    r3, hi(_ebss)
	ori     r3, r3, lo(_ebss)
.clearBSS:
	be      r1, r3, .callMain
	sw      (r1+0), r0
	addi    r1, r1, 4
	bi      .clearBSS

.callMain:

        test_name MAIN
	mvi r1, 0
	mvi r2, 0
	calli main
.global exit
exit:
	be r0, r1, _pass
.global abort
abort:
        tc_fail
	bi _halt
_pass:
	tc_pass
_halt:
	end
	and r0,r0,r0
	bi _halt
