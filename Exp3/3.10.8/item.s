@ compilar: gcc <nome do arquivo>
@ degubb: gdb <nome do arquivo

    .text
    .globl main
main:
	@ codigo Gray 00 01 11 10
	LDR     r0, =0x0000001E
	@ numero binario 00000000 0xx 0yy 0zz 0ww 1ww 1zz 1yy 1xx          
    LDR     r1, =0x00000924         

	@ shifta para pegar apenas o primeiro par (00)
    MOV     r2, r0, LSR #6
    @ adiciona o primeiro par no lugar dele em xx (direita)
	ADD     r1, r1, r2
	@ adiciona o primeiro par no lugar dele em xx (esquerda)
    ADD     r1, r1, r2, LSL #21
	@ subtrai r2 do r0 para ficar com os outros 3 pares
    SUB     r0, r0, r2, LSL#6

	@ shifta para pegar apenas o segundo par (01)
    MOV     r2, r0, LSR #4
	@ adiciona o segundo par no lugar dele em yy (direita)
    ADD     r1, r1, r2, LSL #3
	@ adiciona o segundo par no lugar dele em yy (esquerda)
    ADD     r1, r1, r2, LSL #18
	@ subtrai r2 do r0 para ficar com os outros 2 pares
    SUB     r0, r0, r2, LSL#4       

	@ shifta para pegar apenas o terceiro par (11)
    MOV     r2, r0, LSR #2
	@ adiciona o terceiro par no lugar dele em zz (direita)
    ADD     r1, r1, r2, LSL #6
	@ adiciona o terceiro par no lugar dele em zz (esquerda)
    ADD     r1, r1, r2, LSL #15
	@ subtrai r2 do r0 para ficar com o ultimo par
    SUB     r0, r0, r2, LSL#2

	@ shifta para pegar apenas o ultimo par (10)
    MOV     r2, r0
	@ adiciona o ultimo par no lugar dele em ww (direita)
    ADD     r1, r1, r2, LSL #9
	@ adiciona o ultimo par no lugar dele em ww (esquerda)
    ADD     r1, r1, r2, LSL #12

	@ encerra o programa
    SWI     0x123456
