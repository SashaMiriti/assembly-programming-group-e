; JC → Jump if Carry
section .data
    msg_carry db "Hello, this is Sasha Miriti, Admission No: 166394 (Carry occurred)",10,0
    msg_carry_len equ $ - msg_carry

    msg_nocarry db "Hello, this is Sasha Miriti, Admission No: 166394 (No carry)",10,0
    msg_nocarry_len equ $ - msg_nocarry

section .text
    global _start
_start:
    mov ax,5     ; 
    add ax,1          ; 5 + 1 = 6 -> no carry
    jc carry

    mov ecx, msg_nocarry
    mov edx, msg_nocarry_len
    jmp print

carry:
    mov ecx, msg_carry
    mov edx, msg_carry_len

print:
    mov eax, 4        ; sys_write
    mov ebx, 1        ; stdout
    int 0x80

    mov eax, 1        ; sys_exit
    xor ebx, ebx
    int 0x80
