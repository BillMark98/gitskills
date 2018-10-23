SECTION .bss
BUFFSIZE equ 16
Buff resb BUFFSIZE
SECTION .data
Hexstr db " 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00", 10
HEXLEN equ $-Hexstr

Digits db "0123456789ABCDEF"
SECTION .text
global main
main:
    push ebp
    mov ebp, esp
Read:
    mov eax, 3 ; Read 16 bytes from file
    mov ebx, 0
    mov ecx, Buff
    mov edx, BUFFSIZE
    int 80h
    mov ebp, eax; save # of bytes read from file for later
    cmp eax, 0
    je Ende; read EOF sign
    xor ecx, ecx
    mov esi, Buff
L1:
    mov edi, ecx
    shl edi, 1
    add edi, ecx; edi = 3*ecx

    xor eax, eax
    mov al, byte[esi + ecx]
    mov ebx, eax

    and al, 0Fh
    mov al, byte[Digits + eax]
    mov byte[Hexstr + edi + 2],al

    and bl, 0F0h
    shr ebx, 4
    ; shr bl,4
    mov bl, byte[Digits + ebx]
    mov byte[Hexstr + edi + 1], bl

    inc ecx
    cmp ecx, ebp
    jna L1
L2:
    mov eax, 4
    mov ebx, 1
    mov ecx, Hexstr
    mov edx, HEXLEN
    int 80h
    jmp Read

Ende:
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 80h
