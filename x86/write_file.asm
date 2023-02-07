%include "functions.asm"

section .data

msg: db "Hello world", 0x00
filename: db "README.md", 0x00

section .text
global _start

_start:
    mov eax, 5
    mov ebx, filename
    mov ecx, 00000001o  ;O_WRONLY 定义在/usr/include/asm-generic/fcntl.h
    mov edx, 0
    int 0x80

    mov ebx, eax
    mov eax, 4
    mov ecx, msg
    mov edx, 11
    int 0x80

    call exit

