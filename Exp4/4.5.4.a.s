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
    LDR     r2, =0              @ inicializa i
    MOV     r3, #0              @ reg auxiliar guarda 0

    B       forheader

forheader:
    CMP     r2, r1              @ compara i com s
    BLT     forloop             @ se i < s entra no loop
    B       break

forloop:
    STRB    r3, [r0, r2]        @ mem(r0+r2) recebe r3 -> mem(array[0+i]) recebe 0
    ADD     r2, r2, #1          @ incrementa i de 1 unidade
    B forheader

break:
    SWI     0x123456            @ encerra programa

array: .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF