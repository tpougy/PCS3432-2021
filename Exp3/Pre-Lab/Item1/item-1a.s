@ compilar: gcc <nome do arquivo>
@ degubb: gdb <nome do arquivo

	.text
	.globl main
main:
	LDR	r0, =0xFFFFFFFF
	LDR	r1, =0x00000000
	BL	firstfunc    				
	SWI	0x123456     		
firstfunc:
	SUB r11, r12, r3, LSL #32
	MOV	pc, lr
