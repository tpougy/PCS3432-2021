@ compilar: gcc <nome do arquivo>
@ degubb: gdb <nome do arquivo

    .text
    .globl main

main:
    LDR	r0, =0x00000002 @32 bits mais significativos
    LDR r1, =0xFFFFFFFC @32 bits menos significativos 

    @ verifica se os sinais sao iguais
    TEQ r0, r1
    @ sinais sao iguais pula para ss (same-signal)
    BEQ ss
    @ sinais sao diferentes pula para ds (diff-signal)
    BNE ds

    SWI 0x123456

ds:
    @ pula para a funcao abs (modulo)
    BL abs
    UMULL r3, r2, r0, r1

    @ inverte os bits menos significativos
    @ note que atualiza o carry
    MVN r3, r3
    ADDS r3, r3, #1

    @ inverte os bits mais significativos
    @ considera o carry na inversao
    MVN r2, r2
    ADC r2, r2, #0

    MOV pc, lr

ss:
    @ pula para a funcao abs (modulo)
    BL abs
    UMULL r3, r2, r0, r1

    MOV pc, lr

abs:
    @ verifica se r0<0
    CMP r0, #0
    @ se negativo inverte o sinal
    RSBLT r0, r0, #0

    @ verifica se r1<0
    CMP r1, #0
    @ se negativo inverte o sinal
    RSBLT r1, r1, #0

    MOV pc, lr
