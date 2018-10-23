SECTION .text
global main
main:
    mov eax, 0x1
    mov ebx, 0x11
    test ax, 0x1
    test bx, 0x11
    test ax, 0x8
    test bx, 0x81
    test bx, 0x8
    ; lea ecx,[ebx * 10]
    lea ecx,[ebx * 2]
    lea ecx,[ecx*4 + ecx]
    mov eax, 1
    mov ebx, 0
    int 80h