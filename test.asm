SECTION .text
global main

main:
        mov eax, 1
        mov ebx, 2
        add eax, ebx

        cmp eax, ebx
        jl ende
ende:
        mov ebx, 0
        mov eax, 1
        int 0x80
