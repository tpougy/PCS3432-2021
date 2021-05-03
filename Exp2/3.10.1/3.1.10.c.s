	.text
 	.globl main
main:
 	LDR     r0, =0x67654321
 	LDR     r1, =0x23110000
 	BL      firstfunc
 	SWI     0x123456
firstfunc:
 	ADDS    r2, r0, r1
 	MOV     pc, lr
