@gcc -o (nome) (arquivo).s para compilar
@gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@r para dar run, s para step, c para continue,

    .text
    .globl main
main:
    LDR     r0, =0x00000001     @ variavel que verifica se o algoritimo será encerrado
    LDR     r3, =0x00000000     @ quociente
    LDR     r1, =10823730       @ dividendo
    LDR     r2, =1000           @ divisor
    CMP     r2, #0              @ compara r2 com 0 (r2-0)
    BEQ     divide_end          @ caso r2=0, pula para a funcao que encerra o programa
    MOV     r5, r1              @ carrega o valor do dividendo que se atualiza (resto)

start:
    CMP     r2, r5              @ compara divisor e dividendo (r2-r5)
    MOVLS   r2, r2, LSL #1      @ se r2 <= r5, shift left de r2
    MOVLS   r0, r0, LSL #1      @ se r2 <= r5, shift left de r0
    BLS     start               @ se r2 <= r5, loop desta funcao

next:
    CMP     r5, r2              @ compara dividendo e divisor (r5-r2)
    SUBCS   r5, r5, r2          @ se r5 >= r2, faz "r5 = r5 - r2"

    ADDCS   r3, r3, r0          @ se r5 >= r2, armazena a adicao pelo quociente pelo r0

    MOVS    r0, r0, LSR #1      @ shift right em r0, atualizando o valor do carry
    MOVCC   r2, r2, LSR #1      @ caso o carry esteja vazio, ocorre um shift right em r2

    BCC     next                @ caso o carry esteja vazio, a funcao faz um loop

divide_end:
    SWI     0x123456            @ encerra o programa
