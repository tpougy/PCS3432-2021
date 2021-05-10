@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 
        ADR     r0, dados               @ declaracao dos dados
        LDR     r1, =0x0                @ variavel i
        LDR     r5, =0xD                @ tamanho do vetor
        LDR     r4, =0x4                @ r4 = 4

        MUL     r6, r5, r4              @ r4 = r5*r4

        LDR     r2, [r0]                @ aloca a primeira posicao de dados em r2

loop:
        CMP     r1, r6                  @ compara i com r5 (tamanho do vetor)
        BGE     fim                     @ se i >= 48, vai para fim

        ADD     r1, r1, #4              @ i = i + 1 (ou r1 = r1 + 4)
        LDR     r3, [r0, r1]            @ aloca em r3 o prox valor de dados

        CMP     r2, r3                  @ compara r2 com r3 (r2 - r3)
        MOVLS   r2, r3                  @ caso r2 <= r3, r2 = r3     


        B       loop                    @ volta para loop
        
fim:
        SWI     0x123456                @ encerra programa

dados:
    .word 0x0, 0x1, 0x2, 0xB, 0x4, 0x5, 0x6, 0xF, 0x8, 0x9, 0xA, 0x3, 0x7

