SECTION .bss
COL equ 16
ROW equ 2
BUFSIZE equ COL * ROW
Buff resb BUFSIZE
SECTION .data
Datastring db "0123456789ABCDEF"
SECTION .text
global main
main:
    push ebp
    mov ebp, esp
    mov ecx, ROW
Write_source:
    cld
    mov esi, Datastring
    mov edi, Buff
    mov ecx, COL
    rep movsb
Write_destin:
    mov esi, Buff
    mov edi, Buff+COL
    mov ecx, COL
    rep movsb
Write:
    mov eax, 4
    mov ebx, 1
    mov ecx, Buff
    mov edx, BUFSIZE
    int 80h
Exit:
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 80h