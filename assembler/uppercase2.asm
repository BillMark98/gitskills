SECTION .bss
    BUFFSIZE equ 1024
    Buff resb BUFFSIZE
SECTION .text
global main
main:
    push ebp
    mov ebp, esp
Read:
    mov eax, 3 ; call sys_read 
    mov ebx, 0 ; file descriptor stdin
    mov ecx, Buff; the address to be written in
    mov edx, BUFFSIZE; read as much as the Buff can hold
    int 80h
    mov esi, eax;  save the returned value
Test1:
    cmp eax, 0
    je Exit
Test2:
    mov ecx, esi; copy value from esi to ecx
    mov ebp, Buff;
    dec ebp
Loop:   
    cmp byte[Buff-1+ecx], 61h
    jb Test3
    cmp byte[Buff-1+ecx], 7Ah
    ja Test3
    sub byte[Buff-1+ecx], 20h
Test3:
    dec ecx
    jnz Loop
Write:
    mov eax, 4 ; call sys_write
    mov ebx, 1 ; file descriptor stdout
    mov ecx, Buff
    mov edx, esi
    int 80h
    jmp Read
Exit:
    pop ebp
    mov eax, 1; call sys_exit
    mov ebx, 0 ; return 0
    int 80h