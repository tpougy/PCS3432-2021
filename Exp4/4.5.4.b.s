@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

    .text
 	.globl main
main:
    ADR     r0, array           @ array a
    LDR     r1, =0x4            @ define s (constante arbitrária)
    MOV     r10, #0             @ reg auxiliar guarda 0
    B       forinit

forinit:
    MOV     r2, r0              @ inicializa p
    ADD     r11, r0, r1         @ inicializa o valor auxiliar para a comparação com p
    B       forheader 

forheader:
    CMP     r2, r11             @ compara p com &array[s]
    BLT     forloop
    B       break

forloop:
    STRB    r10, [r2]
    ADD     r2, r2, #1
    B forheader

break:
    SWI     0x123456           @ encerra programa

array: .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF