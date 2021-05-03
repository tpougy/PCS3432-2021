@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 
        LDR     r0, =0x24           @ atribuindo um valor para r0
        LDR     r1, =0x06           @ atribuindo um valor para r1
        STR     r1, [r0]            @ alocando na posicao "r0" da memoria o valor r1

        LDRSB   sp, [r0]            @ Load de um Byte (8 Bits) da posicao "r0" da memoria fazendo um sign-extend e alocando em sp

        LDRSH   sp, [r0]            @ Load de uma Halfword (16 Bits) da posicao "r0" da memoria fazendo um sign-extend e alocando em sp

        LDR     sp, [r0]            @ Load de uma Word (32 Bits) da posicao "r0" da memoria e alocando em sp

        LDRB    sp, [r0]            @ Load de um Byte (8 Bits) da posicao "r0" da memoria e alocando em sp (sem fazer sign-extend)


        SWI     0x123456
