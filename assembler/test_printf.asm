SECTION .data
teststr DB      "Hello Welt!", 10,0

SECTION .text
global hallo
extern printf
hallo:
    push ebp
    mov ebp, esp

    push teststr
    call printf
    add esp, 4

    push dword[esp + 8]
    call printf add esp,4
    pop ebp
    ret
