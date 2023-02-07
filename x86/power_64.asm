        global main
        extern printf
        extern atoi
        extern puts

        section .text

        ;; int64_t power(int64_t base, int64_t exp)
power:
        push    rbx                             ;; 使用rbx作为乘数

        dec     rsi
        mov     rax, rdi
        mov     rbx, rax
.loop:
        xor     rdx, rdx
        mul     rbx
        dec     rsi
        cmp     rsi, 0
        jnz      .loop

        pop rbx
        ret

main:
        cmp     rdi, 3
        je      .routine

        ;; 参数个数不对
        push    rdi
        push    rcx
        mov     rdi, error_msg
        call    puts
        pop     rcx
        pop     rdi

        ret                                     ;; 直接退出

.routine:
        push    rcx
        mov     rdi, QWORD [rsi + 8]
        push    rsi
        call    atoi
        pop     rsi
        mov     rcx, rax
        mov     rdi, QWORD [rsi + 16]
        push    rcx
        call    atoi
        pop     rcx
        mov     rsi, rax
        mov     rdi, rcx
        call    power
        pop     rcx
.debug:

        mov     rdi, format
        mov     rsi, rax
        xor     rax, rax
        call    printf
        
.finished:
        ret

        section .data

error_msg:      db      "./power base exp", 0xa, 0x00
format:         db      "%20ld",0xa ,0x00
