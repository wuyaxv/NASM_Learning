; Hello-World program with external funcions included.

%include "functions.asm"

SECTION .data
msg1 db "Hello World",0x0
msg2 db "This is a brand new world", 0x0


SECTION .text
global _start

_start:
    mov eax, msg1
    call sprint


    call exit
