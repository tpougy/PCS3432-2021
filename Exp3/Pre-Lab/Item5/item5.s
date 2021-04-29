	.text
	.globl main
main:
	LDR	r0, =0x80000001 @32 bits mais significativos
	LDR r1, =0x00000001 @32 bits menos significativos
	BL	firstfunc    				
	SWI	0x123456     		
firstfunc:
	MOV r2, r0, LSL #1
	
	@left shit e armazena o bit deslocado no carry
	MOVS r3, r1, LSL #1 

	@soma o carry na posição menos significativa de r2
	ADC r2, r2, #0 
	MOV	pc, lr
	