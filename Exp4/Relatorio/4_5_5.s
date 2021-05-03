@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 
        LDR     r0, =0x00000000     @ r0 = f(0) = 0      
        LDR     r1, =0x00000001     @ r1 = f(1) = 1
        LDR     r2, =0x00004000     @ endereco do comeco requisitado
        LDR     r3, =0x0000400B     @ endereco de fim requisitado

        STRB    r0, [r2], #1        @ store de r0 no endereco r2 e atualiza r2
        STRB    r1, [r2], #1        @ store de r1 no novo endereco r2 e atualiza r2

loop:
        ADD     r4, r0, r1          @ Fibonacci: f(n) = f(n-1) + f(n-2)
        STRB    r4, [r2], #1        @ aloca o valor de f(n) no endereco r2 atualizado
        MOV     r0, r1              @ f(n+2) = f(n+1)
        MOV     r1, r4              @ f(n+1) = f(n)

        CMP     r2, r3              @ compara o endereco atual com o fim requisitado
        BLE     loop                @ se o endereco for menor, volta no loop

fim:
        SWI     0x123456            @ encerra o programa
