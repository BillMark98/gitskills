SECTION .data
msg db "the result : %d",10,0
koeff dd 33, 2, 7
N equ ($-koeff)/4
x dd 4
SECTION .text
global main
extern printf
main:
    push ebp
    mov ebp, esp
    mov edx, N
    sub edx, 1
    mov ecx, 1
    mov ebx, dword[x]
    mov eax, [koeff]
Loop:
    cmp ecx, N
    je Ende
    imul ebx
    add eax, [koeff + ecx*4]
    inc ecx
    jmp Loop
Ende:
    push eax
    push msg
    call printf
    add esp, 8
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 80h
    