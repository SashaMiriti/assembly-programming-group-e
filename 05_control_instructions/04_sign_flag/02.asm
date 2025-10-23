; JNS → Jump if Not Sign (SF = 0)

section .data
    msg_neg db "Hello, this is Sasha Miriti, Admission No: 166394 (Negative, SF=1)",10,0
    len_neg equ $ - msg_neg

    msg_nonneg db "Hello, this is Sasha Miriti, Admission No: 166394 (Non-Negative, SF=0)",10,0
    len_nonneg equ $ - msg_nonneg

section .text
    global _start
_start:
    mov ax, -5         ; test with positive value
    test ax,ax
    jns nonneg

    ; Negative case
    mov ecx, msg_neg
    mov edx, len_neg
    jmp print

nonneg:
    ; Non-negative case
    mov ecx, msg_nonneg
    mov edx, len_nonneg

print:
    mov eax,4        ; sys_write
    mov ebx,1        ; stdout
    int 0x80

    mov eax,1        ; sys_exit
    xor ebx,ebx
    int 0x80
