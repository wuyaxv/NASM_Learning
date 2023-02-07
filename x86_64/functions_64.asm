;; ---------------------------------------
;; void exit()
;; exit with a return value 0
exit:
    mov rax, 0x3c
    mov rdi, 0
    syscall

;; ---------------------------------------
;; int strlen(String PTR)
;; print the length of the string designated.
strlen:
    push rdi            ;; 保留rdi原先的值，rdi用于双指针算法
    push rcx            ;; 保留rcx原先的值，rcx用于计数

    mov     rdi, rax    ;; 将rdi和rax指向同一处
    xor     rcx, rcx    ;; rcx初始化位0

.loop0:
    cmp     BYTE [rdi + rcx], 0x00  ;; 同C语言，假定文件以空字符结尾
    jz      .getLength
    inc     rcx
    jmp     .loop0

.getLength:
    mov     rax, rcx
    pop     rcx
    pop     rdi
    
    ret
