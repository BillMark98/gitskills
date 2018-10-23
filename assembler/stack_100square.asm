SECTION .data
N DB 100
msg  DB	 "The result is %d",0xa,0 ; 0xa 一定要有，为的是告诉系统这个一定要打印出来，否则只会在buffer里面

SECTION .text
global main
extern printf
main:
	mov ecx, 1
	mov eax, 1

L1:
  cmp ecx, [N]
  jg L2
  mov eax, ecx
  imul eax, eax
  push eax
  inc ecx
  jmp L1
L2:
  mov eax, 0
  dec ecx
L3:
  cmp ecx, 0
  jle L4
  pop edx
  add eax, edx
  dec ecx
  jmp L3
L4:
  push eax
  push msg
  call printf
  add esp, 8
ende:
  mov ebx, 0
  mov eax, 1
  int 0x80
