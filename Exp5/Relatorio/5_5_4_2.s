@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

	.text
	.globl main

main:
    LDR     r8, =0b101                  @ valor Y
    LDR     r9, =0x3                    @ tamanho de Y
    LDR     r1, =0x5555AAAA             @ valor X
    LDR     r11, =0x20                  @ tamanho X
    MOV     r10, r1                     @ copia r1 em r10     
    LDR     r2, =0x0                    @ saida
    LDR     r3, =0x0                    @ variavel i
    LDR     r4, =0x0                    @ reg que guarda a seq de r9 bits de X

    MOV     r0, r8                      @ copia Y em r0

    RSB     r6, r9, #32                 @ r6 = 32 - r9

    RSB     r12, r11, #32               @ r12 = r11 - 32 
    MOV     r10, r10, LSL r12           @ shift left de (32-r9) bits

cria_reg:
    CMP     r3, r9                      @ compara para carregar r9 bits no reg a ser comparado
    BGE     para_esquerda               @ sai do loop se já carregou os r9 bits
    ADD     r3, r3, #1                  @ i++
    MOV     r5, r3                      @ r5 = r3 (j = i) para utilizar na funcao compara_desloca

    MOV     r2, r2, LSL #1              @ coloca 0 na saida

    MOVS    r10, r10, LSL #1            @ coloca bit mais a esquerda de X no carry               
    MOV     r4, r4, LSL #1              @ shift left r4
    ADC     r4, r4, #0                  @ coloca o carry em r4

    B       cria_reg                    @ loop da funcao

para_esquerda:                          @ insere os valores para a esquerda do reg
    CMP     r3, #32                     @ compara i com 32
    BGE     compara_desloca             @ se i >= 32, sai da funcao

    ADD     r3, r3, #1                  @ i++
    MOV     r4, r4, LSL #1              @ shift left de r4
    MOV     r0, r0, LSL #1              @ shift left de r0
    B       para_esquerda               @ loop da funcao

compara_desloca:                        @ compara e desloca, colocando o novo carry
    CMP     r4, r0                      @ compara o reg com Y
    ADDEQ   r2, r2, #1                  @ se reg = Y, coloca 1 na saida

    CMP     r5, #32                     @ compara j com 32
    BGE     fim                         @ se j >= 32, terminou de ver X e vai para fim

    MOV     r2, r2, LSL #1              @ coloca 0 na saida

    ADD     r5, r5, #1                  @ j++

    MOVS    r10, r10, LSL #1            @ coloca o ultimo bit de X no carry

    LDR     r7, =0x0                    @ cria/reseta r7 - reg auxiliar
    ADC     r7, r7, #0                  @ adiciona carry em r7
    MOV     r7, r7, LSL r6              @ shift left de r9-1 bits

    MOV     r4, r4, LSL #1              @ desloca r4 para a direita
    ADD     r4, r4, r7                  @ r4 = r4 + r7 (coloca o prox bit no limite esquerdo )

    B compara_desloca                   @ loop da funcao

fim:
    SWI     0x123456



