	.text
 	.globl main
main:
    LDR     r0, [r2, #20]
    ADD     r0, r0, r1
    STR     r0, [r2, #40]
 	SWI     0x123456