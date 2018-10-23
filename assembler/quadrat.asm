SECTION .data
num db 100
SECTION .text
global main
main:
    push ebp
    mov ebp, esp
    mov ecx, dword[num]
    mov ebx, 0
Loop:
    mov eax, ecx
    mul eax
    add ebx, eax
    loop Loop
Exit:
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 80h

