SECTION .text
global main
main:
push ebp
mov ebp, esp
mov eax, 1
mov ebx, 2
pushad
pop eax
pop ebx
pop ecx
push ecx
push ebx
push eax
popad
pushf
pop ax
pushfd
pop eax
ende:
pop ebp
mov eax, 1
mov ebx, 0
int 0x80