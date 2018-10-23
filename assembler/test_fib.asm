SECTION .data
msg_true db "The number %d is the %d-th term fib", 10,0
msg_false db "The number isn't fib", 10,0
N dd 0
testnum dd 55
SECTION .text
global main
extern printf
main:
    push ebp
    mov ebp, esp
    mov ecx, 0
    mov eax, 0
    mov ebx, 1
    mov edx, dword[testnum]
Loop:
    cmp eax, edx
    jg testfalse
    je testtrue
    xchg eax, ebx
    add ebx, eax
    inc ecx
    jmp Loop
testfalse:
    push msg_false
    call printf
    add esp, 4
    jmp Ende
testtrue:
    push eax
    push ecx
    push msg_true
    call printf
    add esp, 12
Ende:
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 80h