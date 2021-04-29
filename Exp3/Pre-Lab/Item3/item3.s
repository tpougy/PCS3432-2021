@ compilar: gcc <nome do arquivo>
@ degubb: gdb <nome do arquivo

	.text
	.globl main
main:
	LDR	r0, =0xFFFFFFFF
	LDR r1, =0x12345678
	LDR r2, =0xFFFFFFFF
	LDR r3, =0x12345678
	BL	firstfunc    				
	SWI	0x123456     		
firstfunc:
	@ criando um valor (qualquer) de 64 bits em r4 e r5
	@ {r4,r5} = r0 x r1
	UMULL r4, r5, r0, r1 

	@ criando um valor (qualquer) de 64 bits em r6 e r7
	@ {r6,r7} = r2 x r3
	UMULL r6, r7, r2, r3 

	@ compara o valor dos registradores com os bits mais significativos
	CMP r5, r7 

	@ usa o condicionador EQ -> SE Z ESTIVER SETADO então CMP
	CMPEQ r4, r6 
	MOV	pc, lr
	