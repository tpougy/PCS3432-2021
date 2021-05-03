@ compilar: gcc <nome do arquivo>
@ degubb: gdb <nome do arquivo

@ r3 -> resultado (quociente)
@ r5 -> resto

	.text
	.globl main
main:
	@ variável que verifica se o algoritmo será encerrado
	LDR r0, =0x00000001
	@ quociente (será o resultado)
	LDR r3, =0x00000000
	@ dividendo
	LDR r1, =9795907
	@ divisor
	LDR r2, =1000
	@ compara r2 com - (r2-0)
	CMP r2, #0
	@ caso r2-0, pula para a função que encerra o programa
	BEQ divide_end
	@ carrega o valor do dividendo que se atualiza (será o resto)
	MOV r5, r1

start:
	@ compara divisor e dividendo (r2-r5)
	CMP r2, r5
	@ se r2 <= r5, shift left de r2
	MOVLS r2, r2, LSL #1
	@ se r2 <= r5, shift left de r0
	MOVLS r0, r0, LSL #1
	@ se r2 <= r5, loop desta funcao
	BLS start

next:
	@ compara dividendo e divisor (r5-r2)
	CMP r5, r2
	@ se r5 >= r2, faz "r5 = r5 -r2"
	SUBCS r5, r5, r2
	@ se r5 >= r2, armazena a adicao pelo quociente pelo r0
	ADDCS r3, r3, r0
	@ shift right em r0, atualizando o valor do carry
	MOVS r0, r0, LSR #1
	@ caso os carry esteja vazio, ocorre um shift right em r2
	MOVCC r2, r2, LSR #1
	@ caso o carry esteja vazio, a funcao faz loop
	BCC next

divide_end:
	@ encerra programa
	SWI 0x123456
