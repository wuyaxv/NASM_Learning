SECTION .data

msg db "PrintF", 0x0A, 0x00

count db 30

SECTION .text
global _start

_start:
    mov ebx, msg
    mov eax, ebx

nextchar:
    cmp byte [eax], 0x00
    jz getLength
    inc eax
    jmp nextchar

getLength:
    sub eax, ebx
    mov esi, eax ; length是一个持久的值，存在esi中。

inloop:
    cmp byte [count], 0x0
    jz exit
    dec byte [count]
    mov edx, esi
    mov ecx, msg
    mov ebx, 1      ; stdio
    mov eax, 4
    int 0x80
    jmp inloop
    
exit:
    mov ebx, 0x0
    mov eax, 0x1
    int 0x80
