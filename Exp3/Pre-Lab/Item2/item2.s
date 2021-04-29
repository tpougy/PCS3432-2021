@ compilar: gcc <nome do arquivo>
@ degubb: gdb <nome do arquivo

	.text
	.globl main
main:
	LDR	r0, =0x00000001
	BL	firstfunc    				
	SWI	0x123456     		
firstfunc:
	@ deslocamento de 7 bits (multiplicação por 128)
	MOV r1, r0, LSL #7
	@ adicao do valor anterior com o valor de r0 deslocado de 2 bits 
	@ (multiplicação por 4) -> 128x + 4x = 132x
	ADD	r1, r1, r0, LSL #2 

	@ deslocamento de 8 bits (multiplicação por 256)
	MOV r1, r0, LSL #8 
	@ subtracao do valor anterior com o valor de r0 deslocado de 0 bits
	@ 256x - 1x = 255x
	SUB	r1, r1, r0 

	@ deslocamento de 4 bits (multiplicação por 16)
	MOV r1, r0, LSL #4 
	@ adicao do valor anterior com o valor de r0 deslocado de 1 bits
	@ 16x + 2x = 18x
	ADD	r1, r1, r0, LSL #1

	@ deslocamento de 14 bits (multiplicação por 16384)
	@ 16384x
	MOV r1, r0, LSL #14 