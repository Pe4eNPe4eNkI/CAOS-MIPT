.global summ
.global everyday795
.intel_syntax noprefix
.data
.text

scanf_str:
  .string "%d"
num:
 .long 0

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
  push ebp
  push esi
  push edi

  lea edi, scanf_str
  lea esi, num
  call scanf

  pop edi
  pop esi
  
  mov eax, num
  imul eax, edi
  add eax, esi

  lea edi, scanf_str
  mov esi, eax
  call printf
  
  pop ebp

  ret
