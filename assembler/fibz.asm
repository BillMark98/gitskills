;32bit fib funktion
SECTION .data
;  n DD 5
;n wird durch funktionaufruf von Main uebergegeben

SECTION .text
  global fib
;TODO Parameter Uebergabe fuer fib,naemlich n.
fib:
  push ebp
  mov ebp,esp
  push ebx
  mov ebx,[ebp+8]
  cmp ebx,1
  jg L1
  jz L2
  mov eax,0
  jmp ende
L2:
  mov eax,1
  jmp ende
L1:
  dec ebx
  push ebx
  call fib
  pop ebx
  mov edx,eax

  ;push edx
  ; must push edx here, since edx would be changed
  ; by the next call of function
  ; what's further the edx would be 1 by the end of the
  ; loop:
  ; for case 2 : a2 = a1 + a0. In the end, edx would be not
  ; be change by the call of f(0) so edx holds the value after the first
  ; call of the function which is a1 = 1;
  ; for case 3: a3 = a2 + a1. after f(2), edx = a2 = 1,after f(1)
  ; edx still doesn't change, edx = 1 eax = a3 = a2 + a1 = edx + eax = 2 which
  ; is correct
  ; for case 4: a4 = a3 + a2, after f(3), edx = a3 = 2, after f(2), edx is m
  ; modified by the subroutine call in f(2) edx = 1, so in the end, edx = 1,
  ;eax = a2 = 1, a4 = edx+eax= 2
  ; for case 5 : a5 = a4 + a3, after f(4), edx = a4 = 2, after f(3),edx = 1,
  ; eax = 2, so a5 = eax + edx = 3
  ; for case 6 after f(4), edx = 1, eax = 2, so
  ; we can figure out that edx = 1, for every n >= 3,
  ; and by induction when n is odd, say 2k-1 then an = a_{2k-1} = k
  ; and n = 2k an = a_{2k} = k
  dec ebx
  push ebx
  call fib
  pop ebx
  ;pop edx
  add eax,edx
;TODO rekursive addieren

;UEBERLAUF:
;  mov eax , 0
;  jmp ende

ende:
  pop ebx
  mov esp,ebp
  pop ebp
  ret

;schleife: bis n erreichen
;xchg eax,edx
;add eax,edx
;adc (eax=eax+edx+CF)
;jc Fehler


;resb reserve byte xxx =>a=int[]
