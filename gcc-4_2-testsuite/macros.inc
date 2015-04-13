
.equ MAX_TESTNAME_LEN, 32
.macro test_name name
	.data
tn_\name:
	.ascii "\name"
	.space MAX_TESTNAME_LEN - (. - tn_\name), ' '
	.text
	.global \name
\name:
	addi sp, sp, -12
	sw (sp+4), r1
	sw (sp+8), r2
	sw (sp+12), r3
	mvi r1, 1
	mvhi r2, hi(tn_\name)
	ori r2, r2, lo(tn_\name)
	mvi r3, MAX_TESTNAME_LEN
	calli _write
	lw r3, (sp+12)
	lw r2, (sp+8)
	lw r1, (sp+4)
	addi sp, sp, 12
.endm

.macro tc_pass
	mvi r12, 0
	calli _tc_pass
.endm

.macro tc_fail
	addi r12, r12, 1
	calli _tc_fail
.endm

.macro end
	mv r1, r12
	calli _exit
.endm

# base +
#  0  ctrl
#  4  pass/fail
#  8  ptr to test name
