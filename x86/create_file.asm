%include "functions.asm"

section .data

filename: db "README.md", 0x00

section .text

global _start

_start:
    mov ecx, 1600o
    mov ebx, filename
    mov eax, 8
    int 0x80

    call exit
