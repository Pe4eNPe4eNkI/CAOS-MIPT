
.section .rodata
.scanf_str:
  .string "%d"



.global summ
.global everyday795
.intel_syntax noprefix
.text

summ:
	push ebp
    mov ebp, esp
	mov ecx, [ebp + 8]
	push ebx


.Loop_sum:
	dec ecx
	mov eax, [ebp + 12] 
	mov ebx, [eax + 4 * ecx]
    mov eax, [ebp + 16]
	add ebx, [eax + 4 * ecx]
    mov eax, [ebp + 20]
	mov [eax + 4 * ecx], ebx
	inc ecx
	loop .Loop_sum

	pop ebx
	pop ebp

	ret


everyday795:
  push rbp

  lea rbp, rax
  mov rax, rsi
  lea .scanf_str(rip), rax
  mov rax, rdi
  mov $0, eax
  call __isoc99_scanf@PLT
  mov rbp, eax
  mull rbp, eax
  movl rbp, ebx
  add ebx, eax
  mov eax, esi
  lea .scanf_str(rip), rax
  mov rax, rdi
  cal printf@PLT
  pop rbp
  ret