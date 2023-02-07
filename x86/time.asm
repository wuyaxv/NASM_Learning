%include "functions.asm"

section .bss

timeStamp:      resd    1
time_Year:      resd    1
time_month:     resd    1
time_day:       resd    1

section .data

date_Msg:   db      "Date: ", 0x00
PM_Msg:     db      "PM", 0x00
CST_Msg:    db      "CST", 0x00
space:      db      " ", 0x00

date_day:    dd     0
date_month:  dd     0
date_year:   dd     0
date_hour:   dd     0
date_minute: dd     0
date_second: dd     0

delimitor:   dd     ":",0x00

section .text

global _start:

_start:
    mov ebx, timeStamp
    mov eax, 13
    int 0x80

    mov eax, DWORD [timeStamp]
    mov ebx, 86400
    xor edx, edx
    div ebx

    ;; 获取秒数
    mov eax, edx
    mov ebx, 60
    xor edx, edx
    div ebx
    mov DWORD [date_second], edx
    
    ;; 获取分钟数，当前eax存放的是当日的分钟数
    mov ebx, 60
    xor edx, edx
    div ebx
    mov DWORD [date_minute], edx

    ;; CST
    add eax, 8
    mov ebx, 24
    xor edx, edx
    div ebx
    mov edi, eax
    mov DWORD [date_hour], edx

    mov eax, date_Msg
    call sprint
    
    mov eax, DWORD [date_hour]
    call iprint
    mov eax, delimitor
    call sprint
    mov eax, DWORD [date_minute]
    call iprint
    mov eax, delimitor
    call sprint
    mov eax, DWORD [date_second]
    call iprint

    mov eax, space
    call sprint
    mov eax, PM_Msg
    call sprint
    
.printCST:
    mov eax, space
    call sprint
    mov eax, CST_Msg
    call sprintLF

    call exit
