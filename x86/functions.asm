; -------------------------------------
; int slen(String PTR)
; String length calculation function
strlen:
    push ebx
    mov ebx, eax        ; eax存储的是字符串的首地址。使eax和ebx指向同一个起点开始计数
nextchar:
    cmp byte [eax], 0x00; 判断是否到达字符串尾部
    je finished
    inc eax
    jmp nextchar
finished:
    sub eax, ebx
    pop ebx
    ret

; -------------------------------------
; void sprint(String PTR)
; Print string function
sprint:                 ; 使用SYS_WRITE
    push edx
    push ecx
    push ebx

    push eax
    
    call strlen
    mov edx, eax
    pop eax             ; eax存放的是字符串的首地址
    
    mov ecx, eax
    mov ebx, 1
    mov eax, 4
    int 0x80

    pop ebx
    pop ecx
    pop edx
    xor eax, eax        ; return 0
    ret

; -------------------------------------
; void sprintLF(String PTR)
; Print a string with linefeed
sprintLF:
    call sprint

    push eax            ; 将原本的eax的值存储起来
    mov  eax, 0Ah
    push eax            ; 将eax入栈，以便于获取地址
    mov  eax, esp
    call sprint

    pop eax
    pop eax
    ret
; -------------------------------------
; void exit(value)
; Exit the program with the value you need
exit:
    push ebx
    push eax

    pop eax
    mov ebx, eax
    mov eax, 1
    int 0x80

    pop ebx
    ret
    
; -------------------------------------
; void iprint(Number)
; Print the ASCII printable where the passed pointer points, and it identical to itoa in an ASCII way
; For example, when the input is '4748', the output would be 10, it's two seperate digits
iprint:
    push eax
    push ecx
    push edx
    push esi
    
    mov esi, 10
    mov ecx, 0          ; 存储所要打印的数字数目

getUnits:
    inc     ecx             ; 表示要打印的digit的数目
    xor     edx, edx        ; 初始化edx，将edx设置为0
    idiv    esi
    add     edx, 48
    push    edx
    cmp     eax, 0x00
    jne     getUnits

printDigits:
    dec     ecx
    mov     eax, esp
    call    sprint
    pop     eax
    cmp     ecx, 0
    jne     printDigits

iprint_exit:
    pop esi
    pop edx
    pop ecx
    pop eax
    ret

; -------------------------------------
; iprintLF(Number)
; Print the ASCII printables with linefeeds
iprintLF:
    push eax
   
    call iprint

    mov eax, 0x0A
    push eax
    mov eax, esp
    call sprint

    pop eax
    pop eax

    ret
    
; -------------------------------------
; BYTE atoi(Integer string PTR)
; Transform a ascii form string to integer
; The sole argument is passed via EAX
atoi:
    push    ebx             ; preserve ebx on the stack to be restored after function runs
    push    ecx             ; preserve ecx on the stack to be restored after function runs
    push    edx             ; preserve edx on the stack to be restored after function runs
    push    esi             ; preserve esi on the stack to be restored after function runs
    mov     esi, eax        ; move pointer in eax into esi (our number to convert)
    mov     eax, 0          ; initialise eax with decimal value 0
    mov     ecx, 0          ; initialise ecx with decimal value 0
 
.multiplyLoop:
    xor     ebx, ebx        ; resets both lower and uppper bytes of ebx to be 0
    mov     bl, [esi+ecx]   ; move a single byte into ebx register's lower half
    cmp     bl, 48          ; compare ebx register's lower half value against ascii value 48 (char value 0)
    jl      .finished       ; jump if less than to label finished
    cmp     bl, 57          ; compare ebx register's lower half value against ascii value 57 (char value 9)
    jg      .finished       ; jump if greater than to label finished
 
    sub     bl, 48          ; convert ebx register's lower half to decimal representation of ascii value
    add     eax, ebx        ; add ebx to our interger value in eax
    mov     ebx, 10         ; move decimal value 10 into ebx
    mul     ebx             ; multiply eax by ebx to get place value
    inc     ecx             ; increment ecx (our counter register)
    jmp     .multiplyLoop   ; continue multiply loop
 
.finished:
    cmp     ecx, 0          ; compare ecx register's value against decimal 0 (our counter register)
    je      .restore        ; jump if equal to 0 (no integer arguments were passed to atoi)
    mov     ebx, 10         ; move decimal value 10 into ebx
    div     ebx             ; divide eax by value in ebx (in this case 10)
 
.restore:
    pop     esi             ; restore esi from the value we pushed onto the stack at the start
    pop     edx             ; restore edx from the value we pushed onto the stack at the start
    pop     ecx             ; restore ecx from the value we pushed onto the stack at the start
    pop     ebx             ; restore ebx from the value we pushed onto the stack at the start
    ret
