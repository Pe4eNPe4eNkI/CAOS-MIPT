.intel_syntax noprefix

.data

output:    .asciz "%d\n"
input:     .asciz "%d"
number: .long 0

.text
.global everyday795
.global summ

summ:
  mov rcx, N
  mov rdi, A
  mov rsi, B
  mov rdx, R
  
.Loop:
  mov rax, [rdi]
  add rax, [rsi]
  mov [rdx], rax

  add rdi, 4
  add rsi, 4
  add rdx, 4
  
  loop .Loop
  
  ret

everyday795:
    
    push rbp
    push rsi
    push rdi
        
    mov rdi, offset input
    mov rsi, offset number
    mov rax, 0
    call scanf
    
    pop rdi
    pop rsi
    
    mov rax, number
    imul rax, rdi
    add rax, rsi
    
    mov rdi, offset output
    mov rsi, rax
    mov rax, 0
    call printf
    
    pop rbp
    mov rax, 0
    ret
