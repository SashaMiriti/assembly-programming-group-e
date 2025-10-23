; JB / JNAE → Jump if Below

section .data
    msg_below db "Hello, this is Sasha Miriti, Admission No: 166394 (AX < BX, Below)",10,0
    len_below equ $ - msg_below

    msg_not_below db "Hello, this is Sasha Miriti, Admission No: 166394 (AX >= BX, Not Below)",10,0
    len_not_below equ $ - msg_not_below

section .text
    global _start
_start:
    mov ax,2
    mov bx,5
    cmp ax,bx
    jb below

    mov ecx, msg_not_below
    mov edx, len_not_below
    jmp print

below:
    mov ecx, msg_below
    mov edx, len_below

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
