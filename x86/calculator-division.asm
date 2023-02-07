%include "functions.asm"

SECTION .data

quotient_note:   db "quotient: ", 0x00
remainders_note: db "remainders: ", 0x00

SECTION .text

global _start

_start:
    mov eax, 1
    mov ebx, 5
    div ebx
    
    ; 打印提示信息，quotient: 
    push eax
    mov eax, quotient_note
    call sprint

    ; 打印quotient值
    pop eax
    call iprintLF

    mov eax, remainders_note
    call sprint
    mov eax, edx
    call iprintLF
    
    call exit

    
