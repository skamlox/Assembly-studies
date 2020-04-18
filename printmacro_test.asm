%macro print 1; Prints a string with the DOS API, requires $ terminated string
	jmp %%printmacro_code
	%%printmacro_string: db %1
	%%printmacro_code:
	mov ax,0900h
	mov dx, %%printmacro_string
	int 21h
%endmacro

org 100h ; For DOS .com compatibility
print "Hello there!\n$" ; Prints string
print "How are you?\n$" ; Prints another string
ret ; Returns to DOS
