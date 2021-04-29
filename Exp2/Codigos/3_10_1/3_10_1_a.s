@gcc -o (nome) (arquivo).s para compilar
@gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint, 
@r para dar run, s para step, c para continue, 

	.text					
	.globl main				
main:						
	LDR	r0, =0xFFFF0000
	LDR	r1, =0x87654321
	BL	firstfunc    
	
	SWI	0x123456		
firstfunc:
	ADDS	r2, r0, r1		
	MOV	pc, lr	     
