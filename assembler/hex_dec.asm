SECTION .data
hexbase dd 16
decbase dd 10
HEXLEN equ 8
DECLEN equ 10
LENSTRU equ HEXLEN + 1 + DECLEN + 1
msg db "The number %d is hexa  %s aha  %s", 10,0
number dd 42
SECTION .text
global main
extern printf
extern malloc
extern free
main:
    push ebp 
    mov ebp, esp
    mov ecx, dword[number]
    push ecx
    call convert
    jmp ende
convert:
    push ebp
    mov ebp ,esp
    push ebx
    push dword LENSTRU
    call malloc
    add esp, 4
    mov ebx, eax; address in ebx
    mov eax, [ebp + 8]; number in eax
    mov ecx, HEXLEN
    ; mov edx, 0
hexcon:
    mov edx, 1
    div dword[hexbase]
    cmp edx, 10
    jl hexnoletter
    add edx, 0x37
    jmp hexweiter
hexnoletter:
    add edx, 0x30
hexweiter:
    mov byte[ebx + ecx -1], dl
    loop hexcon
    mov byte[ebx + HEXLEN], 0
    mov eax, [ebp + 8]
    mov ecx, DECLEN
deccon:
    mov edx, 0
    div dword[decbase]
    add edx, 0x30
    mov byte[ebx + HEXLEN + ecx], dl
    loop deccon
    mov byte[ebx + HEXLEN + 1 + DECLEN],0
    mov eax, ebx
    pop ebx 
    pop ebp
    ret
ende:
;     mov byte[eax + HEXLEN],0
;     mov byte[eax + 1 + HEXLEN + DECLEN],0
;     mov ecx, eax
;     add eax, HEXLEN + 1
;     push eax
;     push ecx
;     push dword[ebp - 4]
    add esp, 4
    ; mov ecx, eax
    ; add ecx, HEXLEN + 1
    lea ecx, [eax+HEXLEN+1]
    push ecx
    push eax
    push dword[number]
    push msg
    call printf
    add esp, 8
    call free
    add esp, 8
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 80h
    

