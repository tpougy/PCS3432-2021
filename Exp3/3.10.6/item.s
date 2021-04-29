@ compilar: gcc <nome do arquivo>
@ degubb: gdb <nome do arquivo

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