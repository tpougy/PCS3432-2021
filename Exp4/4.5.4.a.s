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
    LDR     r2, =0              @ inicializa i
    MOV     r4, #0              @ reg auxiliar guarda 0

    B       forheader

forheader:
    CMP     r1, r2              @ compara i com s
    BLE     forloop
    B       break

forloop:
    STRB    r4, [r3, r2]        @ mem(r3) recebe o valor armazenado em r4
    ADD     r2, r2, #1
    B forheader

break:
    SWI     0x123456            @ encerra programa

array: .bytes 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF