; JG / JNLE → Jump if Greater (Signed)

section .data
    msg_greater db "Hello, this is Sasha Miriti, Admission No: 166394 (AX > BX, Signed Greater)",10,0
    len_greater equ $ - msg_greater

    msg_not_greater db "Hello, this is Sasha Miriti, Admission No: 166394 (AX <= BX, Not Greater)",10,0
    len_not_greater equ $ - msg_not_greater

section .text
    global _start
_start:
    mov ax,7
    mov bx,3
    cmp ax,bx
    jg greater

    ; AX <= BX
    mov ecx, msg_not_greater
    mov edx, len_not_greater
    jmp print

greater:
    ; AX > BX
    mov ecx, msg_greater
    mov edx, len_greater

print:
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    int 0x80

    mov eax, 1      ; sys_exit
    xor ebx, ebx
    int 0x80
