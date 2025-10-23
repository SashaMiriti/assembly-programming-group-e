; JS → Jump if Sign
section .data
    msg_neg db "Hello, this is Sasha Miriti, Admission No: 166394 (Negative)",10,0
    msg_neg_len equ $ - msg_neg

    msg_pos db "Hello, this is Sasha Miriti, Admission No: 166394 (Positive)",10,0
    msg_pos_len equ $ - msg_pos

section .text
    global _start
_start:
    xor eax, eax       ; clear eax (all 32 bits)
    mov ax, -5          ; try changing between 5 and -5
    test ax, ax
    js negative

    mov ecx, msg_pos
    mov edx, msg_pos_len
    jmp print

negative:
    mov ecx, msg_neg
    mov edx, msg_neg_len

print:
    mov eax, 4
    mov ebx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
