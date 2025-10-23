; JA / JNBE → Jump if Above
section .data
    str_above db "Hello, this is Sasha Miriti, Admission No: 166394",10,0
    str_len equ $ - str_above
    str_not_above db "Hello, this is Sasha Miriti, Admission No: 166394",10,0
    str_not_above_len equ $ - str_not_above

section .text
    global _start
_start:
    mov ax, 7
    mov bx, 3
    cmp ax, bx
    ja above

    mov ecx, str_not_above
    mov edx, str_not_above_len
    jmp print

above:
    mov ecx, str_above
    mov edx, str_len

print:
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    int 0x80

    mov eax, 1      ; sys_exit
    xor ebx, ebx
    int 0x80

