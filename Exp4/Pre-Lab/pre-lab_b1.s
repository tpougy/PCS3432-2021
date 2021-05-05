@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 
        LDRB     r0, =0x24      @ atribuindo um valor para r0
        LDRB     r1, =0x06      @ atribuindo um valor para r1
        STRB     r1, [r0]       @ alocando o valor de r1 na posicao "r10" da memoria

        LDRB     r2, =0x25      @ atribuindo um valor para r2        
        LDRB     r3, =0xFC      @ atribuindo um valor para r3
        STRB     r3, [r2]       @ alocando o valor de r3 na posicao "r2" da memoria

        LDRB     r4, =0x26      @ atribuindo um valor para r4        
        LDRB     r5, =0x03      @ atribuindo um valor para r5
        STRB     r5, [r4]       @ alocando o valor de r5 na posicao "r4" da memoria

        LDRB     r6, =0x27      @ atribuindo um valor para r6        
        LDRB     r7, =0xFF      @ atribuindo um valor para r7
        STRB     r7, [r6]       @ alocando o valor de r7 na posicao "r6" da memoria


        LDRSB   sp, [r0]        @ Load de um Byte (8 Bits) da posicao "r0" da memoria fazendo um sign-extend e alocando em sp
                                

        LDRSH   sp, [r0]        @ Load de uma Halfword (16 Bits) da posicao "r0" da memoria fazendo um sign-extend e alocando em sp


        LDR     sp, [r0]        @ Load de uma Word (32 Bits) da posicao "r0" da memoria e alocando em sp


        LDRB    sp, [r0]        @ Load de um Byte (8 Bits) da posicao "r0" da memoria e alocando em sp (sem fazer sign-extend)


        SWI     0x123456        @ encerra o programa
