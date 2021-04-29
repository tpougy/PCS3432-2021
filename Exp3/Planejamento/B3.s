@gcc -o (nome) (arquivo).s para compilar
@gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@r para dar run, s para step, c para continue,

	.text
	.globl main
main:
	LDR	r0, =0xFFFFFFFF    			@definindo um valor de 32 bits em 1 registrador
	LDR	r1, =0x12345677				@definindo um valor de 32 bits em 1 registrador

	LDR	r2, =0xFFFFFFFF				@definindo um valor de 32 bits em 1 registrador
	LDR	r3, =0x12345678				@definindo um valor de 32 bits em 1 registrador

	BL	firstfunc    	
	SWI	0x123456		
firstfunc:
	UMULL	r4, r5, r0, r1			@criando um valor de 64 bits em 2 registradores
	UMULL	r6, r7, r2, r3			@criando um valor de 64 bits em 2 registradores

	CMP	r5, r7						@comparando os valores dos registradores com os 32 bits mais significativos
	CMPEQ	r4, r6					@se o valor dos dois registradores acima forem iguais, compara o valor dos 32 bits menos significativos
									@caso o valor for igual, as flags de cpsr não mudarão,
									@caso o 1 valor for maior que o 2, a flag C de cpsr vai mudar pra 1 (aparece 8000etc)
									@caso o 1 valor for menor que o 2, a flag N de cpsr vai mudar pra 1 (aparece 2000etc)
	MOV	pc, lr	     				
