%include "functions.asm"

SECTION .text
global _start

_start:
    mov eax, 90
    mov ebx, 9
    mul ebx
    call iprintLF

    call exit

