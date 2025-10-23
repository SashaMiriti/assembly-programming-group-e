; JG / JNLE → Jump if Greater
section .data
    msg_greater db "Hello, this is Sasha Miriti, Admission No: 166394",10,0
    msg_greater_len equ $ - msg_greater

    msg_not_greater db "Hello, this is Sasha Miriti, Admission No: 166394",10,0
    msg_not_greater_len equ $ - msg_not_greater

section .text
    global _start
_start:
    mov ax,7
    mov bx,3
    cmp ax,bx
    jg greater

    mov ecx, msg_not_greater
    mov edx, msg_not_greater_len
    jmp print

greater:
    mov ecx, msg_greater
    mov edx, msg_greater_len

print:
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    int 0x80

    mov eax, 1      ; sys_exit
    xor ebx, ebx
    int 0x80
