@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 
        LDR     r0, =0b0110110          @10110001101100101001010101101100 - sequencia  
        MOV     r8, r0                  @ copia o conteudo de r0 para r8
        LDR     r1, =0x0                @ variavel i
        LDR     r2, =0x0                @ saida
        LDR     r3, =0x0                @ reg q guarda o bit a ser analisado
        LDR     r9, =0x7                @ tamanho da sequencia 

        RSB     r7, r9, #32             @ r7 = 32 - r9
        MOV     r0, r0, LSL r7          @ shift left de (32-r9) bits

primeiro:
        CMP     r1, r9                  @ compara r1 com r9
        BGE     fim                     @ se r1 >= r9, vai para fim

        MOVS    r0, r0, LSL #1          @ adiciona o primeiro bit no carry
        LDR     r3, =0x0                @ reseta o conteudo de r3
        ADC     r3, r3, #0              @ adiciona carry em r3

        MOV     r2, r2, LSL #1          @ coloca 0 na saida

        ADD     r1, r1, #1              @ i++

        CMP     r3, #1                  @ compara r3 com 1
        BEQ     segundo                 @ se r3 = 1, vai para o segundo estado

        B       primeiro                @ volta para primeiro estado

segundo:
        CMP     r1, r9                  @ compara r1 com r9
        BGE     fim                     @ se r1 >= r9, vai para fim

        MOVS    r0, r0, LSL #1          @ adiciona o primeiro bit no carry
        LDR     r3, =0x0                @ reseta o conteudo de r3
        ADC     r3, r3, #0              @ adiciona carry em r3

        MOV     r2, r2, LSL #1          @ coloca 0 na saida

        ADD     r1, r1, #1              @ i++
        
        CMP     r3, #0                  @ compara r3 com 1
        BEQ     terceiro                @ se r3 = 1, vai para o terceiro estado

        B       segundo                 @ volta para loop

terceiro:
        CMP     r1, r9                  @ compara r1 com r9
        BGE     fim                     @ se r1 >= r9, vai para fim

        MOVS    r0, r0, LSL #1          @ adiciona o primeiro bit no carry
        LDR     r3, =0x0                @ reseta o conteudo de r3
        ADC     r3, r3, #0              @ adiciona carry em r3

        MOV     r2, r2, LSL #1          @ coloca 0 na saida

        ADD     r1, r1, #1              @ i++
        
        CMP     r3, #1                  @ compara r3 com 0
        BEQ     quarto                  @ se r3 = 0, vai para o quarto estado

        B       primeiro                @ volta para loop

quarto:
        CMP     r1, r9                  @ compara r1 com r9
        BGE     fim                     @ se r1 >= r9, vai para fim

        MOVS    r0, r0, LSL #1          @ adiciona o primeiro bit no carry
        LDR     r3, =0x0                @ reseta o conteudo de r3
        ADC     r3, r3, #0              @ adiciona carry em r3

        MOV   r2, r2, LSL #1

        ADD     r1, r1, #1              @ i++
        
        CMP     r3, #1                  @ compara r3 com 1
        ADDEQ   r2, r2, #1              @ se r3 = 1, atingiu a sequencia, shift left em r2, e coloca 1 na saida
        BEQ     segundo

        B       terceiro                @ volta para segundo, visto que pode ser o comeco da prox sequencia

fim:
        SWI     0x123456                @ encerra programa
