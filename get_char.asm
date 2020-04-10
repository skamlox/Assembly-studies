; tests reading keyboard behaviour and character print behaviour

org 100h

mov ax,0000h  ; get character
int 16h

mov [keypress],ax ; moves character

mov ah,0eh ; teletype prints character
mov al,[keypress]
mov bx,0003h

jmp $ ; hold system

keypress: db 0
