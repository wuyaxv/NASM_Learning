%include "functions.asm"

SECTION .text
global _start

_start:
    pop ecx ; Arguments count
    
nextarg:
    cmp ecx, 0x00
    jz quit
    pop eax
    call sprintLF
    dec ecx
    jmp nextarg

quit:
    call exit
