%include "functions.asm"

section .data

filename:   db      "readme.txt", 0x00

section .bss

buffer:     resb 255

section .text

global _start

_start:
    mov eax, 0x05           ; open()
    mov ebx, filename
    mov ecx, 01             ; O_RDONLY = 0
    mov edx, 0
    int 0x80

    mov ebx, eax
    mov eax, 0x03
    mov ecx, buffer
    mov edx, 255
    int 0x80

    mov eax, 6              ; Close the file properly
    int 0x80

    mov eax, buffer
    call sprint

    call exit


