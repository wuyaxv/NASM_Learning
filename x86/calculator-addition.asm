%include "functions.asm"

SECTION .text
global _start

_start:
    mov eax, 90
    mov ebx, 9
    add ebx, eax
    call iprintLF
    
    mov eax, ebx
    call iprintLF

    call exit

