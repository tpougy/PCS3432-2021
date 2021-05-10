@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 
        LDR     r0, =0b10000001000000100000100010000001     @ 6 "uns"
        LDR     r1, =0x0                @ variavel que determina a paridade
        LDR     r2, =0x0                @ registrador que vai se atualizando com os bits
        LDR     r3, =0x0                @ variavel i

        MOVS    r0, r0, LSR #1          @ colocando o ultimo bit de r0 no carry
        ADC     r1, r1, #0              @ colocando o carry em r1

        MOVS    r0, r0, LSR #1          @ colocando o ultimo bit de r0 no carry
        ADC     r2, r2, #0              @ colocando o carry em r2

        EOR     r1, r1, r2              @ r1 = r1 XOR r2

loop:
        CMP     r3, #30                 @ compara i com 30
        BGE     fim

        LDR     r2, =0x0                @ resetando o valor de r2
        MOVS    r0, r0, LSR #1          @ colocando o ultimo bit de r0 no carry
        ADC     r2, r2, #0              @ colocando o carry em r2

        EOR     r1, r1, r2              @ r1 = r1 XOR r2

        ADD     r3, r3, #1              @ i++
        B       loop                    @ volta pro loop

fim:    
        SWI     0x123456                @ encerra programa

