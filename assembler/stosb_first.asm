SECTION .bss
BUFFSIZE equ 16
Buff resb BUFFSIZE
SECTION .text
global main
main:
    push ebp
    mov ebp, esp
Initial:
    cld
    mov eax, '1'
    mov edi, Buff
    mov ecx, BUFFSIZE
    rep stosb
    call Write
No_rep:
    xor eax, eax
    mov al, '1'
    mov ecx, BUFFSIZE
    mov edi, Buff
Do_r:
    stosb
    add al, '1'
    aaa
    add al, '0'
    loop Do_r
    mov byte[Buff], 10
    call Write
Exit:
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 80h

Write:
    mov eax, 4
    mov ebx, 1
    mov ecx, Buff
    mov edx, BUFFSIZE
    int 80h
    ret