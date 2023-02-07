global main
extern puts


section .text
main:
    mov rdi, msg
    call puts

    ret

msg:    db      "Hello world", 0x00
