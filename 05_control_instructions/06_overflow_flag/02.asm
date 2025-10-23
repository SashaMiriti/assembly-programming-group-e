; JNO → Jump if No Overflow

section .data
    msg_ov db "Hello, this is Sasha Miriti, Admission No: 166394 -> Overflow (OF=1)",10,0
    msg_ov_len equ $ - msg_ov

    msg_noov db "Hello, this is Sasha Miriti, Admission No: 166394 -> No overflow (OF=0)",10,0
    msg_noov_len equ $ - msg_noov

section .text
    global _start
_start:
    mov ax,7FFFh
    add ax,1           ; 

    ; If overflow (OF=1)
    mov ecx, msg_ov
    mov edx, msg_ov_len
    jmp print

nooverflow:
    mov ecx, msg_noov
    mov edx, msg_noov_len

print:
    mov eax,4          ; sys_write
    mov ebx,1          ; stdout
    int 0x80

    mov eax,1          ; sys_exit
    xor ebx,ebx
    int 0x80
