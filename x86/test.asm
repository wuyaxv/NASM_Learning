SECTION .text

global _start

_start:
    mov eax, 31
    mov ecx, 10
    div ecx

    mov ebx, 0
    mov eax, 1
    int 80h
