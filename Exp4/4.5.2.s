@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 
        ADR     r0, x               @ r0 = x
        ADR     r1, y               @ r1 = y
        ADR     r2, array           @ r2 = array[0]


    @ pre-index
        LDR     r3, [r2, #20]       @ r3 = array[5] (r2 nao se altera)
        LDR     r4, [r1]            @ r4 = valor da posicao r1 (y)
        ADD     r3, r3, r4          @ r3 = r3 + r1 -> r3 = r3 + y
        STR     r3, [r0]            @ conteudo de r3 eh stored na posicao r0 da memoria (x)
        STR     r3, [r2, #40]       @ conteudo de r3 eh stored em array[10]


    @ post-index
        LDR     r9, [r2], #20       @ r9 = array[0] (r2 eh alterado para array[5]) r9 se torna o ponteiro para inicio do array
        LDR     r6, [r2]            @ r6 recebe valor da posicao r2 da memoria (array[5])
        LDR     r7, [r1]            @ r7 recebe valor da posicai r1 da memoria (y)
        ADD     r8, r6, r7          @ r8 = mem(r2) + mem(r1) -> r4 = array[5] + y
        STR     r8, [r0]            @ conteudo de r8 eh stored na posicao r0 da memoria (x)
        STR     r8, [r2, #20]       @ conteudo de r8 eh stored em array[10]

        SWI     0x123456

x:
    .word   0x1

y:
    .word   0x2

array:
    .Word   0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
