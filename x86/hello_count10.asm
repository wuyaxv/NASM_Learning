%include "functions.asm"

SECTION .text

global _start

_start:
    push eax
    push ecx
    mov ecx, 0  ;初始化ecx
    
nextNumber:
    mov eax, 48
    inc ecx
    add eax, ecx
    push eax
    mov eax, esp
    call iprint
    pop eax

    cmp ecx, 10
    je quit
    jmp nextNumber
    

quit:
    pop ecx
    pop eax
    call exit
