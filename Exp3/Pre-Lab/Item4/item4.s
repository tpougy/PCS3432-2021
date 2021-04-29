@ compilar: gcc <nome do arquivo>
@ degubb: gdb <nome do arquivo

	.text
	.globl main
main:
	LDR	r0, =0x80000001 @32 bits menos significativos
	LDR r1, =0x80000001 @32 bits mais significativos
	BL	firstfunc    				
	SWI	0x123456     		
firstfunc:
	@ shift right em r1 (o bit deslocado é armazenado no carry)
	@ armazena o resultado do shift em r3
	MOVS r3, r1, LSR #1
	
	@ rotate right adicionando o carry
	MOV r2, r0, RRX
	MOV	pc, lr
	