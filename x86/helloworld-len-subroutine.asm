SECTION .data
msg db "Hello, brave new world", 0x0a

SECTION .text
global _start

_start:
    mov eax, msg    ; 作为参数移动到eax中
    call strlen     ; return得到的eax的值就是长度

    mov edx, eax
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ebx, 0
    mov eax, 1
    int 0x80

;; int strlen(char *)
strlen:
    push ebx        ; 将ebx的值暂时性存储到栈中
    mov ebx, eax    ; 让eax和ebx同指同一个地方

nextchar:
    cmp byte [eax], 0x0
    jz finished
    inc eax      ; 如果还没有读完的话，eax将指向下一个字符
    jmp nextchar

finished:
    sub eax, ebx
    pop ebx
    ret 
