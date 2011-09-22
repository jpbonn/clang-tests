
.macro test_name name
	.data
tn_\name:
	.asciz "\name"
	.text
	mvhi r13, hi(tn_\name)
	ori r13, r13, lo(tn_\name)
	mvhi r12, hi(0xffff0000)      # base address of test block
	ori r12, r12, lo(0xffff0000)
	sw (r12+8), r13
.endm

.macro tc_pass
	mvi r13, 0
	mvhi r12, hi(0xffff0000)      # base address of test block
	ori r12, r12, lo(0xffff0000)
	sw (r12+4), r13
.endm

.macro tc_fail
	mvi r13, 1
	mvhi r12, hi(0xffff0000)      # base address of test block
	ori r12, r12, lo(0xffff0000)
	sw (r12+4), r13
.endm

.macro end
	mvhi r12, hi(0xffff0000)      # base address of test block
	ori r12, r12, lo(0xffff0000)
	sw (r12+0), r0                # stop qemu
1:
	bi 1b
.endm

# base +
#  0  ctrl
#  4  pass/fail
#  8  ptr to test name
