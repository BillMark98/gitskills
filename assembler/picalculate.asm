SECTION .data
align 16
step dq 0.01,0.01
two dq 2.0,2.0
koeff dq 0.5,1.5
numdouble dq 100.0,100.0
four dq 4.0,4.0
one dq 1.0,1.0
var dd 14
SECTION .bss
sum resb 8
number equ 100
SECTION .text
global main
extern printf
main:
    push ebp
    mov ebp, esp

    xorpd xmm0, xmm0
    xor ecx, ecx
    movapd xmm2, [koeff]
L1:
    cmp ecx, number
    jg L2
    xorpd xmm3, xmm3
    movapd xmm3, xmm2
    mulpd xmm3, [step] ; ((k+0.5)*step)
    mulpd xmm3, xmm3; ((k+0.5)*step)^2
    addpd xmm3, [one]
    movapd xmm1,[four]; 4
    divpd xmm1, xmm3; 4/(1 + ((k+0.5)*step)^2)
    mulpd xmm1, [step]
    addpd xmm0, xmm1
    addpd xmm2, [two]
    add ecx, 2
    jmp L1
L2:
    xorpd xmm3, xmm3
    ; movsd xmm3, xmm0
    addsd xmm3, xmm0
    shufpd xmm0,xmm0, 0x01
    addsd xmm3,xmm0
    movsd [sum], xmm3
Ende:
    pop ebp
    mov eax, 1
    mov ebx, 0
    int 80h