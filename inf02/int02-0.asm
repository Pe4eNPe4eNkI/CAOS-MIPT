.text
.global summ

summ: // r0 - x0; r1 - N; r2 - *x; r3 - i;
    push {r4}
    mov r3, #0

sum_loop:
    cmp r3, r1 // проверка
    beq end_summ

    ldr r4, [r2, r3, lsl #2]
    add r0, r0, r4
    add r3, r3, #1

    b sum_loop
end_summ:
    pop {r4}
    bx lr