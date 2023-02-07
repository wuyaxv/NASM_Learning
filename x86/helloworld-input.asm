%include "functions.asm"

SECTION .data
msg1:    db      "Please enter your name", 0x00
msg2:    db      "Hello, ", 0x00

SECTION .bss
sinput:  resb    255

SECTION .text
global _start

_start:
    mov eax, msg1
    call sprintLF
    
    mov edx, 255
    mov ecx, sinput
    mov ebx, 0
    mov eax, 3
    int 0x80

    mov eax, msg2
    call sprint
    
    mov eax, sinput
    call sprint

    call exit
