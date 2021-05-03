@gcc -o (nome) (arquivo).s para compilar
@gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@r para dar run, s para step, c para continue,

    .text
    .globl main
main:
    LDR     r0, =0x0000001E         @ codigo Gray 00 01 11 10
    LDR     r1, =0x00000924         @ numero binario 00000000 0xx 0yy 0zz 0ww 1ww 1zz 1yy 1xx   

    MOV     r2, r0, LSR #6          @ shifta para pegar apenas o primeiro par (00)
    ADD     r1, r1, r2              @ adiciona o primeiro par no lugar dele em xx (direita)
    ADD     r1, r1, r2, LSL #21     @ adiciona o primeiro par no lugar dele em xx (esquerda)
    SUB     r0, r0, r2, LSL#6       @ subtrai r2 do r0 para ficar com os outros 3 pares

    MOV     r2, r0, LSR #4          @ shifta para pegar apenas o segundo par (01)
    ADD     r1, r1, r2, LSL #3      @ adiciona o segundo par no lugar dele em yy (direita)
    ADD     r1, r1, r2, LSL #18     @ adiciona o segundo par no lugar dele em yy (esquerda)
    SUB     r0, r0, r2, LSL#4       @ subtrai r2 do r0 para ficar com os outros 2 pares

    MOV     r2, r0, LSR #2          @ shifta para pegar apenas o terceiro par (11)
    ADD     r1, r1, r2, LSL #6      @ adiciona o terceiro par no lugar dele em zz (direita)
    ADD     r1, r1, r2, LSL #15     @ adiciona o terceiro par no lugar dele em zz (esquerda)
    SUB     r0, r0, r2, LSL#2       @ subtrai r2 do r0 para ficar com o ultimo par

    MOV     r2, r0                  @ shifta para pegar apenas o ultimo par (10)
    ADD     r1, r1, r2, LSL #9      @ adiciona o ultimo par no lugar dele em ww (direita)
    ADD     r1, r1, r2, LSL #12     @ adiciona o ultimo par no lugar dele em ww (esquerda)

    SWI     0x123456                @ encerra o programa
