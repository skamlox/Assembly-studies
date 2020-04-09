org 100h

mov ax,0013h
int 10h

mov ax,0c04h
mov bx,0000h
mov cx,0016
mov dx,0016
int 10h

jmp $
