SECTION .text
global main
main:
  push ebp
  mov ebp, esp
  mov eax, 0
  mov ax, -42
  mov ebx, eax
  mov ax, -42
  movsx ebx,ax
  mov eax, 0
  mov al,100
  mov ebx,2
  mul bl
  mov eax, 0xffff
  mul bx
  mov eax, 0xffff
  div bx
  mov eax, 0xa
  mov ebx,3
  div bl
  xor eax, eax
  mov eax, 42
  neg eax
  xchg eax,ebx
  mov eax, 12
  xchg ax,dx
  mov eax,0
  mov ebx,0
  mov ecx, 0
  mov ax, 067FEh
  mov bx, ax
  mov cl,bh
  mov ch,bl
  xchg cl,ch

ende:
  pop ebp
  mov ebx, 0
  mov eax, 1
  int 0x80
