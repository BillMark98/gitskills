
section     .text
global     main
extern printf

main:

    ; add your test code here

    ; print dummy message
    mov ecx, 1
L0:
    cmp ecx, n
    ja L1
    mov eax, [fak]
    mul ecx ; eax = eax * ecx
    mov DWORD [fak], eax
    add ecx, 1
    jmp L0

L1:

    push eax
    push msg
    call printf
    add esp, 8
    ; mov eax, 4
    ; mov ebx, 1
    ; mov ecx, msg
    ; mov edx, len
    ; int 80h


    mov     ebx,0
    mov     eax,1
    int     0x80                              ; return value of main

section     .data

msg     db  'Hello, world! fak %d',0xa,0      ;our dear string
len     equ $ - msg                    ;length of our dear string
n       equ 10
fak     dd 1
