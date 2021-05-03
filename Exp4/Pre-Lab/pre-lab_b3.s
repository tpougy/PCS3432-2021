@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main:  
        LDR     r0, =0x4000             @ atribuindo um valor para r0
        LDR     r3, =0x20               @ atribuindo um valor para r3
        STR     r0, [r3]                @ alocando na posicao "r3" da memoria o valor de r0
    
        LDR     r1, =0x20               @ atribuindo um valor para r1
        LDR     r4, =0x50               @ atribuindo um valor para r4
        STR     r1, [r4]                @ alocando na posicao "r4" da memoria o valor de r1


        LDR     r9, =0xFFF              @ atribuindo uma valor para r9
        STRB    r9, [r3, r4]            @ alocando um Byte (8 Bits) de r9 na posicao "r3" da memoria, com um offset de "r4"
                                        @ neste exemplo, estamos alocando "FF" na posicao 0x70 (0x20 + 0x50)


        LDR     r2, =0xA                @ atribuindo um valor para r2
        LDR     r5, =0x2A0              @ atribuindo um valor para r5 (672)
        STR     r2, [r5]                @ alocando na posicao "r5" da memoria o valor de r2
        LDRB    r8, [r3, r4, LSL #3]    @ load de um Byte (8 Bits) em r8 do valor alocado na posicao "r3" da memoria, com offset de r4 apos um shift-left de 3 bits
                                        @ neste exemplo, r8 esta recebendo o primeiro Byte do valor da posicao 672 da memoria (0x20 (32) + 0x50 (80) x 8), que vale 0xA


        LDR     r7, [r3], r4            @ load em r7 do valor alocado na posicao "r3" da memoria (0x4000), alterando o valor de r3 por um offset de "r4"
                                        @ neste exemplo, r3 (0x20) sofre uma adicao de r4 (0x50) (32 + 80 = 112 = 0x70)


        LDR     r6, =0xC                @ atribuindo um valor para r6
        STRB    r6, [r3], r4, ASR #2    @ alocando um Byte (8 Bits) de r6 na posicao "r3" da memoria, alterando o valor de r3 por um offset de
                                        @ r4 apos ter sofrido um arithmetic shift right de 2 bits
                                        @ neste exemplo, a posicao r3 da memoria (0x70 apos a mudanca acima) recebe o conteudo de r6 (0xC),
                                        @ e o valor de r3 (0x70 ou 112) eh alterado por um offset de (0x14 ou 20), se tornando 0x84 ou 132

        SWI     0x123456
