.global summ
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