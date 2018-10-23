SECTION .bss
Buff resb 1
SECTION .text
global main
main:
    push ebp
    mov ebp, esp
Read:
    mov eax, 3
    mov ebx, 0
    mov ecx, Buff
    mov edx, 1
    int 0x80
Test:
    cmp eax, 0
    je Exit

    cmp byte[Buff], 61h
    jb Write
    cmp byte[Buff], 7Ah
    ja Write
    sub byte[Buff], 20h  ; in this case the character is lowercase
Write:
    mov eax, 4
    mov ebx, 1
    mov ecx, Buff
    mov edx, 1
    int 0x80
    jmp Read
Exit:
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 0x80