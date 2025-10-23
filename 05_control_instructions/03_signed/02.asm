; JGE / JNL → Jump if Greater or Equal

section .data
    msg_ge db "Hello, this is Sasha Miriti, Admission No: 166394 (AX >= BX, Signed Greater or Equal)",10,0
    len_ge equ $ - msg_ge

    msg_less db "Hello, this is Sasha Miriti, Admission No: 166394 (AX < BX, Signed Less)",10,0
    len_less equ $ - msg_less

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jge ge_label

    ; AX < BX
    mov ecx, msg_less
    mov edx, len_less
    jmp print

ge_label:
    ; AX >= BX
    mov ecx, msg_ge
    mov edx, len_ge

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
