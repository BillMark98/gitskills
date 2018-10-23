SECTION .data
mysum dq 0
SECTION .text
extern step, sum, num_steps, four, two, one, ofs
global calcPi_SSE
calcPi_SSE:
;  we know the integral of 4/(1+x^2), x goes from 0 to 1 equals to pi
;  using numerical method (riemann sum) to calculate the approximate 
;  value of pi
    push ebp
    mov ebp, esp ; calling convention

    xor ecx, ecx
    xorpd xmm0, xmm0
    movsd xmm1, [step]
    shufpd xmm1, xmm1, 0x0 
    movapd xmm2, [ofs] ; xmm2 equals {0.5, 1.5}
L1:
; 
; for (ecx = 0; ecx < num_stemps; ecx + 2){
;    xmm40 = 1 + [(0.5 + ecx)*step]^2 // xmm40 stands for the double at the lower address of xmm4
;    xmm41 = 1 + [(1.5 + ecx)*step]^2 // xmm41 stands for the double at the higher address of xmm4
;    xmm30 = 4/xmm40
;    xmm31 = 4/xmm41
;    xmm0 += xmm31      }

    cmp ecx, [num_steps] 
    jge L2

    movapd xmm4,xmm1
    mulpd xmm4, xmm2

    mulpd xmm4, xmm4
    addpd xmm4, [one]
    movapd xmm3,[four]
    divpd xmm3, xmm4

    addpd xmm0, xmm3
    addpd xmm2, [two]
    add ecx, 2
    jmp L1
L2:
    xorpd xmm3, xmm3
    addsd xmm3, xmm0
    shufpd xmm0, xmm0, 0x01
    addsd xmm3, xmm0 ; adding xmm01 and xmm00 to get the whole riemann sum
    movsd [sum], xmm3
    movsd [mysum], xmm3
    pop ebp
    ret