bits 16

global __start

__start:
	mov ax,0900h
	mov dx,string
	int 21h
	mov ax,4c00h
	int 21h

	string: db "Hello, DOS!$"
