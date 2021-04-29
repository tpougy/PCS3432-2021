@gcc -o (nome) (arquivo).s para compilar
@gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint, 
@r para dar run, s para step, c para continue, 

	.text
	.globl main
main:
	LDR	r0, =0x00000001	     
	MOVS	r0, r0, LSL #5	

	SWI	0x123456		
