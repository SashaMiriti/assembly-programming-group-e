; JNP / JPO → Jump if Parity Odd

section .data
    msg_even db "Hello, this is Sasha Miriti, Admission No: 166394 -> Parity Even (PF=1)",10,0
    msg_even_len equ $ - msg_even

    msg_odd  db "Hello, this is Sasha Miriti, Admission No: 166394 -> Parity Odd (PF=0)",10,0
    msg_odd_len equ $ - msg_odd

section .text
    global _start
_start:
    mov al,7        ;
    test al,al
    jnp odd         ; Jump if NOT Parity (i.e. PF=0, odd parity)

    ; If parity even
    mov ecx, msg_even
    mov edx, msg_even_len
    jmp print

odd:
    mov ecx, msg_odd
    mov edx, msg_odd_len

print:
    mov eax,4       ; sys_write
    mov ebx,1       ; stdout
    int 0x80

    mov eax,1       ; sys_exit
    xor ebx,ebx
    int 0x80
