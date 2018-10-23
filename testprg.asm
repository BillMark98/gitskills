SECTION .data
  a DD 1;

SECTION .text
  global main
main:
  mov eax,  dword[a];
  mov ecx,  0
  mov ebx,  eax
  mul ebx;
  add ecx,  ebx
  add eax, 1;
  
  cmp eax, 100;
  jg ende
  jmp main
ende:
  mov ebx,  0
  mov eax,  1
  int 0x80
