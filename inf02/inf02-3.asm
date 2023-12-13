.global main
.section .data

format: .asciz "%d"
.extern printf
.extern scanf

.section .text
main:
    push {lr}
    sub sp, sp, #8

    ldr r0, =format
    add r1, sp, #4
    bl scanf

    ldr r0, =format
    add r1, sp
    bl scanf

    ldr r2, [sp, #4]
    ldr r3, [sp]
    add r2, r2, r3

    ldr r0, =format
    mov r1, r2
    bl printf

    add sp, sp, #8
    pop {pc}