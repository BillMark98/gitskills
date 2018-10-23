SECTION .data
N DD 7
msg DB "The fib number is %d", 10, 0
SECTION .text
global fibr
global main
extern printf
fibr:
  push ebp
  mov ebp, esp
  push ebx
  mov ecx, [ebp+8]; ecx stores the value of the current number of n
  cmp ecx,2
  jge recursive;
trivial:
  mov eax, 1; a0 = a1 = 1
  jmp ende;
recursive:
  dec ecx;
  push ecx;
  call fibr; calculates a_{n-1}
  add esp, 4; delete the ecx;
  push eax; save the value of a_{n-1}
  ;dec ecx
  mov ecx,[ebp+8]
  sub ecx, 2
  push ecx;
  call fibr;
  mov edx,[esp + 4]; save the a_{n-1} value
  add eax, edx
  add esp,8
ende:
  pop ebx
  pop ebp
  ret
main:
  push ebp
  mov ebp, esp
  push DWORD[N]
  call fibr
  add esp, 4
  push eax
  push msg
  call printf
  add esp,8
  pop ebx
  pop ebp
  mov ebx, 0
  mov eax, 1
  int 0x80
