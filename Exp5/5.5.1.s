@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 
        LDR     r0, =0x00000000         @ variavel i -> comeca em 0
        ADR     r1, vetora              @ index do vetor a -> vetor comeca em 0x0 e termina em 0x7
        ADR     r2, vetorb              @ index do vetor b -> vetor comeca em 0x10 e termina em 0x7

loop:
        CMP     r0, #8                  @ compara r0 com 8
        BGE     fim                     @ se r0 >= 8, vai para "fim"

        RSB     r3, r0, #7              @ faz 7 - i e guarda em r3
        LDRB    r5, [r2, r3]            @ load em r5 do conteudo de r2 (vetor b) com offset de r3
        STRB    r5, [r1, r0]            @ store do conteudo de r5 na posicao r1 da memoria (vetor a), com offset de i

        ADD     r0, r0, #1              @ r0 = r0 +1
        B       loop                    @ volta para o inicio do loop
        
fim:
        LDR     r5, [r2]                @ salva o valor do vetor b em registradores
        LDR     r4, [r2, #4]            @ para mostrar na tela mais facilmente

        LDR     r7, [r1]                @ salva o valor do vetor a em registradores
        LDR     r6, [r1, #4]            @ para mostrar na tela mais facilmente

        SWI     0x123456                @ encerra programa

vetora:
        .byte   0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 

vetorb:
        .byte   0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22 
        
