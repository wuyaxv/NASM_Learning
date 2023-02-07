%include "functions_64.asm"

section .data

msg: db "Hello, world", 0xa,0x00

section .text

global _start
_start:
    
    mov rax, msg
    call strlen
    
    mov rdx, rax
    mov rdi, 1
    mov rsi, msg
    mov rax, 1
    syscall

    call exit
    

