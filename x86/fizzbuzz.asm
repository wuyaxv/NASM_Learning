%include "functions.asm"

section .data

fizz: db "Fizz", 0x00
buzz: db "Buzz", 0x00

section .text

global _start

_start:
    mov ecx, 1
    
.inloop:
    xor eax, eax
    cmp ecx, 100
    jg  .finished
    
.checkFizz:
    mov eax, ecx
    mov ebx, 3
    mov edx, 0
    div ebx
    cmp edx, 0
    jne .checkBuzz
    mov eax, fizz
    call sprint
    mov ebx, 5
    mov edx, 0
    div ebx
    cmp edx, 0
    jne .continue
    
.checkBuzz:
    mov eax, ecx
    mov ebx, 5
    mov edx, 0
    div ebx
    cmp edx, 0
    jne .checkInt
    mov eax, buzz
    call sprint
    jmp .continue
    
.checkInt:
    mov eax, ecx
    call iprint
    
.continue:
    ;; 打印换行符
    mov eax, 0x0a
    push eax
    mov eax, esp
    call sprint
    pop eax

    inc ecx
    jmp .inloop

.finished:
    call exit
