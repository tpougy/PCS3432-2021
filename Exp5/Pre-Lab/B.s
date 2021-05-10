@ gcc -o (nome) (arquivo).s para compilar
@ gdb para rodar e debugar, Ctrl+x 2 para mudar vizualização, "b main" para breakpoint,
@ r para dar run, s para step, c para continue,
@ p/t $register -> printar valor do regs em binario
@ p/x $register -> printar o valor do regs em hex
@ x/x 0x??????? -> printar o conteudo da posicao ??????? da memoria em hex

        .text
        .globl main
main: 

@============================== 1 e 2 ==============================

        LDR     r3, =0x00000001     @ atribuindo um valor para r3
        LDR     r6, =0x00000002     @ atribuindo um valor para r6

        ADDPL   r7, r3, r6          @ faz r7 = r3 + r6 se N=0

        ADDMI   r8, r3, r6          @ faz r8 = r3 + r6 se N=1

@============================== 3 e 4 ==============================

        LDR     r7, =0x00000002     @ atribuindo um valor para r7
        LDR     r12, =0x00000003    @ atribuindo um valor para r12

        MULHI   r3, r7, r12         @ faz r3 = r7*r12 se C=1 && Z=0

        MULLS   r4, r7, r12         @ faz r4 = r7*r12 de C=0 || Z=1

@============================== 5 e 6 ==============================

        LDR     r6, =0x00000001     @ atribuindo um valor para r6
        LDR     r8, =0x00000002     @ atribuindo um valor para r8

        CMPNE   r6, r8              @ compara r6 com r8 se Z=0

        CMPLE   r6, r8              @ compara r6 com r8 se Z=1 || N!=V

@==============================  foo  ==============================

        LDR     r0, =0xFFFFFFF1     @ atribuindo um valor para r0
        LDR     r1, =0x00000000     @ atribuindo um valor para r1

foo:
        ADDS    r0, r0, r1          @ r0 = r0 + r1 e atualiza flags
        MOVPL   r0, #0              @ se a soma acima for >= 0, r0=0 ("return 0")
        MOVMI   r0, #1              @ se a soma acima for <= 0, r0=1 ("return 1")

        SWI     0x123456            @ encerra o programa

