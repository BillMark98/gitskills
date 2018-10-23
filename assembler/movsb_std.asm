SECTION .data
Datastring db 'abcdefghijklm             '
Strnlen equ $-Datastring
Endpos equ 12
intrapos equ 5

SECTION .text
global main
main:
    push ebp
    mov ebp, esp

Write:
    cld
    mov ebx, Datastring + intrapos
    mov esi, Datastring + Endpos
    mov edi, Datastring + Endpos + 1
    mov ecx, Endpos - intrapos + 1
    rep movsb
    mov byte[ebx], ' '
Write2:
    mov eax, 4
    mov ebx, 1
    mov ecx, Datastring
    mov edx, Strnlen
    int 80h
Exit:
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 80h