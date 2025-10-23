; JP / JPE → Jump if Parity Even
section .data
    msg_even db "Hello, this is Sasha Miriti, Admission No: 166394 (Parity Even, PF=1)",10,0
    len_even equ $ - msg_even

    msg_odd  db "Hello, this is Sasha Miriti, Admission No: 166394 (Parity Odd, PF=0)",10,0
    len_odd  equ $ - msg_odd

section .text
    global _start
_start:
    mov al,7       ; 00000111b → 3 ones → odd parity
    test al,al
    jp even

    mov ecx, msg_odd
    mov edx, len_odd
    jmp print

even:
    mov ecx, msg_even
    mov edx, len_even

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
