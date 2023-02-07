%include "functions.asm"

section .data

filename:   db      "readme.txt", 0x00
before_msg: db      "Before: ", 0x00
after_msg:  db      "After: ", 0x00
addings:    db      "Now we are adding some thing", 0x00

section .bss

buffer:     resb 255

section .text

global _start

_start:
    mov eax, 0x05           ; open()
    mov ebx, filename
    mov ecx, 02             ; O_RDWR = 2
    mov edx, 0
    int 0x80

    mov ebx, eax            
    mov eax, 0x13           ;lseek()
    mov ecx, 0
    mov edx, 2              ; Set the whence to be end of the file
    int 0x80

    mov eax, addings        ; strlen()
    call strlen
    mov edx, eax
    mov eax, 0x04           ;write()
    mov ecx, addings
    int 0x80
    
    mov eax, 0x13
    mov ecx, 0
    mov edx, 0
    int 0x80

    mov eax, 0x03           ; read()
    mov ecx, buffer
    mov edx, 255
    int 0x80

    mov eax, 6              ; Close the file properly
    int 0x80

    
    mov eax, buffer
    call sprint

    call exit


