org 100h; for .com compatibility

; sets video mode
mov ax,0013h
int 10h

; configures drawing routines
mov ax,0c04h
mov bx,0000h
mov dx,0010d
mov cx,10

forloop: ; for loop in assembly

int 10h
inc cx

cmp cx,310d
jge ender

jmp forloop

ender: ; hangs the system to view results
jmp $

