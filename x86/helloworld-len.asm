SECTION .data
msg db "Hello, brave new world", 0x0a

SECTION .text
global _start

_start:
    mov ebx, msg
    xor eax, eax ; 清空eax
    mov eax, ebx

nextchar:
    cmp byte [eax], 0x0
    jz finished
    inc eax      ; 如果还没有读完的话，eax将指向下一个字符
    jmp nextchar

finished:
    sub eax, ebx ; 这才是要读取的字符串的真正长度

    mov edx, eax
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ebx, 0
    mov eax, 1
    int 0x80
