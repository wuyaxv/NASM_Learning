%include "functions.asm"

section .text

global _start

_start:
    pop ecx
    pop eax     ; program name
    dec ecx
    xor edx, edx

.getNumbers:
    cmp ecx, 0x00
    jmp .printSum

    mov eax, esp
    call atoi
    add edx, eax
    pop eax
    jmp .getNumbers
    
.printSum:
    mov eax, edx
    call iprintLF

.quit:
    call exit
