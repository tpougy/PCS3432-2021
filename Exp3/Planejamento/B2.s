@gcc -o (nome) (arquivo).s para compilar
@gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@r para dar run, s para step, c para continue,

	.text
	.globl main
main:
	LDR	r0, =0x00000002  
	BL	firstfunc    	
	SWI	0x123456		
firstfunc:
	MOV	r1, r0, LSL #7				@deslocamento de 7 bits (multiplicacao por 128)
	ADD	r1, r1, r0, LSL #2			@adicao do valor anterior com o valor de r0 deslocado de 2 bits (multiplicado por 4) -> 128x + 4x = 132x

	MOV	r2, r0, LSL #8				@deslocamento de 8 bits (multiplicacao por 256)
	SUB	r2, r2, r0					@subtracao do valor anterios com o valor de r0 deslocado de 0 bits (multiplicado por 1) -> 256x - 1x = 255x

	MOV	r3, r0, LSL #4				@deslocamento de 4 bits (multiplicacao por 16)
	ADD	r3, r3, r0, LSL #1			@adicao do valor anterior com o valor de r0 deslocado de 1 bit (multiplicado por 2) -> 16x + 2x = 18x

	MOV	r4, r0, LSL #14				@deslocamento de 14 bits multiplicacao por 16384) -> 16384x

	MOV	pc, lr	     
