extern puts
global main

section .text


main:
    xor rcx, rcx

.loop:
    push rdi
    push rsi
    push rcx

    mov  rdi, [rsi + rcx * 8]
    call puts
    
    pop rcx
    pop rsi
    pop rdi

    inc rcx
    dec rdi
    cmp rdi, 0x0
    jne  .loop

    ret
