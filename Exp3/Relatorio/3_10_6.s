@gcc -o (nome) (arquivo).s para compilar
@gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@r para dar run, s para step, c para continue,

    .text
    .globl main
main:
    @valor inicial
    MOV     r0, #-123       
    BL      firstfunc

    SWI     0x123456
firstfunc:
    @compara o valor de r0 com 0
    CMP r0, #0              
    @caso o valor de r0 for negativo, faz "r1=0-ro"
    RSBLT   r1, r0, #0      
    MOV     pc, lr
