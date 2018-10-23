SECTION .text
extern printf
global main
main:
  push ebp
  mov ebp, esp
  mov eax, 0xF0000000
  mov ecx, 0x70000000
  ;inc ecx
  cmp eax,ecx
  push eax
  push ecx
  sub eax, ecx
  pop ecx
  pop eax
  ;sub eax,ecx
  jg greater
  push eax
  push ecx
  push msg3
  call printf
  add esp,4
  pop ecx
  pop eax
  cmp eax, ecx
  ja above
  push msg4
  call printf
  add esp,4
  jmp ende
  jnz notzero
  push msg2
  call printf
  add esp,4
  jmp ende
greater:
  push msg5
  call printf
  add esp,4
  jmp ende
above:
  push msg6
  call printf
  add esp,4
  jmp ende
notzero:
  push msg1
  call printf
  add esp, 4
ende:
  pop ebp
  mov ax,-42
  movsx ebx, ax
  mov ebx, 0
  mov eax, 1
  int 0x80

SECTION .data
;a unsigned 1
msg1 db "The msg1 is printed. notzero.", 10, 0
msg2 db "msg2 is printed, not jump.",10,0
msg3 db "msg3 , not greater",10,0
msg4 db "msg4, not above", 10,0
msg5 db "msg5, greater",10,0
msg6 db "msg6, above", 10,0
