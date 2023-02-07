%include "functions.asm"

SECTION .text

global _start

_start:
    mov esi, 0

loop:
    inc esi
    mov eax, esi
    call iprintLF
    cmp esi, 10
    je quit
    jmp loop

quit:
    call exit
    
