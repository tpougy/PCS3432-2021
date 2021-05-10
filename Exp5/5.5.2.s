@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 

factorial:
        LDR     r6, =0x0000000A         @ load de 10 (n) em r6
        MOV     r4, r6                  @ copia n em um reg temporario

loop:
        SUBS    r4, r4, #1              @ r4 = r4 - 1
        MULNE   r6, r4, r6              @ r6 = r4*r6 
        BNE     loop                    @ caso  volta para loop

        SWI     0x123456                @ encerra programa

