org 100h; for .com compatibility

; sets video mode
mov ax,0013h
int 10h

; configures drawing routines
mov ah,0ch
mov al,00h
mov bx,0000h
mov dx,0010d
mov cx,10

forloop: ; for loop in assembly

int 10h ; draw pixel and increment values
inc cx
inc al

cmp cx,310d ; if > 310 end program
jge ender

cmp al,255 ; if > 255 reset colour to 0
jg resetcol


jmp forloop

resetcol: ;set colour to 0
mov al,0
jmp forloop

ender: ; hangs the system to view results
jmp $

