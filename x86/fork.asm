%include "functions.asm"

section .data

msg1:   db      "This is a parent process", 0x00
msg2:   db      "This is a child  process", 0x00

section .text
global _start

_start:
    mov eax, 2
    int 0x80
    
    cmp eax, 0
    je  .childProcess

.parentProcess:
    mov eax, msg1
    call sprintLF
    jmp .finished

.childProcess:
    mov eax, msg2
    call sprintLF

.finished:
    call exit
