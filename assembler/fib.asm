SECTION .data
teststr DB "The result is %d", 10,0
SECTION .text
global fib
extern printf
fib:
  push ebp ; save value of ebp
  mov ebp, esp
  push ebx;
  ; push dword[ebp+8]; the actual para x from main
  mov ecx, [ebp+8]; ecx saves the value of x
  mov eax,1
  cmp ecx,2 ; a1 = a2 = 1 according to the definition of fibonacci numbers
  jle ende
  mov ebx, 1
  mov edx, 1
L1:
; for (i = 3; i < n ; i++)
; // eax is a_{n}, edx = a_{n-1},ebx = a_{n-2}
;// a_{n} = a_{n-1} + a_{n-2}
; { eax = edx + ebx;
;    ebx = edx;
;    edx = eax; }
  cmp ecx, 3
  jl ende
  dec ecx
  add ebx, edx
  mov eax, ebx
  mov ebx, edx
  mov edx, eax
  jmp L1
ende:
  push eax
  push teststr
  call printf  ; print out the result
  mov eax, [esp+4]
  add esp, 8;
  pop ebx
  pop ebp
  ret


  ;pop edx
  ;push eax
  ;push edx




