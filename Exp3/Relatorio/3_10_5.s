@gcc -o (nome) (arquivo).s para compilar
@gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@r para dar run, s para step, c para continue,

    .text
    .globl main
main:
    LDR     r0, =0x00000002         @ 32 bits mais significativos
    LDR     r1, =0xFFFFFFFC         @ 32 bits menos significativos 
    LDR     r2, =0x00000000         @ variavel de controle
    
    CMP     r0, #0                  @ compara r0 com 0
    RSBLT   r0, r0, #0              @ se r0 for negativo, faz "r0 = 0 - r0"
    ADDLT   r2, r2, #1              @ se r0 for negativo, adiciona 1 em r2

    CMP     r1, #0                  @ compara r0 com 0
    RSBLT   r1, r1, #0              @ se r1 for negativo, faz "r1 = 0 - r1"
    ADDLT   r2, r2, #1              @ se r1 for negativo, adiciona 1 em r2

    UMULL   r3, r4, r0, r1          @ multiplicacao 

    CMP     r2, #1                  @ compara r2 com 1
    MVNEQ   r3, r3                  @ se r2 for 1, faz NOT em r3
    MVNEQ   r4, r4                  @ se r2 for 1, faz NOT em r4
    ADDEQS  r3, r3, #1              @ se r2 for 1, adiciona 1 em r3
    ADCEQ   r4, r4, #0              @ se r2 for 1, adiciona 0 e o carry em r4
    
    SWI     0x123456                @ encerra o programa

