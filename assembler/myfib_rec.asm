SECTION .data
N dd 10
teststr DB "The result is %d", 10,0
SECTION .text
global main
extern printf
; main:
;     push ebp
;     mov ebp, esp
;     mov ecx, dword[N]
;     mov eax, 0
;     push ecx
;     push eax
;     call fib
;     pop eax; an
;     pop ecx; 
;     jmp Ende
; fib:
;     push ebp
;     mov ebp, esp
;     mov ecx, [ebp + 12]; the n 
;     cmp ecx, 1  
;     jle Trivial
;     dec ecx
;     push ecx
;     push eax
;     call fib
;     mov ecx,[ebp+12]; refresh the value of ecx which is n
;     sub ecx,2
;     ;mov eax, dword[ebp + 8]
;     push ecx
;     push eax; an-1
;     call fib
;     pop ecx ; get an-1
;     pop edx; get n-1
;     pop eax ;  get an-2
;     pop edx; get n-2
;     add eax, ecx; get an
;     mov dword[esp+8], eax
;     pop ebp
;     ret

; Trivial:
;     mov dword[ebp+8], ecx
;     pop ebp
;     ;pop esi
;     ;push ecx; the value of the ecx-th term a1 or a0
;     ;push esi ; return address
;     ret 

;  Ende:
;     push eax
;     push teststr
;     call printf
;     add esp, 8
;     pop ebp
;     mov eax, 1
;     mov ebx, 0
;     int 80h
main:
    push ebp
    mov ebp, esp
    mov edx, dword[N]
    push edx
    call fib
    jmp exit
fib:
    push ebp
    mov ebp, esp
    push ebx

    mov edx, dword[ebp + 8]
    cmp edx, 1
    ja recursive
    je ret1
    mov eax, 0
    jmp ende 
ret1:
    mov eax, 1
    jmp ende
recursive:
    dec edx
    push edx
    call fib
    add esp, 4
    mov ebx, eax
    mov edx, dword[ebp+8]
    sub edx, 2
    push edx
    call fib
    add esp, 4
    add eax, ebx
ende:
    pop ebx
    pop ebp
    ret
exit:
    pop edx
    push eax
    push teststr
    call printf
    add esp, 8
    mov eax, 1
    mov ebx, 0
    int 80h