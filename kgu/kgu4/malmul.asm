SECTION .text
extern A,B,C
global malmul
malmul:
; ebp + 8  M
; ebp + 12 N
; ebp + 16 i
; ebp + 20 j

    push ebp
    mov ebp, esp

    xor ecx, ecx
    xorpd xmm0,xmm0
    xorpd xmm1, xmm1
    xorpd xmm2, xmm2
    xorpd xmm3, xmm3
    mov eax, [A]
    mov eax,[eax]; eax = A[0]
    mov ebx, [B]
    mov ebx, [ebx]
L1:
    mov edx,[ebp + 8]
    dec edx; edx = M-1
    cmp ecx,edx
    jg Top
    je Revise
    mov esi, [ebp + 16]; esi = i
    mov edi, [ebp + 8]; edi = M
    imul esi, edi; esi = i*M
    add esi, ecx
    movupd xmm1, [eax + 8 * esi]
    ; xmm1[0] = A[i][k]
    ; xmm1[1] = A[i][k+1]
    mov esi, [ebp + 20]; esi = j
    mov edi, [ebp + 12]; edi = N
    imul edi, ecx; edi = k * N
    add edi, esi;  edi = k*N + j
    movsd xmm2, [ebx + edi * 8]
    add edi, [ebp + 12]; edi = (k+1)N + j
    movsd xmm3, [ebx + edi*8]
    shufpd xmm2, xmm3, 0x00
    mulpd xmm1, xmm2
    addpd xmm0,xmm1
    add ecx,2
    jmp L1
Revise:
; just one term left
    xorpd xmm1, xmm1
    xorpd xmm2, xmm2 
    mov esi,[ebp + 16]; esi = i
    mov edi, [ebp + 8]; edi = M
    imul esi, edi; esi = i*M
    add esi, ecx; esi = i*M +ecx
    movsd xmm1,[eax + 8*esi]
    mov esi,[ebp + 20] ; esi = j
    mov edi, [ebp + 12]; edi = N
    imul edi, ecx; edi = ecx * N = (M-1)*N
    add edi, esi; edi = (M-1)*N + j
    movsd xmm2, [ebx + 8 * edi]
    addsd xmm1, xmm2
    addsd xmm0,xmm1
Top:
    xorpd xmm1, xmm1
    shufpd xmm1, xmm0, 0x01
    addsd xmm0,xmm1
    mov ebx, [C]
    mov ebx, [ebx] ; ebx = C[0]
    mov esi, [ebp + 12]; esi = N
    mov edi, [ebp + 16]; edi = i
    imul esi, edi; esi = N*i
    mov edx, [ebp + 20]; edx = j
    add esi, edx; esi = i*N + j
    movsd [ebx + esi * 8], xmm0

Ende:
    pop ebp
    ret


