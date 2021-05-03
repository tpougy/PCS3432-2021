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
    LDR     r1, =0x5            @ define s (constante arbitrária)
    MOV     r10, #0             @ reg auxiliar guarda 0
    LDR     r2, p
    B       forinit

forinit:
    STR     r0, [r2]           @ inicializa p
    LDR     r11, r0, r1        @ inicializa o valor auxiliar para a comparação com p
    B       forheader 

forheader:

    CMP     r2, r11            @ compara p com &array[s]
    BLE     forloop
    B       break

forloop:
    STRB    r4, [r2], #1
    B forheader

break:
    SWI     0x123456           @ encerra programa