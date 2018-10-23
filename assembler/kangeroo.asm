SECTION .data
snippet db "KANGEROO", 0
msg db "message : %s",10,0
SECTION .text
global main
extern printf
main:
  push ebp
  mov ebp, esp
  mov ebx, snippet
  mov eax, 8
DOMORE:
  add byte[ebx],32
  inc ebx
  dec eax
  push ebx
  push eax
  push snippet
  push msg
  call printf
  add esp,8
  pop eax
  pop ebx
  cmp eax,0
  jnz DOMORE
ende:
  add esp,8
  pop ebp
  mov eax,1
  mov ebx,0
  int 0x80
