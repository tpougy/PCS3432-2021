@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 
        LDR     r0, =0x00000000     @ r0 eh a variavel i             
        ADR     r1, vetora          @ declarando o vetor a e atribuindo r1 como seu ponteiro
        ADR     r2, vetorb          @ declarando o vetor b e atribuindo r2 como seu ponteiro
        LDR     r4, =0x0000000A     @ r4 = c = 10

loop:
        CMP     r0, #40             @ compara r0 com 10 (40 pois usamos word)
        BGT     fim                 @ se r0 > 10, vai para fim

        LDR     r5, [r2, r0]        @ load do vetor b em r5, com offset de r0

        ADD     r3, r5, r4          @ r3 = r5 + r4(c)

        STR     r3, [r1, r0]        @ store de r3 no vetor a com offset de r0

        ADD     r0, r0, #4          @ r0 = r0 + 1 (4 pois estamos usando word (x4))
        B       loop                @ volta pro comeco do loop

fim:
        SWI     0x123456            @ encerra o programa


vetora:
    .word   0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0

vetorb:
    .word   0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xA

