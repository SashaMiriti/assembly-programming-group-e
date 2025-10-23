; JO → Jump if Overflow
section .data
    msg_ov db "Hello, this is Sasha Miriti, Admission No: 166394 (Overflow occurred, OF=1)",10,0
    msg_noov db "Hello, this is Sasha Miriti, Admission No: 166394 (No overflow, OF=0)",10,0

section .text
    global _start
_start:
    mov ax,4
    add ax,1       ; 
    jo overflow

    mov ecx, msg_noov
    jmp print

overflow:
    mov ecx, msg_ov

print:
    mov eax,4
    mov ebx,1
    mov edx,100      ; max length of string
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
