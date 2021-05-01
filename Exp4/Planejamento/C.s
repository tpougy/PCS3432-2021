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
        LDR     r1, =0x00000000         @ index do vetor a -> vetor comeca em 0x0 e termina em 0x7
        LDR     r2, =0x00000010         @ index do vetor b -> vetor comeca em 0x10 e termina em 0x17

        LDR     r4, =0xAA               @ conteudo do vetor b
        LDR     r6, =0xBB               @ conteudo do vetor b
        LDR     r7, =0xCC               @ conteudo do vetor b
        LDR     r8, =0xDD               @ conteudo do vetor b
        LDR     r9, =0xEE               @ conteudo do vetor b
        LDR     r10, =0xFF              @ conteudo do vetor b
        LDR     r11, =0x11              @ conteudo do vetor b
        LDR     r12, =0x22              @ conteudo do vetor b

        STRB    r4, [r2]                @ 0x0 = 0xAA     
        STRB    r6, [r2, #1]            @ 0x1 = 0xBB
        STRB    r7, [r2, #2]            @ 0x2 = 0xCC
        STRB    r8, [r2, #3]            @ 0x3 = 0xDD                 
        STRB    r9, [r2, #4]            @ 0x4 = 0xEE
        STRB    r10, [r2, #5]           @ 0x5 = 0xFF
        STRB    r11, [r2, #6]           @ 0x6 = 0x11
        STRB    r12, [r2, #7]           @ 0x7 = 0x22


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
