@gcc -o (nome) (arquivo).s para compilar
@gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@r para dar run, s para step, c para continue,

	.text
	.globl main
main:
        LDR	r0, =0x80000001         @32 bits menos significativos do numero - usar "p/t $r0" para ver seu conteudo em binario
        LDR	r1, =0x80000000		@32 bits mais significativos do numero - usar "p/t $r1" para ver seu conteudo em binario

        BL	firstfunc
        SWI	0x123456		
firstfunc:
        MOV r1, r1, ROR #31     @rotaciona para que o bit a ser perdido no deslocamento (mais a esquerda) fique na ultima posicao 
        MOVS r0, r0, LSL #1      @desloca 1 bit para a esquerda e guarda o bit no carry
        MOV r1, r1, RRX         @desloca 1 bit para a direita, adicionando o carry na posicao mais a esquerda 
        MOV r1, r1, ROR #31     @rotaciona para que o carry adicionado na esquerda volte para a posicao mais a direita

        MOV	pc, lr	     				
