; This program prints the first 90 fibonaccis

global main
extern printf       ; Use function printf from libc

section .data

format:     db "%20ld", 0xa, 0

section .text

main:
    push rcx
    push rbx
    push rdi
    
    mov rcx, 90
    mov rax, 0              ; rax holds the current value.
    mov rbx, 1              ; rbx holds the next value.
    xor rdi, rdi

.loop:
    cmp rcx, 0x0
    je  .finished

    ; Temperarily store the caller registers
    push rcx
    push rax
    push rdi
    push rsi

    mov rdi, format
    mov rsi, rax
    xor rax, rax
    call printf

    ; Restore the caller registers
    pop rsi
    pop rdi
    pop rax
    pop rcx

    ; rax = rbx + rax
    add rax, rbx
    mov rdi, rbx
    mov rbx, rax
    mov rax, rdi

    dec rcx
    jmp .loop
    
.finished:
    pop rdi
    pop rbx
    pop rcx
    ret
    

    
