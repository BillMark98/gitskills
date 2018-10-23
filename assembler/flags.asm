SECTION .text
global main
main:
  push ebp
  mov ebp, esp
  mov eax, 0FFFFFFFFh
  mov ebx, 02Dh
  dec ebx
  inc eax
  mov eax, 0x5
  mov ebx, 0x3
  sub eax, ebx

ende:
  pop ebp
  mov eax, 1
  mov ebx, 0
  int 0x80

;after mov ebx, 02Dh
;eflags         0x296	[ PF AF SF IF ]
;after dec ebx   ebx, 02Ch
;eflags         0x202	[ IF ]
;after inc eax    eax, 0
;eflags         0x256	[ PF AF ZF IF ]
