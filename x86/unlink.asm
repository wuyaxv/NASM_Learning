%include "functions.asm"

section .data

filename: db "README.md",0x00
note:     db "File Deleted", 0x00

section .text

global _start

_start:
    mov eax, 10
    mov ebx, filename
    int 0x80

    mov eax, note
    call sprintLF

    call exit
