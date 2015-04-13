
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
	/* Setup stack and global pointer */
        /* Point to the first unused location so offset the stack by 4 */
	mvhi    sp, hi(_fstack-4)
	ori     sp, sp, lo(_fstack-4)
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
    mvi r12, 0
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

_write:
	addi sp, sp, -4
	sw (sp+4), r8
	mvi r8, 5
	scall
	lw r8, (sp+4)
	addi sp, sp, 4
	ret

_exit:
	mvi r8, 1
	scall
1:
	bi 1b

_tc_pass:
.data
1:
	.ascii "OK\n"
2:
.text
	addi sp, sp, -16
	sw (sp+4), ra
	sw (sp+8), r1
	sw (sp+12), r2
	sw (sp+16), r3
	mvi r1, 1
	mvhi r2, hi(1b)
	ori r2, r2, lo(1b)
	mvi r3, (2b - 1b)
	calli _write
	lw r3, (sp+16)
	lw r2, (sp+12)
	lw r1, (sp+8)
	lw ra, (sp+4)
	addi sp, sp, 16
	ret

_tc_fail:
.data
1:
	.ascii "FAILED\n"
2:
.text
	addi sp, sp, -16
	sw (sp+4), ra
	sw (sp+8), r1
	sw (sp+12), r2
	sw (sp+16), r3
	sw (sp+4), ra
	mvi r1, 1
	mvhi r2, hi(1b)
	ori r2, r2, lo(1b)
	mvi r3, (2b - 1b)
	calli _write
	lw r3, (sp+16)
	lw r2, (sp+12)
	lw r1, (sp+8)
	lw ra, (sp+4)
	addi sp, sp, 16
	ret
