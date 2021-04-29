	.text
	.globl main
main:
	LDR	r0, =0x00000002	     
	LDR	r1, =0x00000005
	BL	firstfunc    	
	SWI	0x123456		
firstfunc:
	ADD	r2, r0, r1 
	SUB	r3, r1, r0 		
	MOV	pc, lr	     
