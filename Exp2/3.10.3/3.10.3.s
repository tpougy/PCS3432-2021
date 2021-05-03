	.text
 	.globl main
main:
 	LDR     r0, =0x00000001
 	MOVS    r0, r0, LSL #5
 	SWI     0x123456
