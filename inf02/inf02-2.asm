.data
.global R
R:
    .global calculate
    .text
    .space 4


    
.Perem:
	.word A
	.word B
	.word C
	.word D
	.word R

calculate:
	push {r4, r5, r6, r7}
	ldr r0, .Perem
    ldr r1, .Perem + 4
	ldr r2, .Perem + 8
    ldr r3, .Perem + 12

    ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]

	mul r4, r0, r1
	mul r5, r2, r3
	add r6, r4, r5
	
    ldr r7, .Perem + 16
	str r6, [r7]
	
    pop {r4, r5, r6, r7}
	bx lr
