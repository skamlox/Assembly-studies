org 100h

mov ax,0900h
mov dx,string
int 21h
ret
string ; the string goes here
db "Hello, DOS!$"
