SECTION .data
a dd 0xFFFFFFFF
b dd 0x7FFF
ergebnis dq 0
msg db "The result of %d * %d is %ld",10,0
SECTION .text
global main
extern printf
main:
  push ebp
  mov ebp, esp
  push ebx
  mov edx, 1
  push edx
  mov eax, DWORD[a]
  mov ecx, DWORD[b]
  imul ecx
  jo error
  mov dword[ergebnis],eax
  jmp ende
error:
  mov dword[ergebnis], eax
  mov dword[ergebnis+4],edx
ende:
  mov eax, DWORD[a]
  pop edx

  ;push QWORD ergebnis
  push DWORD [ergebnis+4]
  push DWORD [ergebnis]
  push ecx
  push eax
  push msg
  call printf
  add esp,20
  pop ebx
  pop ebp
  mov eax, 1
  mov ebx, 0
  int 0x80
